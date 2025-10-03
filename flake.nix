{
	description = "Kerry Cerqueira's neovim confuguration";
	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
	};
	outputs = {...}: {
		homeManagerModules.shell-config = {
			imports = [
				./nix/default.nix
			];
		};
	};
}
