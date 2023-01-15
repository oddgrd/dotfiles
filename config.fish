if status is-interactive
    # Commands to run in interactive sessions can go here
end
set -gx WASMTIME_HOME "$HOME/.wasmtime"

string match -r ".wasmtime" "$PATH" > /dev/null; or set -gx PATH "$WASMTIME_HOME/bin" $PATH

starship init fish | source

set -l xdg_data_home $XDG_DATA_HOME ~/.local/share
set -gx --path XDG_DATA_DIRS $xdg_data_home[1]/flatpak/exports/share:/var/lib/flatpak/exports/share:/usr/local/share:/usr/share

for flatpakdir in ~/.local/share/flatpak/exports/bin /var/lib/flatpak/exports/bin
    if test -d $flatpakdir
        contains $flatpakdir $PATH; or set -a PATH $flatpakdir
    end
end

# Flatpak aliases
alias ff='flatpak run org.mozilla.firefox'

# Git aliases (https://gist.github.com/freewind/773c3324b5288ff636af)
alias g='git'
alias gst='git status'
alias gd='git diff'
alias gds='git diff --staged'
alias gl='git pull'
alias gp='git push'
alias gc='git commit -m'
alias gco='git checkout'
alias gr='git remote'
alias grv='git remote -v'
alias gb='git branch -b'
alias ga='git add'

#
# Will return the current branch name
# Usage example: git pull origin $(current_branch)
#
function current_branch
  set ref (git symbolic-ref HEAD 2> /dev/null); or \
  set ref (git rev-parse --short HEAD 2> /dev/null); or return
  echo ref | sed s-refs/heads--
end

function current_repository
  set ref (git symbolic-ref HEAD 2> /dev/null); or \
  set ref (git rev-parse --short HEAD 2> /dev/null); or return
  echo (git remote -v | cut -d':' -f 2)
end

# these aliases take advantage of the previous function
alias ggpull='git pull origin (current_branch)'
alias ggpush='git push origin (current_branch)'
