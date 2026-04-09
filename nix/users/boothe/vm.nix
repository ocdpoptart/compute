{ pkgs, ... }:
{
# Home Manager Conf
	imports = [
		../../home/core.nix
		../../home/pack/vm.nix
		../../home/hypr # for hyprland conf
	];

	# Git User clearification
	programs.git = {
		userName = "boothe";
		userEmail = "ocdpoptart@protonmail.com";
	};
}
