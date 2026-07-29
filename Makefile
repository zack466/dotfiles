sync:
	home-manager switch --flake . -b backup

update:
	nix flake update

upgrade:
	sudo nix upgrade-nix

clean:
	nix-collect-garbage -d
	nix store optimise

.PHONY: update sync upgrade clean
