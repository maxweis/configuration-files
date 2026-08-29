# Homebrew is available on the original macOS setup; keep this portable on Linux.
if [[ -x /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
  export PATH="$(brew --prefix ruby)/bin:$PATH"
  export PATH="$(gem environment gemdir)/bin:$PATH"
fi

# User-local command directory
export PATH="$HOME/.local/bin:$PATH"
