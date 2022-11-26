require("conde/plugins")
require("conde/mappings")
require("conde/options")
require("conde/autocmd")

vim.api.nvim_exec([[
  let g:dracula_italic=0
  colorscheme dracula

  let g:loaded_ruby_provider = 0
  let g:loaded_perl_provider = 0
]], false)

