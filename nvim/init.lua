-- スペースをリーダーキーにする
vim.g.mapleader = " "

-- 行番号の表示 + 相対表示
vim.opt.number = true
vim.opt.relativenumber = true

-- タブ関連の設定
vim.opt.tabstop = 2      -- タブ = スペース2つ分
vim.opt.shiftwidth = 2   -- 自動インデントの幅をスペース2つ分にする
vim.opt.expandtab = true -- タブキー → タブ文字でなくスペースを追加する

-- 折り返しなし
vim.opt.wrap = false

-- 検索時の大文字・小文字の区別
vim.opt.ignorecase = true -- 大文字・小文字を区別しない
vim.opt.smartcase = true  -- 検索文字列に大文字が含まれるときのみ区別する

-- TrueColor を有効にする (カラースキームの表示に必要)
vim.opt.termguicolors = true

-- サインカラムを常に表示する
vim.opt.signcolumn = "yes"

-- Neovimのヤンク・ペーストをシステムクリップボードと共有する
vim.opt.clipboard = "unnamedplus"

-- Undo履歴をファイルに保存する
vim.opt.undofile = true

-- 画面端から8行以内にカーソルが来たら自動でスクロールする
vim.opt.scrolloff = 8

-- [[wiki-link]] 形式のリンクで gf を使えるようにする
vim.opt.suffixesadd:append(".md")
vim.opt.includeexpr = "substitute(v:fname,'\\[\\[\\|\\]\\]','','g')"

--------------------
-- 次の require は常にファイル末尾に来るようにする
-- i.e. 設定を追記するならこのセクションの上に書く
--------------------
require("config.keymaps")
require("config.lazy")
