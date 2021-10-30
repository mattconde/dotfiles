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

local parsers = require "nvim-treesitter.parsers"
local parser_config = parsers.get_parser_configs()

parser_config.typescript.used_by = "flowtype"

