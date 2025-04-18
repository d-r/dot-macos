$env.config.show_banner = false
$env.config.use_kitty_protocol = true
$env.config.filesize.unit = "metric"

alias c = clear
alias e = ^($env.EDITOR)
alias gc = git clone
alias gs = git st
alias l = eza -al --group-directories-first
alias j = just
alias t = task
alias rr = rustrover
alias yt = yt-dlp

# Wwrapper for yazi that changes the current working directory on exit.
# https://yazi-rs.github.io/docs/quick-start/#shell-wrapper
def --env y [...args] {
	let tmp = (mktemp -t "yazi-cwd.XXXXXX")
	yazi ...$args --cwd-file $tmp
	let cwd = (open $tmp)
	if $cwd != "" and $cwd != $env.PWD {
		cd $cwd
	}
	rm -fp $tmp
}
