PACKAGES := hypr waybar swaync wofi gtk kitty
PACKAGES_SYSTEM := greetd

.PHONY: install

install:
	@command -v stow >/dev/null 2>&1 || { echo "Install stow: sudo apt install stow"; exit 1; }
	@for pkg in $(PACKAGES); do stow $$pkg; done
	@for pkg in $(PACKAGES_SYSTEM); do sudo stow $$pkg; done
	@echo "All dotfiles linked."
