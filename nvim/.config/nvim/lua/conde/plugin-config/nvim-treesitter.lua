require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",
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

