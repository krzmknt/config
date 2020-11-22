function fish_prompt --description 'Write out the prompt'
	printf '\n%s ❯❯❯ ' (set_color blue)(prompt_pwd)
end

export PATH="$HOME/.pyenv/shims:$PATH"
set -x PATH "/usr/local/opt/tcl-tk/bin" $PATH
set -x LDFLAGS "-L/usr/local/opt/tcl-tk/lib"
set -x CPPFLAGS "-I/usr/local/opt/tcl-tk/include"
set -x PKG_CONFIG_PATH "/usr/local/opt/tcl-tk/lib/pkgconfig"
set -x PYTHON_CONFIGURE_OPTS "--with-tcltk-includes='-I/usr/local/opt/tcl-tk/include' --with-tcltk-libs='-L/usr/local/opt/tcl-tk/lib -ltcl8.6 -ltk8.6'"

set WORK "/Users/krzmknt/Library/Mobile Documents/com~apple~CloudDocs/Workspace/"
set INBOX "/Users/krzmknt/Library/Mobile Documents/com~apple~CloudDocs/inbox"
set ARCHIVE "/Users/krzmknt/Dropbox/Archive"

function inbox
  cd $INBOX
end

function work
  cd $WORK
end

function diary
	set file "/Users/krzmknt/Library/Mobile Documents/com~apple~CloudDocs/diary/"(date +%Y%m%d)".md"
	touch $file && vim $file
end

function config_fish
	vim "/Users/krzmknt/.config/fish/config.fish"
end

function new
	mkdir -p (dirname $argv) && touch $argv && vim $argv
end

function refresh
	source ~/.config/fish/config.fish
end


function l
	tree -C $argv
end

function ld
  if test -z $argv
    set argv 1
  end
	l -d -L $argv
end

function lf
  for file in (ls)
    if test -d $file
    else
      echo $file
    end
  end
end

## Issue la after cd
function cd
	builtin cd $argv; and la
end

alias diff colordiff

function bk
  cp $argv {$argv}.bk
end

function c
	g++ -o $argv {$argv}.cpp && ./{$argv}
end
