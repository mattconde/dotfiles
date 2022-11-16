require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",
  auto_install = true,
  highlight = {
    enable = true,
    use_languagetree = true,
    disable = {},
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      node_incremental = "]",
      scope_incremental = "=",
      node_decremental = "[",
    },
  },
  indent = {
    enable = true,
  },
  textobjects = {
    select = {
      enable = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@call.outer",
        ["ic"] = "@call.inner",
      },
    },
  }
}

