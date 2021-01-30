function fish_prompt --description 'Write out the prompt'
	printf '\n%s ❯❯❯ ' (set_color cyan)(prompt_pwd)
end


# Inbox and Workspace

set INBOX $HOME
set WORK $HOEM

[ -e ] && set INBOX "~/Inbox"
[ -e ] && set WORK "~/Workspace/"

function inbox
  cd $INBOX
end

function work
  cd $WORK
end


function diary
	set file "~/diary/"(date +%Y%m%d)".md"
	touch $file && vim $file
end

function config
	vim "~/.config/fish/config.fish"
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

function cd
	builtin cd $argv; and la
end

alias diff colordiff
alias c "g++ -o $argv {$argv}.cpp && ./{$argv}"
alias cat 'ccat -G String="_brown_" -G Plaintext="overline" -G Punctuation="darkteal" -G Decimal="darkgreen" -G Keyword="green" -G Comment="darkgray" -G Tag="faint"'


