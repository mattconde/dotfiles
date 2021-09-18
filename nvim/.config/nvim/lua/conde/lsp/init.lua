local lsp_config = require('lspconfig')
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

require('conde/lsp/efm')

-- npm install -g bash-language-server
lsp_config.bashls.setup{
  capabilities = capabilities,
}

-- npm install -g vscode-css-languageserver-bin
lsp_config.cssls.setup{
  capabilities = capabilities,
}

-- npm install -g graphql-language-service-cli
lsp_config.graphql.setup{
  capabilities = capabilities,
}

-- npm install -g vscode-langservers-extracted
lsp_config.html.setup{
  capabilities = capabilities,
}

-- npm install -g vscode-json-languageserver
lsp_config.jsonls.setup{
  capabilities = capabilities,
}

-- set the path to the sumneko installation; if you previously installed via the now deprecated :LspInstall, use
local sumneko_root_path = '/Users/gbmajaco/projects/lua-language-server'
local sumneko_binary = sumneko_root_path .. "/bin/macOS/lua-language-server"

lsp_config.sumneko_lua.setup{
  capabilities = capabilities,
  cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're usng (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = vim.split(package.path, ';'),
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
        },
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

-- npm install -g typescript typescript-language-server
lsp_config.tsserver.setup{
  capabilities = capabilities,
  -- filetypes = { "typescript", "typescriptreact", "typescript.tsx" }
}

-- npm install -g vim-language-server
lsp_config.vimls.setup{
  capabilities = capabilities,
}

