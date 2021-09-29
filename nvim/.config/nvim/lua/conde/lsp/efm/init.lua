local lsp_config = require('lspconfig')

local eslint = {
  lintCommand = 'eslint_d -f unix --stdin --stdin-filename ${INPUT}',
  lintIgnoreExitCode = true,
  lintStdin = true,
  lintFormats = { '%f:%l:%c: %m' },
  formatCommand = 'eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}',
  formatStdin = true,
}

local prettier = {
  formatCommand = 'prettier --stdin-filepath ${INPUT}',
  formatStdin = true,
}

local efm_config = os.getenv('HOME') .. '/.config/nvim/lua/lsp/efm/config.yaml'
local efm_log_dir = '/tmp/'

local efm_root_markers = {
  '.git/',
  '.eslintrc.js',
  '.eslintrc.cjs',
  '.eslintrc.yaml',
  '.eslintrc.yml',
  '.eslintrc.json',
  '.eslintrc',
  '.prettierrc',
  '.prettierrc.json',
  '.prettierrc.yml',
  '.prettierrc.yaml',
  '.prettierrc.js',
  '.prettierrc.cjs',
  '.prettierrc.config.js',
  '.prettierrc.config.cjs',
  '.prettierrc.toml',
}

local efm_languages = {
  javascript = { eslint, prettier },
  javascriptreact = { eslint, prettier },
  ["javascript.jsx"] = { eslint, prettier },
  typescript = { eslint, prettier },
  typescriptreact = { eslint, prettier },
  ["typescript.tsx"] = { eslint, prettier },
  yaml = { prettier },
  json = { prettier },
  markdown = { prettier },
  css = { prettier },
  scss = { prettier },
  sass = { prettier },
  graphql = { prettier },
  html = { prettier }
}

return function (on_attach, capabilities)
  lsp_config.efm.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = {
      "efm-langserver",
      "-c",
      efm_config,
      "-logfile",
      efm_log_dir .. "efm.log"
    },
    root_dir = lsp_config.util.root_pattern(unpack(efm_root_markers)),
    init_options = { documentFormatting = true, codeAction = true },
    filetypes = vim.tbl_keys(efm_languages),
    settings = {
      languages = efm_languages
    }
  })
end

