# Load dotfiles
export DOTFILES="$HOME/dotfiles"

source .functions
source_in "$DOTFILES"

# Load sensitive data to your profile like usernames, keys, etc.
source_in "$DOTFILES/.__private__/**"

# Load configuration for other applications: Fastlane, Carthage, Ruby, etc.
source_all "$DOTFILES/.bundles/**"

# Initialize all bundles.
init_all "$DOTFILES/.bundles/**"
