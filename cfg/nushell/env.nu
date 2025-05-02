$env.PROMPT_COMMAND_RIGHT = ""

mkdir ~/.cache
zoxide init nushell | save --force ~/.cache/zoxide.nu
carapace _carapace nushell | save --force ~/.cache/carapace.nu
