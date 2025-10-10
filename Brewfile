# Brewfile

# Install Homebrew if not installed
echo "Installing Homebrew packages..."
if ! command -v brew &> /dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
echo "Hombrew Setup complete!"


# Cask Collection
cask "raycast"
cask "syntax-highlight" # Adds syntax highlighting to my system files
cask "qlmarkdown" # Adds native Markdown and YAML file quickview


# Command-line tools
brew "wget"
brew "curl"
brew "git"
brew "ffmpeg"
brew "zsh"
brew "yt-dlp"
brew "zsh-autocomplete"
brew "zsh-autosuggestions"
brew "zsh-syntax-highlighting"