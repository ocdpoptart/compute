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

	outputs = inputs@{ self, nixpkgs, home-manager, ... }: {
		nixosConfigurations = {
		nixos = let
			username = "boothe"; # so this is defining the username in all '${username}' fields
			specialArgs = { inherit inputs; inherit username; };
		in
		nixpkgs.lib.nixosSystem {
			inherit specialArgs; # self explanitory
			modules = [
					# point to host flake definied above
					./hosts/nixos 
	
					# { _module.args = { inherit inputs; }; } # same as 'specialArgs' just differnt and could be more useful depends on usecase
					
					# home Manager as module so it works with rebuild switch
					home-manager.nixosModules.home-manager {
						home-manager.useGlobalPkgs = true;
						home-manager.useUserPackages = true;
						home-manager.extraSpecialArgs = specialArgs; # allow home manager to also inherit the above special args
						home-manager.users.${username} = import ./users/${username}/desktop.nix; # point to correct user home manager config
					}
			];
		};
		
		nyx = let
			username = "boothe";
			specialArgs = { inherit inputs; inherit username; };
		in
		nixpkgs.lib.nixosSystem {
			inherit specialArgs;
			modules = [
				./hosts/nyx
				
				home-manager.nixosModules.home-manager {
					home-manager.useGlobalPkgs = true;
					home-manager.useUserPackages = true;
					home-manager.extraSpecialArgs = specialArgs;
					home-manager.users.${username} = import ./users/${username}/desktop.nix;
				}
			];
		};
		};
	};
}
