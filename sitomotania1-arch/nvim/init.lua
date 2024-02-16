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
			"branch=stable",
			lazypath
		})
	end
	vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
--    { 
--        "savq/melange-nvim",
--        priority = 1000,
--        config = function()
--            vim.cmd([[colorscheme melange]])
--        end,
--    },
    { 
        "neanias/everforest-nvim",
        priority = 1000,
        config = function()
            require("everforest").setup({
                background = "hard"
            })
		    vim.cmd([[colorscheme everforest]])

        end,
    },
    {
       "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function ()
            local configs = require("nvim-treesitter.configs")

            configs.setup({
                ensure_installed = {"lua", "javascript", "html", "css"},
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
    }

})

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})

