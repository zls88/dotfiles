# Set up cargo (rust package manager)
if [ -d $HOME/.cargo ] ; then
  if [ -f $HOME/.cargo/env ] ; then
    source $HOME/.cargo/env
  fi
fi
