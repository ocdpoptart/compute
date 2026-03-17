{ lib, pkgs, ... }:
{
	# User Packages for Desktop Use
	home.packages = with pkgs; [
		blueman
		cava
		easyeffects
		fastfetch
		feh
		fzf
		ghostty
		gimp
		htop
		inkscape
		kdePackages.kdenlive
		kdePackages.okular
		libreoffice
		localsend
		mpv
		networkmanagerapplet
		nvtopPackages.full
		pavucontrol
		qpwgraph
		ueberzugpp
		virt-manager
		warp
		waydroid
		yazi
	];
}
