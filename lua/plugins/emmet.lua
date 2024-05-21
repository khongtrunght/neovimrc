return {
  "mattn/emmet-vim",
  config = function()
    vim.g.user_emmet_settings = {
      javascript = {
        extends = "jsx",
      },
    }
  end,
}
