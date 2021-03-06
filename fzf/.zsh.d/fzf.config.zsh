if ! which fzf >/dev/null 2>&1 ; then
  exit 0
fi

if [ -d $HOME/.nix-profile ] ; then
  source $HOME/.nix-profile/share/fzf/key-bindings.zsh
  source $HOME/.nix-profile/share/fzf/completion.zsh
elif [ z"Mac" = z"${ZLS_OS}" ] ; then
  # Copied from running the install script
  # Setup fzf
  # ---------
  if [[ ! "$PATH" == */usr/local/opt/fzf/bin* ]]; then
    export PATH="${PATH:+${PATH}:}/usr/local/opt/fzf/bin"
  fi
  
  # Auto-completion
  # ---------------
  [[ $- == *i* ]] && source "/usr/local/opt/fzf/shell/completion.zsh" 2> /dev/null
  
  # Key bindings
  # ------------
  source "/usr/local/opt/fzf/shell/key-bindings.zsh"
else
  source /usr/share/fzf/key-bindings.zsh
  source /usr/share/fzf/completion.zsh
fi

# stolen from https://mike.place/2017/fzf-fd/
export FZF_DEFAULT_COMMAND="fd . $HOME"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd -t d . $HOME"

# C-t is fuzzy complete
# TAB is normal complete
export FZF_COMPLETION_TRIGGER=''
bindkey '^T' fzf-completion
bindkey '^I' $fzf_default_completion
