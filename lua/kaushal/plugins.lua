local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerSync
augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
    git = {
        clone_timeout = 300, -- Timeout, in seconds, for git clones
    },
}

-- Install your plugins here
return packer.startup(function(use)
    -- Packer - plugin manager for nvim
    use { "wbthomason/packer.nvim", commit = "ea0cc3c59f67c440c5ff0bbe4fb9420f4350b9a3" } -- Have packer manage itself

    use { "nvim-lua/plenary.nvim", commit = "8aad4396840be7fc42896e3011751b7609ca4119" } -- Useful lua functions used by lots of plugins

    -- Autopairs - for automatic brackets closing
    -- use { "windwp/nvim-autopairs", commit = "dbfc1c34bed415906395db8303c71039b3a3ffb4" } -- Autopairs, integrates with both cmp and treesitter

    -- Comment - for commenting using Space+/
    use { "numToStr/Comment.nvim", commit = "0236521ea582747b58869cb72f70ccfa967d2e89" }

    -- Treesitter - for syntax parsing and highlighting
    use { "nvim-treesitter/nvim-treesitter", commit = "1d1d92e94aea9ac0273015341438b63d2db528a5" }
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional
        },
    }

    -- Telescope - for find in files, project, etc
    use {
        'nvim-telescope/telescope.nvim', commit = "c2b8311dfacd08b3056b8f0249025d633a4e71a8",
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- Which-key - for showing the keymaps when leader is pressed
    use {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 500
        end
    }

    -- Project manager
    use { "ahmedkhalf/project.nvim", commit = "8c6bad7d22eef1b71144b401c9f74ed01526a4fb" }

    -- Homescreen of neovim
    use { "goolord/alpha-nvim", commit = "41283fb402713fc8b327e60907f74e46166f4cfd" }

    -- Gitsigns - for highlighting git changes in files
    use { "lewis6991/gitsigns.nvim", commit = "f98c85e7c3d65a51f45863a34feb4849c82f240f" }

    -- Toggleterm - opens floating terminal window, mandatory for lazygit in nvim
    use { "akinsho/toggleterm.nvim", commit = "193786e0371e3286d3bc9aa0079da1cd41beaa62" }

    -- Colorschemes
    use { "rose-pine/neovim", as = "rose-pine", commit = "19055dfe90bfa46a1e5b0a706d13980bdffa2dee"}
    use { "folke/tokyonight.nvim", commit = "9bf9ec53d5e87b025e2404069b71e7ebdc3a13e5" }
    use { "sonph/onehalf", commit = "75eb2e97acd74660779fed8380989ee7891eec56", rtp = "vim" }
    use { "olimorris/onedarkpro.nvim", priority = 1000 }


    -- Buffer - for listing open files and easier navigating between buffers
    use {"akinsho/bufferline.nvim", commit = "64e2c5def50dfd6b6f14d96a45fa3d815a4a1eef", requires = "nvim-tree/nvim-web-devicons" }

    -- Barbecue - Highlighting contents of if/else|for|funtions|etc. using a bar |
    use({
        "utilyre/barbecue.nvim",
        commit = "d38a2a023dfb1073dd0e8fee0c9be08855d3688f",
        requires = {
            "SmiteshP/nvim-navic",
            "nvim-tree/nvim-web-devicons", -- optional dependency
        },
        config = function()
            require("barbecue").setup()
        end,
    })

    -- Lualine - for better statusbar at the bottom
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    -- Undo tree
    use { "mbbill/undotree", commit = "aa93a7e5890dbbebbc064cd22260721a6db1a196" }

    -- LSP - Language server protocol for formatting and linitng files
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            --- Uncomment the two plugins below if you want to manage the language servers from neovim
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            {'neovim/nvim-lspconfig'},
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'L3MON4D3/LuaSnip'},
        }
    }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
