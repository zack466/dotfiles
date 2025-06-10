sync: update
	home-manager switch --flake . -b backup

update:
	nix flake update

.PHONY: update
