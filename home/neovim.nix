{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    coc.enable = true;
    coc.settings = {
      languageserver = {
        fsharp = {
	  command = "fsautocomplete";
	  args = [];
	  filetypes = ["fsharp"];
	  trace.server = "verbose";
	  initializationOptions = {
	    AutomaticWorkspaceInit = true;
	  };
	  settings = {
	    FSharp.keywordsAutocomplete = true;
	    Fsharp.ExternalAutocomplete = false;
	    FSharp.Linter = true;
	    FSharp.UnusedOpensAnalyzer = true;
	    FSharp.UnusedDeclarationsAnalyzer = true;
	    FSharp.UseSdkScripts = true;
	    FSharp.SimplifyNameAnalyzer = false;
	    FSharp.ResolveNamespaces = true;
	    FSharp.EnableReferenceCodeLens = true;
	  };
	};
      };
    };
    plugins = with pkgs.vimPlugins; [
      nvim-treesitter.withAllGrammars
    ];
    extraLuaConfig = ''
      vim.api.nvim_set_keymap("i", "jj", "<Esc>", { noremap = true, silent = true })
    '';
  };
}
