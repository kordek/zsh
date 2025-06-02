# Git
alias gch='git-interactive-checkout'
alias gbd='git-interactive-delete'
alias stale-branches-cleanup='git-delete-stale-branches'
alias lg='lazygit'

# Vim
alias vim='nvim'
alias vzf='nvim $(fzf)'

# Other
alias mtf='mix test $(find test -name "*test.exs" | fzf)'

alias czf='cd $(fzf --walker=dir)'
