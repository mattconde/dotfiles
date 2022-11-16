local tree_cb = require'nvim-tree.config'.nvim_tree_callback

require'nvim-tree'.setup {
  view = {
    side = 'right',
    width = 50,
    mappings = {
      list = {
        { key = "h", cb = tree_cb("close_node") },
        { key = "l", cb = tree_cb("edit") },
        { key = "n", cb = tree_cb("create") },
      }
    }
  }
}

