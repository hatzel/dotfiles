# should be xterm-termite but some applications don't know that name...
export TERM=xterm-256color

# we like vim
export EDITOR=nvim

export GOPATH=/home/hansole/.cache/go

export PATH=$PATH:/opt/android-sdk/tools:/opt/android-sdk/platform-tools
export PATH=$PATH:$HOME/.cargo/bin:$HOME/.cache/go/bin

export PATH=$PATH:$HOME/src/flutter/bin
export PATH=$PATH:$HOME/.pub-cache/bin

# racer needs to find the rust source
RUST_PATH=rustc --print sysroot 2>/dev/null
if [[ -z "$RUST_PATH" ]]; then
    export RUST_SRC_PATH=$(rustc --print sysroot 2>/dev/null)/lib/rustlib/src/rust/src
fi

export JAVA_HOME=/usr/lib/jvm/default
