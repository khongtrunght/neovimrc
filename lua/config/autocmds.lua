require("neo-tree").setup({
  event_handlers = {

    {
      event = "file_opened",
      handler = function(file_path)
        -- auto close
        -- vimc.cmd("Neotree close")
        -- OR
        require("neo-tree.command").execute({ action = "close" })
      end,
    },
  },
})

local cmp_nvim_lsp = require("cmp_nvim_lsp")
require("lspconfig").clangd.setup({
  capabilities = cmp_nvim_lsp.default_capabilities(),
  cmd = {
    "clangd",
    "--offset-encoding=utf-16",
  },
})

require("lspconfig").pyright.setup({
  settings = {
    pyright = {
      -- Using Ruff's import organizer
      disableOrganizeImports = true,
    },
    python = {
      analysis = {
        -- Ignore all files for analysis to exclusively use Ruff for linting
        ignore = { "*" },
      },
    },
  },
})

require("lspconfig").ruff.setup({})
