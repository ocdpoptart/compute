{ pkgs, lib, username, ...}:
{
	# Time Zone
	time.timeZone = "Pacific/Honolulu";

	#Internationalisation properties
	i18n.defaultLocale = "en_US.UTF-8";
	i18n.extraLocaleSettings = {
		LC_ADDRESS = "en_US.UTF-8";
		LC_IDENTIFICATION = "en_US.UTF-8";
		LC_MEASUREMENT = "en_US.UTF-8"; # might change, celsius and meters good
		LC_MONETAERY = "en_US.UTF-8";
		LC_NAME = "en_US.UTF-8";
		LC_NUMERIC = "en_US.UTF-8";
		LC_PAPER = "en_US.UTF-8";
		LC_TELEPHONE = "en_US.UTF-8";
		LC_TIME = "en_US.UTF-8";
	};

	# User account (SET PASSWORD WITH 'passwd')
	users.users.${username} = {
		isNormalUser = true;
		description = username; # don't know if this is gonna be pulled from file but the book is like this
		extraGroups = [ "networkmanager" "wheel" "libvirtd" ];
	};
	# Users in list right to edit settings using 'nix.settings'? have to look into it
	nix.settings.trusted-users = [username];

	# customize /etc/nix/nix.conf declaratively via 'nix.settings'
	nix.settings = {
		experimental-features = [ "nix-command" "flakes" ];
		#substituters = [
			#add mirrors if needed
		#];
		#trusted-public-keys = [
			#pub key for above mirror
		#];
		#builders-use-substitutes = true; # force use of sub mirror
	};

	# Auto garbage collection for diskspace
	#nix.gc = {
		#automatic = lib.mkDefault true;
		#dates = lib.mkDefault "monthly";
		#options = lib.mkDefault "--delete-older-than 30d";
	#};

	# Allow unfree packages
	nixpkgs.config.allowUnfree = true;

	# List packages installed in system profile. To search, run:
	# $ nix search 'wget'
	environment.systemPackages = with pkgs; [
		#where-is-my-sddm-theme
		#xdg-utils
		bluez
		catppuccin-sddm
		coreutils
		curlFull
		dnsmasq
		git
		gnugrep
		kdePackages.sddm
		neovim
		qemu
		quickshell
		wget
		xdg-desktop-portal-hyprland
	];

	# Hyprland support
	programs.hyprland = {
		enable = true;
		withUWSM = true; # wiki says do, look into UWSM
		xwayland.enable = true;
	};

	# SDDM/Wayland
	services.displayManager.sddm = {
		enable = true;
		theme = "catpuccin-mocha-mauve";
		wayland.enable = true;
	};

	# NEOVIM & default editor
	programs.neovim = {
		enable = true;
		defaultEditor = true;
		vimAlias = true;
		viAlias = true;
	};

	# Virtualisation Stuff (last not says not working but still in conf for later)
	#virtualisation.libvirtd = { 
		#enable = true;
		#qemu.vhostUserPackages = [ pkgs.virtiofsd ]; # look into that package
	#};
	#programs.virt-manager.enable = true;

	# Flatpak support
	services.flatpak.enable = true;
	systemd.services.flatpak-repo = {
		wantedBy = [ "multi-user.target" ];
		path = [ pkgs.flatpak ];
		script = ''
			flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
			'';
	};

	# Screensharing
	services.dbus.enable = true;
	xdg.portal = {
		enable = true;
		#wlr.enable = true; # look up dunno what do
		extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
	};

	# Enable Polkit (Hyprland, dunno if it works in another environment)
	security.polkit.enable = true;
	systemd.user.services.hyprpolkitagent = {
		description = "hyprpolkitagent";
		wantedBy = [ "graphical-session.target" ];
		wants = [ "graphical-session.target" ];
		after = [ "graphical-session.target" ];
		serviceConfig = {
			Type = "simple";
			ExecStart = "${pkgs.hyprpolkitagent}/libexec/hyprpolkitagent";
			Restart = "on-failure";
			RestartSec = 1;
			TimeoutStopSec = 10;
		};
	};
}
