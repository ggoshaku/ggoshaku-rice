-- line numbering
vim.opt.number = true
vim.opt.relativenumber = true

-- block cursor
vim.opt.guicursor = ""

-- restore cursor position when reopening a file
vim.api.nvim_create_autocmd('BufReadPost', {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- tab and smart autoindent
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true

-- colorscheme
vim.cmd.colorscheme("evening")

-- transparent background
vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})
vim.api.nvim_set_hl(0, "EndOfBuffer", {bg = "none"})

-- lazy.nvim plugin manager
require("config.lazy")

-- kaarmu typst plugin for pdf files
require("plugins.typst")

-- setting Enter key to open a pdf file
vim.keymap.set('n', '<CR>', ':TypstWatch<CR>', {noremap = true, buffer = true, silent = true})

-- lsp for typst files
vim.lsp.config['tinymist'] = { cmd = {'tinymist'} }
vim.lsp.enable({'tinymist'})

