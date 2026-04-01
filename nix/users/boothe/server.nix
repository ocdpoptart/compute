{ pkgs, ... }:
{
# home server config

	imports = [
		../../home/core.nix
		../../home/pack/server.nix
	];

	# systemd user stuff for git
	programs.git = {
		userName = "boothe";
		userEmail = "ocdpoptart@protonmail.com";
	};
}
