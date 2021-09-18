local cmp = require'cmp'

cmp.setup({
  snippet = {},
  mapping = {
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'path' },
    { name = 'calc' },
    { name = 'nvim_lua' },
    { name = 'emoji' },
    { name = 'spell' },
  },
})

