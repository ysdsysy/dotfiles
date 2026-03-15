-- lazy.nvim の自動インストール (初回起動時のみ動く)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- lazy.nvim の起動
require("lazy").setup({
  spec = {
    -- lua/plugins/ フォルダ内のファイルをプラグイン設定として読み込む
    { import = "plugins" },
  },
  -- プラグインインストール中に使う仮のカラースキーム
  install = { colorscheme = { "habamax" } },
  checker = { enabled = false },
})
