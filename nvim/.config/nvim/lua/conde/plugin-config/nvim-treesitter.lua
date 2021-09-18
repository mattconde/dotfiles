require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- or a list of language parsers to install
  ignore_install = {}, -- list of parsers to ignore installing
  highlight = {
    enable = true,
    disable = {}, -- list of language that will be disabled
  },
  indent = {
    enable = true,
  },
}

