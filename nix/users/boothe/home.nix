{ pkgs, ... }:
{
# Home Manager Config

	imports = [
		../../home/core.nix
		../../home/pack
	];

	# Git User clearification so no gotta do when push
	programs.git = {
		userName = "boothe";
		userEmail = "ocdpoptart@protonmail.com";
	};
}
