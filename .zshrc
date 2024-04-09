bindkey -v

BREW_PREFIX=$(brew --prefix)

fpath+=("$ZDOTDIR/prompts/pure")
fpath+=("$ZDOTDIR/lib")
fpath+=(${BREW_PREFIX}/share/zsh/site-functions)

autoload -U promptinit; promptinit
prompt pure

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(direnv hook zsh)"

. $ZDOTDIR/aliases.zsh

# initialise completions with ZSH's compinit
autoload -Uz compinit && compinit

# Load git helpers
autoload -Uz git-interactive-checkout
autoload -Uz git-interactive-delete

for file in $ZDOTDIR/rc/*.zsh(.); do
    . $file
done
