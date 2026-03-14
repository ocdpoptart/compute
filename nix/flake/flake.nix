{
	description = "Hopefully All";

	inputs = {
		# NixOS package source (update = nix flake update nixpkgs --override-input nixpkgs github:NixOS/nixpkgs/<commit-hash>)
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
		nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-25.11"; #Change when new stable version
		
		# home-manager (user conf)
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = { nixpkgs, home-manager, ... }@inputs: {
		nixosConfigurations = {
		nixos = nixpkgs.lib.nixosSystem {
			specialArgs = { inherit inputs; };
			modules = [
					# currently old config
					./configuration.nix
	
					# { _module.args = { inherit inputs; }; } # same as 'specialArgs' just differnt and could be more useful depends on usecase
					
					# home Manager as module so it works with rebuild switch
					home-manager.nixosModules.home-manager {
						home-manager.useGlobalPkgs = true;
						home-manager.useUserPackages = true;
						home-manager.users.boothe = import ./home.nix; # if for whatever reason using a different user change name
					}
			];
		};
		};
	};
}
