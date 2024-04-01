# neovim-config

Switched to neovim completely about 2 years ago, however I was just using someone else's config(chrisatmachine). Although that configuration is very good(and this config uses
that one to a good extent), I would like to have the knowledge and freedom to customise the config whenever and however I want. Chris's config disallows that as it would take 
some learning curve to understand what he's done.


> Creating my very own neovim config from scratch to understand how to configure neovim and how configurations with various plugins work. 




### Treesitter error
The `lua` compiler is added to the list of *ensure_installed* in the tresitter setup. However, if you're still getting a treesitter error on opening NeoVim, then make sure nvim-treesitter is added to the list of plugins to be installed and run the command `:TSInstall lua` 
to install the lua compiler. This should resolve the issue, if not then also install the mingw or the gcc compiler using the command `scoop install mingw/gcc`
