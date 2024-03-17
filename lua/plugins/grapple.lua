return {
  "cbochs/grapple.nvim",
  dependencies = {
    { "nvim-tree/nvim-web-devicons", lazy = true },
  },
  opts = {
    -- scope = "git", -- also try out "git_branch"
    icons = true,
    status = true,
  },
  event = { "BufReadPost", "BufNewFile" },
  cmd = "Grapple",
  keys = {
    { "<leader>a", "<cmd>Grapple toggle<cr>", desc = "Tag a file" },
    { "<leader>tgs", "<cmd>Grapple toggle_scopes<cr>", desc = "Grapple toggle scopes" },
    { "<leader>h", "<cmd>Telescope grapple tags<cr>", desc = "Open grapple windows with telescope" },
    { "<c-e>", "<cmd>Grapple toggle_tags<cr>", desc = "Toggle tags menu" },
    { "<c-k>", "<cmd>Grapple cycle forward<cr>", desc = "Grapple cycle forward" },
    { "<c-j>", "<cmd>Grapple cycle backward<cr>", desc = "Grapple cycle backward" },
    { "<leader>1", "<cmd>Grapple select index=1<cr>", desc = "Grapple select 1" },
    { "<leader>2", "<cmd>Grapple select index=2<cr>", desc = "Grapple select 2" },
    { "<leader>3", "<cmd>Grapple select index=3<cr>", desc = "Grapple select 3" },
    { "<leader>4", "<cmd>Grapple select index=4<cr>", desc = "Grapple select 4" },
    -- { "C-j>", "<cmd>Grapple select index=1<cr>", desc = "Select tag 1" },
    -- { "C-k>", "<cmd>Grapple select index=2<cr>", desc = "Select tag 2" },
    -- { "C-l>", "<cmd>Grapple select index=3<cr>", desc = "Select tag 3" },
    -- { "C-;>", "<cmd>Grapple select index=4<cr>", desc = "Select tag 4" },
  },
  config = function()
    require("telescope").load_extension("grapple")
    require("lualine").setup({
      sections = {
        lualine_b = { "grapple" },
      },
    })
  end,
}
