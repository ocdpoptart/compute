{ pkgs, lib, ... }:
{
	virtualisation.libvirtd = {
		enable = true;
		qemu.vhostUserPackages = [ pkgs.virtiofsd ]; # shared folders
	};
	programs.virt-manager.enable = true;
}
