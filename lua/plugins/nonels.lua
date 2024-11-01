return {
  "nvimtools/none-ls.nvim",
  opts = function(_, opts)
    local nls = require("null-ls")
    opts.root_dir = opts.root_dir
      or require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git")
    opts.sources = vim.list_extend(opts.sources or {}, {
      nls.builtins.formatting.fish_indent,
      nls.builtins.diagnostics.fish,
      nls.builtins.formatting.stylua,
      nls.builtins.formatting.shfmt,
      nls.builtins.formatting.black,
      nls.builtins.diagnostics.mypy.with({
        extra_args = function()
          local virtual = os.getenv("VIRTUAL_ENV")
            or os.getenv("CONDA_PREFIX")
            or "/Users/khongtrunght/.pyenv/versions/3.10.15"
          return { "--python-executable", virtual .. "/bin/python" }
        end,
      }),
    })
  end,
}
