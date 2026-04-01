{ config, pkgs, ... }:
{
	imports = [
		../../modules/desktop.nix
		../../modules/game
		../../modules/virt.nix
		./hardware-configuration.nix
	];

	# Bootloader
	boot.loader = {
		limine.enable = true;
		efi = {
			canTouchEfiVariables = true;
			efiSysMountPoint = "/boot/efi"; # think this is needed for bare metal
		};
	};

	# (ngl if I have to keep typing this all this out gonna lose it so gonna about making modules for everything below)
	# Networking
	networking = {
		hostName = "NYX";
		networkmanager.enable = true;
		wireless.enable = true; # wpa_supplicant wireless
		#defaultGateway = "192.168.1.174"; # device chooses local address
		#proxy = { 
			#default = "http://user:password@proxy:port/";
			#noProxy = "127.0.0.1,localhost,internal.domain";
		#};
		#firewall = {
			#trustedInterfaces = [ "virbr0" ]; # dunno, might be firewall exceptions
			#allowedTCPPorts = [ ... ];
			#allowedUDPPorts = [ ... ];
			#enable = false; # diable firewall
		#};
	};

	# All things under services
	services = {
		openssh = {
			enable = true;
			#openFirewall = true; # probably not needed but just in case
			#settings = {
				#PermitRootLogin = "no"; # disable root login (might need might not)
				#PasswordAuthentication = false; # disable password login (leave in to turn on after tokens are saved)
			#};
		};
		
		fwupd.enable = true; # Fwupd (hardware software updates)
	};

	# Nixos release (Before changing read documentation)
	# (e.g. man configuration.nix or on https://nixos.org/nixos/options.html)
	system.stateVersion = "25.11";

}
