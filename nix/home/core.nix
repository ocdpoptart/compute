{ username, ... }:
{
	home = {
		inherit username;
		homeDirectory = "/home/${username}";

		# determines home manager release version (check their release notes) [Currently Unstable = 26.05]
		# says can be updated without changing this like the conf state version
		stateVersion = "26.05";
	};

	# Home manager install & manage self (look into if this is needed)
	programs.home-manager.enable = true;
}
