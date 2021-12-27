# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r '${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh' ]]; then
  source '${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh'
fi

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Path to custom oh-my-zsh
export ZSH_CUSTOM=$ZSH/custom

# Path to custom config
export NVIM=$HOME/.config/nvim/

# Path to workspace
export DEV=$HOME/dev/

# Set name of the theme to load (https://github.com/ohmyzsh/ohmyzsh/wiki/Themes)
ZSH_THEME="powerlevel10k/powerlevel10k"

# Remind me to update when it's time
zstyle ':omz:update' mode reminder  

# Disable auto-setting terminal title.
DISABLE_AUTO_TITLE='true'

# Display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS='true'

# Zsh framework
if [[ ! -d $ZSH ]]; then
    echo "Installing ohmyzsh..."
    git clone https://github.com/ohmyzsh/ohmyzsh.git $ZSH
    echo ""
fi

# Zsh theme
if [[ ! -d $ZSH_CUSTOM/themes/powerlevel10k ]]; then
    echo "Installing powerlevel10k..."
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
    echo ""
fi
source $ZSH_CUSTOM/themes/powerlevel10k/powerlevel10k.zsh-theme

# Zsh autosuggestions
if [[ ! -d $ZSH_CUSTOM/plugins/zsh-autosuggestions ]]; then
    echo "Installing zsh-autosuggestions..."
    git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
    echo ""
fi

# Zsh syntax-highlighting
if  [[ ! -d $ZSH_CUSTOM/plugins/zsh-syntax-highlighting ]]; then
    echo "Installing zsh-syntax-highlighting..."
    git clone https://github.com/zsh-users/zsh-syntax-highlighting $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
    echo ""
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Oh-my-zsh plugins
plugins=(
    git 
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# Aliases
alias vim='nvim'
alias zshconfig='vim ~/.zshrc'
alias ohmyzsh='vim ~/.oh-my-zsh'
alias ls='lsd'
alias ll='ls -la'
alias la='ls -a'
alias lt='ls --tree'
