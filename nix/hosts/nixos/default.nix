{ config, pkgs, ... }:
{
	imports = [
		../../modules/desktop.nix
		#../../modules/virt.nix # this line is for testing modules in vm before using them elsewhere
		./hardware-configuration.nix
	];

	# Bootloader
	boot.loader = {
		limine.enable = true;
		efi = {
			canTouchEfiVariables = true;
			#efiSysMountPoint = "/boot/efi"; #don't know if needed but might be for bare metal
		};
	};

	# Networking
	networking.hostName = "nixos";
	networking.networkmanager.enable = true;
	#networking.wireless.enable = true; # wpa_supplicant wireless
	#networking.defaultGaterway = "192.168.1.173"; # device sets local ip which could be used for configuration things if other examples are to be believed

	# Proxy/Firewall
	#networking.proxy.default = "http://user:password@proxy:port/";
	#networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
	#networking.firewall.trustedInterfaces = [ "virbr0" ]; # dunno what this is but could be useful in the future
	#networking.firewall.allowedTCPPorts = [ ... ];
	#networking.firewall.allowedUDPPorts = [ ... ];
	#networking.firewall.enable = false; # disable firewall

	# OpenSSH
	services.openssh = {
		enable = true;
		#openFirewall = true; # probably won't need but worth keeping just in case
		#settings = {
			#PermitRootLogin = "no"; # disable root login
			#PasswordAuthentication = false; # disable password login
		#};
	};

	# Fwupd for hardware software updates
	services.fwupd.enable = true;

	# Nixos release (Before changing read documentation)
	# (e.g. man configuration.nix or on https://nixos.org/nixos/options.html)
	system.stateVersion = "25.11";
}
