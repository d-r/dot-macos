--------------------------------------------------------------------------------
-- SPOONS
--
-- https://github.com/Hammerspoon/hammerspoon/blob/master/SPOONS.md#what-is-a-spoon

-- Generate EmmyLua annotations for Hammerspoon and installed Spoons.
-- https://www.hammerspoon.org/Spoons/EmmyLua.html
hs.loadSpoon("EmmyLua")

--------------------------------------------------------------------------------
-- HELPERS

local fn = hs.fnutils
local inspect = hs.inspect.inspect
local show = hs.alert.show
local bind = hs.hotkey.bind

local function identity(x)
    return x
end

local function pr(x)
    show(inspect(x))
end

--------------------------------------------------------------------------------
-- COMMANDS
--
-- Partially applied functions to be used in keybindings.

-- APPS

local function launch(app_name)
    return function()
        hs.application.launchOrFocus(app_name)
    end
end

local function toggle_app(name)
    return function()
        local app = hs.application.find(name)
        if not app or app:isHidden() then
            hs.application.launchOrFocus(name)
        elseif hs.application.frontmostApplication() ~= app then
            app:activate()
        else
            app:hide()
        end
    end
end

-- WINDOWS

local function modify_focused_window(f)
    return function()
        local w = hs.window.focusedWindow()
        if w then f(w) end
    end
end

local function reframe(f)
    return modify_focused_window(function(w)
        local bounds = w:screen():frame()
        w:setFrame(f(bounds))
    end)
end

local snap_to_left_half = reframe(function(b)
    return { b.x, b.y, b.w / 2, b.h }
end)

local snap_to_right_half = reframe(function(b)
    local w = b.w / 2
    return { b.x + w, b.y, w, b.h }
end)

local maximize = reframe(identity)

-- MENU

local function show_menu(get_items, on_select)
    return function()
        local choices = {}
        for k, v in pairs(get_items()) do
            table.insert(choices, { text = k, subText = v })
        end

        local function on_completion(choice)
            if choice ~= nil then
                on_select(choice.subText)
            end
        end

        hs.chooser.new(on_completion):choices(choices):show()
    end
end

local function load_json(path)
    return function()
        return hs.json.read(path)
    end
end

local function paste(text)
    hs.pasteboard.writeObjects(text)
    hs.eventtap.keyStrokes(text)
end

local function open_url(url)
    hs.execute("open " .. url)
end

--------------------------------------------------------------------------------
-- KEYBINDINGS

-- The Hyper key. All the modifiers at once. I map it to Caps Lock using
-- Karabiner-Elements.
local hyper = { "ctrl", "alt", "cmd", "shift" }

bind(hyper, "r", hs.reload)

bind(hyper, "y", launch("Firefox"))
bind(hyper, "u", launch("Brave Browser"))
bind(hyper, "i", launch("RustRover"))
bind(hyper, "o", launch("Obsidian"))
bind(hyper, "p", launch("Visual Studio Code"))
bind(hyper, "\\", toggle_app("kitty"))

bind(hyper, "left", snap_to_left_half)
bind(hyper, "right", snap_to_right_half)
bind(hyper, "return", maximize)

bind(hyper, "v", show_menu(load_json("~/data/snippets.json"), paste))
bind(hyper, "b", show_menu(load_json("~/data/bookmarks.json"), open_url))

show("Hammerspoon config loaded")
