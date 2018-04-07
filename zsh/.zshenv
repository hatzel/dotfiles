# should be xterm-termite but some applications don't know that name...
export TERM=xterm-256color

# we like vim
export EDITOR=nvim

export GOPATH=/home/hansole/.cache/go

export PATH=$PATH:/opt/android-sdk/tools:/opt/android-sdk/platform-tools
export PATH=$PATH:/home/hansole/.cargo/bin:/home/hansole/.cache/go/bin

# racer needs to find the rust source
export RUST_SRC_PATH=$(rustc --print sysroot)/lib/rustlib/src/rust/src
