# Load dotfiles
source .functions
source_in "$HOME"

# Load sensitive data to your profile like usernames, keys, etc.
source_in "$HOME/.__private__/**"

# Load configuration for other applications: Fastlane, Carthage, Ruby, etc.
source_all "$HOME/.bundles/**"

# Powerline Shell
if hash powerline-shell 2>/dev/null; then
  function _update_ps1() {
    PS1="$(powerline-shell $?)"
  }

  if [[ "$TERM" != "linux" && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
  fi
else
  export PS1="\[\e[0;32m\]\]\[\] \[\e[1;32m\]\]\t \[\e[0;2m\]\]\w \[\e[0m\]\]\[$\] "
fi
