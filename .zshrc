### LOAD COLORS
autoload -Uz colors && colors
setopt PROMPT_SUBST
source ~/.zsh_plugins.zsh
source '/usr/share/zsh-antidote/antidote.zsh'

zsh_plugins=/home/elias/.zsh_plugins

# Ensure the .zsh_plugins.txt file exists so you can add plugins.
[[ -f ${zsh_plugins}.txt ]] || touch ${zsh_plugins}.txt

# Lazy-load antidote from its functions directory.
fpath=(/path/to/antidote/functions $fpath)
autoload -Uz antidote

# Generate a new static file whenever .zsh_plugins.txt is updated.
if [[ ! ${zsh_plugins}.zsh -nt ${zsh_plugins}.txt ]]; then
  antidote bundle <${zsh_plugins}.txt >|${zsh_plugins}.zsh
fi

# Source your static plugins file.
source ${zsh_plugins}.zsh
export EDITOR=kate

antidote load

# Initialize Starship
eval "$(starship init zsh)"

### INTERACTIVE SHELL CONFIG
if [[ $- == *i* ]]; then


    plugins=(zsh-autosuggestions zsh-syntax-highlighting zsh-bat)


    # Aliases
    alias pamcan="pacman"
    alias ls="eza --icons"
    alias dir="eza --icons"
    alias clear="printf '\033[2J\033[3J\033[1;1H'"
    alias q="qs -c ii"
    alias rz="antidote bundle <~/.zsh_plugins.txt >~/.zsh_plugins.zsh && zsh"
fi
