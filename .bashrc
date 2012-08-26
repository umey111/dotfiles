export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

alias ll='gls -lAFh --color=auto'
alias la='gls -lAFh --color=auto'
alias ls='gls -vF --color=auto'
alias hg='hg --encoding=utf-8'
alias vimfiler='mvim -c VimFiler'
alias vimshell='mvim -c VimShell'
alias h='history'
alias vi='mvim -v'
alias vim='mvim -v'

export HISTSIZE=3000

export GOROOT=$HOME/go
export GOPATH=$GOROOT:$GOROOT/bin
export GOOS=darwin
export GOARCH=amd64
export GOBIN=$GOROOT/bin
export PATH=$GOBIN:$PATH
# export DYLD_LIBRARY_PATH=/usr/lib
# export DYLD_FALLBACK_LIBRARY_PATH=/opt/local/lib
# export DYLD_FALLBACK_LIBRARY_PATH=/usr/lib
# export DYLD_LIBRARY_PATH="/opt/local/lib:/Applications/MAMP/Library/lib:$DYLD_LIBRARY_PATH"
# export PATH=$PATH:/opt/local/bin

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
