return {
  {
    "mfussenegger/nvim-dap",
    keys = {
      {
        "<leader>db",
        function()
          require("dap").toggle_breakpoint()
        end,
        { noremap = true, silent = true },
      },
      {
        "<leader>dus",
        function()
          local widgets = require("dap.ui.widgets")
          local sidebar = widgets.sidebar(widgets.scopes)
          sidebar.open()
        end,
        { noremap = true, silent = true },
      },
    },
    config = function() end,
  },
  {
    "leoluz/nvim-dap-go",
    ft = "go",
    dependencies = "mfussenegger/nvim-dap",
    config = function(_, opts)
      require("dap-go").setup(opts)
    end,
    keys = {
      {
        "<leader>dgt",
        function()
          require("dap-go").debug_test()
        end,
        { noremap = true, silent = true },
      },
      {
        "<leader>dgl",
        function()
          require("dap-go").debug_last()
        end,
        { noremap = true, silent = true },
      },
      {
        "<leader>dgd",
        "<cmd>lua require('dap-go').debug()<CR>",
        { noremap = true, silent = true },
      },
    },
  },
}
