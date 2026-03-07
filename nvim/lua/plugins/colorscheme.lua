return {
  "rebelot/kanagawa.nvim",
  priority = 1000,         -- 他のプラグインより先に読み込む
  config = function()
    vim.cmd.colorscheme("kanagawa")
  end,
}
