bindkey -v

BREW_PREFIX=$(brew --prefix)

fpath+=("$ZDOTDIR/prompts/pure")
fpath+=("$ZDOTDIR/lib")
fpath+=(${BREW_PREFIX}/share/zsh/site-functions)

autoload -U promptinit; promptinit
prompt pure

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

eval "$(direnv hook zsh)"

. $ZDOTDIR/aliases.zsh

# initialise completions with ZSH's compinit
autoload -Uz compinit && compinit

# Load git helpers
autoload -Uz git-interactive-checkout
autoload -Uz git-interactive-delete
autoload -Uz git-delete-stale-branches
autoload -Uz k8s-connect-by-tag

for file in $ZDOTDIR/rc/*.zsh(.); do
    . $file
done
