require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained",
  ignore_install = {},
  highlight = {
    enable = true,
    use_languagetree = true,
    disable = {},
  },
  indent = {
    enable = true,
  },
}

local parsername = require "nvim-treesitter.parsers".filetype_to_parsername

parsername.typescript = "flowtype"

