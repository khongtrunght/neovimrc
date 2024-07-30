local Util = require("lazyvim.util")
local augroup = vim.api.nvim_create_augroup
local ThePrimeagenGroup = augroup("ThePrimeagen", {})
local autocmd = vim.api.nvim_create_autocmd

-- local custom_format = function()
--   if vim.bo.filetype == "templ" then
--     local bufnr = vim.api.nvim_get_current_buf()
--     local filename = vim.api.nvim_buf_get_name(bufnr)
--     local cmd = "templ fmt " .. vim.fn.shellescape(filename)
--
--     vim.fn.jobstart(cmd, {
--       on_exit = function()
--         -- Reload the buffer only if it's still the current buffer
--         if vim.api.nvim_get_current_buf() == bufnr then
--           vim.cmd("e!")
--         end
--       end,
--     })
--   else
--     vim.lsp.buf.format()
--   end
-- end
--
-- vim.api.nvim_create_autocmd({ "BufWritePre" }, { pattern = { "*.templ" }, callback = custom_format })
autocmd("LspAttach", {
  group = ThePrimeagenGroup,
  callback = function(e)
    local opts = { buffer = e.buf }
    -- opts.desc = "Go to definition"
    -- vim.keymap.set("n", "gd", function()
    --   vim.lsp.buf.definition()
    -- end, opts)
    -- opts.desc = "Show hover"
    -- vim.keymap.set("n", "K", function()
    --   vim.lsp.buf.hover()
    -- end, opts)
    opts.desc = "Search workspace symbols"
    vim.keymap.set("n", "<leader>ws", function()
      vim.lsp.buf.workspace_symbol()
    end, opts)
    opts.desc = "Open diagnostics float"
    vim.keymap.set("n", "<leader>vd", function()
      vim.diagnostic.open_float()
    end, opts)
    vim.keymap.set("n", "<leader>ca", function()
      vim.lsp.buf.code_action()
    end, opts)
    opts.desc = "Show references"
    vim.keymap.set("n", "<leader>rr", function()
      vim.lsp.buf.references()
    end, opts)
    opts.desc = "Rename"
    vim.keymap.set("n", "<leader>rn", function()
      vim.lsp.buf.rename()
    end, opts)
    opts.desc = "Show signature help"
    vim.keymap.set("i", "<C-h>", function()
      vim.lsp.buf.signature_help()
    end, opts)
    opts.desc = "Go to next diagnostic"
    vim.keymap.set("n", "[d", function()
      vim.diagnostic.goto_next()
    end, opts)
    opts.desc = "Go to previous diagnostic"
    vim.keymap.set("n", "]d", function()
      vim.diagnostic.goto_prev()
    end, opts)
  end,
})

-- require("mason-lspconfig").setup_handlers({
--   ["rust_analyzer"] = function() end,
-- })

return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/nvim-cmp",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "j-hui/fidget.nvim",
  },

  opts = {
    setup = {
      rust_analyzer = function()
        return true
      end,
    },
    -- setup = {
    --   rust_analyzer = function()
    --     return true
    --   end,
    -- },
    inlay_hints = {
      enabled = true,
      exclude = { "vue" }, -- filetypes for which you don't want to enable inlay hints
    },
    codelens = {
      enabled = false,
    },
  },
}
