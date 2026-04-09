{ lib, pkgs, ... }:
{
	home.packages = with pkgs; [
		bottles
		fastfetch
		feh
		floorp-bin
		fzf
		gearlever
		ghostty
		htop
		localsend
		mpv
		#sunshine # probably wanna put this as a module for the system
		networkmanagerapplet
		nvtopPackages.full
		parsec-bin
		pavucontrol
		warp
		yazi

	];
}
