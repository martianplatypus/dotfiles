# Load dotfiles
for file in ~/.{exports,functions,paths}; do
    [ -r "$file" ] && source "$file"
done
unset file

# Load sensitive data to your profile like usernames, keys, etc.
sourceme "$HOME/.__private__"

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
