return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    -- パーサーのインストール
    require("nvim-treesitter").install({
      "lua", "vim", "vimdoc",
      "javascript", "typescript",
      "python",
      "json", "yaml",
      "markdown", "markdown_inline",
      "html", "css",
      "bash",
    })

    -- ハイライトを有効にする
    vim.api.nvim_create_autocmd("FileType", {
      pattern = {
        "lua", "vim", "help",
        "javascript", "typescript",
        "python",
        "json", "yaml",
        "markdown",
        "html", "css",
        "bash", "sh",
      },
      callback = function()
        vim.treesitter.start()
      end,
    })

    -- treesitter ベースのインデント
    vim.api.nvim_create_autocmd("FileType", {
      pattern = {
        "lua", "javascript", "typescript",
        "python", "json", "yaml",
        "html", "css", "bash", "sh",
      },
      callback = function()
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}
