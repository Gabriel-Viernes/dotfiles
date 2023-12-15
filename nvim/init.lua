vim.wo.relativenumber = true
vim.wo.number = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
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

