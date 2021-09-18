local lsp_config = require('lspconfig')
local eslint = require('conde.lsp.efm.eslint')
local prettier = require('conde.lsp.efm.prettier')

local efm_config = os.getenv('HOME') .. '/.config/nvim/lua/lsp/efm/config.yaml'
local efm_log_dir = '/tmp/'
local efm_root_markers = { 'package.json', '.git/', '.zshrc' }
local efm_languages = {
  yaml = { prettier },
  json = { prettier },
  markdown = { prettier },
  javascript = { eslint, prettier },
  javascriptreact = { eslint, prettier },
  ["javascript.jsx"] = { eslint, prettier },
  typescript = { eslint, prettier },
  typescriptreact = { eslint, prettier },
  ["typescript.tsx"] = { eslint, prettier },
  css = { prettier },
  scss = { prettier },
  sass = { prettier },
  graphql = { prettier },
  html = { prettier }
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

lsp_config.efm.setup({
  capabilities = capabilities,
  cmd = {
    "efm-langserver",
    "-c",
    efm_config,
    "-logfile",
    efm_log_dir .. "efm.log"
  },
  filetypes = {
    'javascript',
    'javascriptreact',
    'javascript.jsx',
    'typescript',
    'typescriptreact',
    'typescript.tsx'
  },
  root_dir = lsp_config.util.root_pattern(unpack(efm_root_markers)),
  init_options = {
    documentFormatting = true
  },
  settings = {
    rootMarkers = efm_root_markers,
    languages = efm_languages
  }
})
