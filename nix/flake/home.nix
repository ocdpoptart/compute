{ config, pkgs, ... }:

{
home.username = "boothe";
home.homeDirectory = "/home/boothe";

# Import files / directories (probably not gonna be used because gonna do this on fresh install besides the vm business for testing)
# home.file.".config/i3/wallpaper.jpg".source = .wallpaper.jpg;
# home.file.".config/i3/scripts" = {
# 	source = ./scripts;
# 	recursive = true; 
# 	executable = true;
# };

# User Packages
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

# git config so no gotta give identity when doing stuff
programs.git = {
	enable = true;
	userName = "boothe"; # don't know if this is right might have to change it
	userEmail = "ocdpoptart@protonmail.com";
};

# determines home manager release version (check their release notes) [this is currently for unstable which is 26.05]
#   am told that home manager can be updated without changing this like state version in conf file
home.stateVersion = "26.05";
}
