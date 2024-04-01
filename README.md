# neovim-config

Switched to neovim completely about 2 years ago, however I was just using someone else's config(chrisatmachine). Although that configuration is very good(and this config uses
that one to a good extent), I would like to have the knowledge and freedom to customise the config whenever and however I want. Chris's config disallows that as it would take 
some learning curve to understand what he's done.


> Creating my very own neovim config from scratch to understand how to configure neovim and how configurations with various plugins work. 


### Pre-requisite software
---
There are some pre-requisite software for this config to work as it should. They are listed below with instructions to install in Windows using scoop package manager.
You can easily find the corresponding install command for unix systems
 - ripgrep: for Telescope to work properly
    `scoop install ripgrep`
    For Unix:
    `sudo apt install ripgrep`
 - nodejs: `scoop install node`
 - python and pip: For windows, install using the installer. For unix, install using respective commands
 - lazygit: Terminal UI for git
    `scoop install lazygit`

Also, make sure you have any of the [NERD fonts](https://github.com/getnf/getnf) installed


### Install neovim
---
Install neovim itself
`scoop install neovim`

Make sure it was installed correctly by opening neovim using command `nvim` and doing `:checkhealth`


### Install this config
---
For Windows
`git clone https://github.com/LunarVim/nvim-basic-ide.git ~\AppData\Local\nvim`

For Unix systems
`git clone https://github.com/LunarVim/nvim-basic-ide.git ~/.config/nvim`


### Neovim support for python and node
---
 - python -
    `pip install pynvim`

 - node -
    `npm i -g neovim`

## Configuration

### LSP

To add a new LSP

First Enter:

```
:Mason
```

and press `i` on the Language Server you wish to install

Next you will need to add the server to this list: [servers](https://github.com/LunarVim/nvim-basic-ide/blob/0e65f504f634026f5765ce6a092612d385d6306d/lua/user/lsp/mason.lua#L1)

Note: Builtin LSP doesn't contain all lsps from [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#terraform_lsp).

If you want to install any from there, for example terraform_lsp(which adds more functionality than terraformls, like complete resource listing),

1. You can add the lsp name in [mason lsp block](https://github.com/LunarVim/nvim-basic-ide/blob/f03955dc1e5879164f9229d44d98ca81a948cbfb/lua/user/lsp/mason.lua#L1-L10)

```lua
-- lua/usr/lsp/mason.lua
local servers = {
	"sumneko_lua",
	"cssls",
	"html",
	"tsserver",
	"pyright",
	"bashls",
	"jsonls",
	"yamlls",
  "terraform_lsp" -- New LSP
}
```

2. Manually install the binary of the lsp and put it in your path by downloading the binary or through your package manager. For terraform_lsp [example](https://github.com/juliosueiras/terraform-lsp/releases)

### Formatters and linters

Make sure the formatter or linter is installed and add it to this setup function: [null-ls](https://github.com/LunarVim/nvim-basic-ide/blob/0e65f504f634026f5765ce6a092612d385d6306d/lua/user/lsp/null-ls.lua#L12)

**NOTE** Some are already setup as examples, remove them if you want

### Plugins

You can install new plugins here: [plugins](https://github.com/LunarVim/nvim-basic-ide/blob/0e65f504f634026f5765ce6a092612d385d6306d/lua/user/plugins.lua#L45)


### Treesitter error
The `lua` compiler is added to the list of *ensure_installed* in the tresitter setup. However, if you're still getting a treesitter error on opening NeoVim, then make sure nvim-treesitter is added to the list of plugins to be installed and run the command `:TSInstall lua` 
to install the lua compiler. This should resolve the issue, if not then also install the mingw or the gcc compiler using the command `scoop install mingw/gcc`
