{ pkgs, ... }:
{
	programs = {
		steam = {
			enable = true; # steam hardware support
			extraCompatPackages = [ pkgs.proton-ge-bin ];
			protontricks.enable = true;
			remotePlay.openFirewall = true; 
			localNetworkGameTransfers.openFirewall = true; 
			
		};
		gamemode.enable = true;
		gamescope.enable = true;
	};
	
	environment.systemPackages = with pkgs; [
		protonup-qt
	];
}
