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
		inputs.yt-x.packages."${system}".default
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
		warp
		waydroid
		yazi
	];
}
