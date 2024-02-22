return {
  -- { "ellisonleao/gruvbox.nvim", config = true, opts = ... },

  {
    "projekt0n/github-nvim-theme",
    -- lazy = false, -- make sure we load this during startup if it is your main colorscheme
    -- priority = 1000, -- make sure to load this before all the other start plugins
    -- config = function()
    --   require("github-theme").setup({
    --     -- ...
    --   })
    --
    --   vim.cmd("colorscheme github_dark")
    -- end,
  },

  { "ellisonleao/gruvbox.nvim" },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "github_dark_dimmed",
    },
  },

  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    opts = function(_, opts)
      opts.setup = {
        options = {
          theme = "gruvbox",
        },
      }
      return opts
    end,
  },
}
