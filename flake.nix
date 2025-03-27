{
	description = "Kerry Cerqueira's neovim confuguration";
	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
	};
	outputs = { ... }: {
		homeManagerModules = {
			config = { pkgs, flakeInputs, ... }:

				{
					home.packages = with pkgs; [
						any-nix-shell
						git
						btop
						fzf
						eza
						moar
						tldr
						dust
						fd
						ripgrep
						bat
						bat-extras.batman
						bat-extras.batgrep
						bat-extras.batdiff
						timg
						yazi
					];
					xdg.configFile = {
						"zsh/conf.d/" = {
							source = ./src/zsh/conf.d;
							recursive = true;
						};
						"fish/conf.d/" = {
							source = ./src/fish/conf.d;
							recursive = true;
						};
						"fish/functions/" = {
							source = ./src/fish/functions;
							recursive = true;
						};
						"bat/" = {
							source = ./src/bat;
							recursive = true;
						};
						"kitty/" = {
							source = ./src/kitty;
							recursive = true;
						};
						"eza/" = {
							source = ./src/eza;
							recursive = true;
						};
					};
					programs = {
						zsh = {
							enable = true;
							dotDir = ".config/zsh";
							antidote = {
								enable = true;
								plugins = let
									splitString = pkgs.lib.strings.splitString;
									pluginsText =  builtins.readFile ./src/zsh/zsh_plugins.conf;
									zshPlugins = splitString "\n" pluginsText;
								in
									zshPlugins;
							};
							initExtra = # sh
								''
								if [[ $(ps -o command= -p "$PPID" | awk '{print $1}') != 'fish' ]]
								then
									exec fish -l
								else
									any-nix-shell zsh | source /dev/stdin
									source "$ZDOTDIR"/conf.d/conf.zsh
								fi
								'';
						};
						fish = {
							enable = true;
							plugins = with pkgs.fishPlugins; [
								{ name = "fish-you-should-use"; src = fish-you-should-use.src; }
								{ name = "forgit"; src = forgit.src; }
								{ name = "fzf-fish"; src = fzf-fish.src; }
								{ name = "pisces"; src = pisces.src; }
							];
							interactiveShellInit = # fish
								''
								${pkgs.any-nix-shell}/bin/any-nix-shell fish | source
								'';
						};
						oh-my-posh = {
							enable = true;
							settings = builtins.fromJSON (
								builtins.readFile ./src/oh-my-posh/config.json
							);
						};
					};
				};
		};
	};
}
