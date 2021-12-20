local tree_cb = require'nvim-tree.config'.nvim_tree_callback

require'nvim-tree'.setup {
  auto_close = true,
  view = {
    auto_resize = true,
    side = 'right',
    width = 50,
    mappings = {
      list = {
        { key = "h", cb = tree_cb("close_node") },
        { key = "l", cb = tree_cb("edit") },
      }
    }
  }
}

