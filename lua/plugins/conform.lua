return {
  "stevearc/conform.nvim",
  opts = function()
    require("conform").setup({
      modes = {
        python = {
          {
            cmd = "black",
            args = { "--quiet", "-" },
            stdin = true,
          },
          {
            cmd = "isort",
            args = { "-" },
            stdin = true,
          },
        },
      },
    })
  end,
}
