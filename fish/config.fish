if status is-interactive
    # Commands to run in interactive sessions can go here
end

starship init fish | source

set -l xdg_data_home $XDG_DATA_HOME ~/.local/share
set -gx --path XDG_DATA_DIRS $xdg_data_home[1]/flatpak/exports/share:/var/lib/flatpak/exports/share:/usr/local/share:/usr/share

for flatpakdir in ~/.local/share/flatpak/exports/bin /var/lib/flatpak/exports/bin
    if test -d $flatpakdir
        contains $flatpakdir $PATH; or set -a PATH $flatpakdir
    end
end

# Flatpak aliases
alias obs='flatpak run md.obsidian.Obsidian'
alias discord='flatpak run com.discordapp.Discord'
alias signal='flatpak run org.signal.Signal'
alias spotify='flatpak run com.spotify.Client'

# Misc aliases
alias ff='firefox'
alias popshop='io.elementary.appcenter'

# Neovim aliases
alias vi='nvim'

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

# Cargo aliases
alias c='cargo'
alias cl='cargo clippy'
alias ch='cargo check'

#
# Will return the current branch name
# Usage example: git pull origin $(curr)
#
function curr
  git branch --show-current  
end

# these aliases take advantage of the previous function
alias ggpull='git pull upstream (curr)'
alias ggpush='git push origin (curr)'
