vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.clipboard = "unnamedplus"
vim.opt.mouse = "a"

-- Autosave ao trocar de buffer ou perder foco
vim.api.nvim_create_autocmd({"BufLeave", "FocusLost"}, {
  pattern = "*",
  command = "silent! wa",
})
