{ lib, pkgs, ... }:
{
	# User Packages for Desktop Use
	home.packages = with pkgs; [
		blueman
		bottles # might use flatpak instead
		brave
		cava
		chatterino2
		easyeffects
		element-web # test for now there are other matrix clients
		fastfetch
		feh
		floorp-bin
		fzf
		gearlever
		ghostty
		gimp
		htop
		inkscape
		jellyfin
		kdePackages.kdenlive
		kdePackages.okular
		komikku
		libreoffice
		localsend
		moonlight-qt
		mpv
		ncspot
		networkmanagerapplet
		nvtopPackages.full
		parsec-bin
		pavucontrol
		pdfarranger
		plex
		plexamp
		#proton-vpn # didn't want to build here might have to make a module for the system or just make a networking folder overall but either way not network manager
		protonmail-desktop
		qpwgraph
		streamcontroller # might use flatpak instead
		streamlink
		thunar
		ueberzugpp
		warp
		waydroid
		yazi
	];
}
