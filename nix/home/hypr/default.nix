{ pkgs, ... }:
{
	home.file.".config/hypr" = {
		source = ./hypr-conf;
		recursive = true; # copy the scripts directory recursively
	};
}
