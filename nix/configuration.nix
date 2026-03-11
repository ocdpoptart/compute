# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.limine.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.hostName = "nixos"; # Define your hostname.
  networking.networkmanager.enable = true;
  #networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  #networking.firewall.trustedInterfaces = [ "virbr0" ]; 
  
  # Set your time zone.
  time.timeZone = "Pacific/Honolulu";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.boothe = {
    isNormalUser = true;
    description = "boothe";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" ];
    packages = with pkgs; [
	#gearlever
	cava
	easyeffects
	gimp
	htop
	inkscape
	kdePackages.kdenlive
	libreoffice
	localsend
	nvtopPackages.full
	qpwgraph
	warp #gtk frontend for magic-wormhole
	waydroid
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  
  # Hyprland support
  programs.hyprland = {
	enable = true;
	withUWSM = true; # wiki says recommended
	xwayland.enable = true; # can be disabled but there are programs that need it
};

  # SDDM/Wayland
  services.displayManager.sddm = {
	enable = true;
	theme = "catppuccin-mocha-mauve";
	wayland = {
		enable = true;
	};
};

  # NEOVIM default editor
  programs.neovim = {
	enable = true;
	defaultEditor = true;
	vimAlias = true;
	viAlias = true;
};

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
	#where-is-my-sddm-theme
	#xdg-utils
	blueman
	bluez
	catppuccin-sddm
	coreutils
	curlFull
	dnsmasq
	fastfetch
	feh
	fzf
	ghostty
	git
	gnugrep
	gnused
	kdePackages.okular
	kdePackages.sddm
	mpv
	neovim
	networkmanagerapplet
	pavucontrol
	qemu
	quickshell
	ueberzugpp
	virt-manager
	wget
	xdg-desktop-portal-hyprland
	yazi
	
    
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # Virtualisation Stuff:
	#virtualisation.libvirtd = { #as of 3-07-26 it is a little brokey and i would rather just not deal with it when i can later when this isn't a vm
		#enable = true;
		#qemu.vhostUserPackages = [ pkgs.virtiofsd ];
	#};
	#programs.virt-manager.enable = true;

  # Enable flatpak support
	services.flatpak.enable = true;
	systemd.services.flatpak-repo = {
		wantedBy = [ "multi-user.target" ];
		path = [ pkgs.flatpak ];
		script = ''
			flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
			'';
	};

  # Enable Screensharing
	services.dbus.enable = true;
	xdg.portal = {
		enable = true;
		# wlr.enable = true;
		extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];	
	};

  # Enable Polkit specifically Hyprlands
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

  # Enable the OpenSSH daemon.
	services.openssh.enable = true;

  # Enable Fwupd for hardware updates
  	services.fwupd.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
	system.stateVersion = "25.11"; # Did you read the comment?

}
