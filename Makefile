sync: update
	home-manager switch --flake . -b backup

update:
	nix flake update

upgrade:
	sudo nix upgrade-nix

clean:
	nh clean all


.PHONY: update sync upgrade clean
