bindkey -v

fpath+=("$ZDOTDIR/prompts/pure")
fpath+=("$ZDOTDIR/lib")

autoload -U promptinit; promptinit
prompt pure

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if [[ -d "$HOME/.pyenv" ]]; then
    export PYENV_ROOT="$HOME/.pyenv"
    command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
fi

export PATH="$HOME/.poetry/bin:$PATH"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

eval "$(direnv hook zsh)"

. $ZDOTDIR/aliases.zsh

 
. "$HOME/.asdf/asdf.sh"
# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)
# initialise completions with ZSH's compinit
autoload -Uz compinit && compinit

# Load git helpers
autoload -Uz git-interactive-checkout
autoload -Uz git-interactive-delete

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/pawel/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/pawel/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/pawel/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/pawel/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

