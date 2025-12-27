# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# PATH Additions
export PATH="$PATH:~/.local/bin"
export PATH="$(brew --prefix ruby)/bin:$PATH"
export PATH="$(gem environment gemdir)/bin:$PATH"
