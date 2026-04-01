{ pkgs, ... }:
{
	environment.systemPackages = with pkgs; [
		ryubing
		pcsx2
		rpcs3
		dolphin-emu
	];
}
