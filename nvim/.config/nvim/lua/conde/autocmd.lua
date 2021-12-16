-- quickly flashes to highlight the yanked text
vim.api.nvim_exec([[
  augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({ higroup = "Substitute", timeout = 400, on_macro = true })
  augroup END
]], false)

