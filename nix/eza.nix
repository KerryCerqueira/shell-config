{ pkgs, ... }:

{
	home.packages = with pkgs; [
		eza
	];
	xdg.configFile."eza/" = {
		source = ../src/eza;
		recursive = true;
	};
}
