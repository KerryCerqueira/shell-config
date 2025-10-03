{ pkgs, ... }:

{
	imports = [
		./bat.nix
		./eza.nix
		./fish.nix
		./zsh.nix
	];
	home.sessionVariables = {
		PAGER = "${pkgs.moar}/bin/moar";
		MOAR = "--statusbar=bold --no-linenumbers";
	};
	home.packages = with pkgs; [
		any-nix-shell
		git
		btop
		fzf
		moar
		tldr
		dust
		fd
		ripgrep
		sshfs
		tmux
		timg
		yazi
	];
	programs = {
		direnv = {
			enable = true;
			nix-direnv.enable = true;
		};
		oh-my-posh = {
			enable = true;
			settings = builtins.fromJSON (
				builtins.readFile ../src/oh-my-posh/config.json
			);
		};
		gh = {
			enable = true;
			extensions = with pkgs; [
				gh-dash
				gh-copilot
			];
		};
	};
}
