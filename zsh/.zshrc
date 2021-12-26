# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r '${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh' ]]; then
  source '${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh'
fi

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH='/home/tuvu/.oh-my-zsh'

# Set name of the theme to load (https://github.com/ohmyzsh/ohmyzsh/wiki/Themes)
ZSH_THEME='powerlevel10k/powerlevel10k'

# Remind me to update when it's time
zstyle ':omz:update' mode reminder  

# Disable auto-setting terminal title.
DISABLE_AUTO_TITLE='true'

# Display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS='true'

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Example format: plugins=(rails git textnvim ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Zsh colorscheme
source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Zsh auto-suggestion
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# Zsh syntax-highlighting
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Aliases
alias vim='nvim'
alias zshconfig='vim ~/.zshrc'
alias ohmyzsh='vim ~/.oh-my-zsh'
alias ls='lsd'
alias ll='ls -la'
alias la='ls -a'
alias lt='ls --tree'
