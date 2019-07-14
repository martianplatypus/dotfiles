# Load dotfiles
source .functions
source_in "$HOME"

# Load sensitive data to your profile like usernames, keys, etc.
source_in "$HOME/.__private__/**"

# Load configuration for other applications: Fastlane, Carthage, Ruby, etc.
source_all "$HOME/.bundles/**"

# Initialize all bundles.
init_all "$HOME/.bundles/**"
