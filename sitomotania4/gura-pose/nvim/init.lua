vim.wo.relativenumber = true
vim.wo.number = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.opt.termguicolors = false
vim.keymap.set('n', ']b',':bnext')
vim.keymap.set('n', '[b',':bprev')


--loads lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
	if not vim.loop.fs_stat(lazypath) then
		vim.fn.system({
			"git",
			"clone",
			"--filter=blob:none",
			"https://github.com/folke/lazy.nvim.git",
			"--branch=stable",
			lazypath
		})
	end
	vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    { "AlexvZyl/nordic.nvim" },
    { "atelierbram/Base2Tone-nvim"},
    { "katawful/kat.nvim"},
    { "savq/melange-nvim" },
    {
       "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function ()
            local configs = require("nvim-treesitter.configs")

            configs.setup({
                ensure_installed = {"lua", "javascript", "html", "css", "c_sharp", "hyprlang"},
                sync_install = false,
                highlight = { enable = true },
                indent = { enable = true }
            })
        end
    },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {}
    },
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        dependencies = { 'nvim-lua/plenary.nvim'}
    },
    {
        'williamboman/mason.nvim',
        config = function()
            local configs = require('mason')
            configs.setup()
        end
    },
    {
        'williamboman/mason-lspconfig.nvim',
        config = function()
            local configs = require('mason-lspconfig')

	    configs.setup ({
                ensure_installed = { 'csharp_ls', 'cssls', 'html', 'jsonls', 'tsserver', 'lua_ls', 'marksman', 'biome', 'yamlls'}
            })
	end
    },
    {
        'neovim/nvim-lspconfig',
        config = function()
            require('lspconfig').cssls.setup{}
            require('lspconfig').csharp_ls.setup{}
            require('lspconfig').html.setup{}
            require('lspconfig').jsonls.setup{}
            require('lspconfig').ts_ls.setup{}
            require('lspconfig').lua_ls.setup{}
            require('lspconfig').marksman.setup{}
        end
   }

})

vim.opt.background = "light"
vim.opt.termguicolors = true
vim.cmd.colorscheme 'nordic'
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})

