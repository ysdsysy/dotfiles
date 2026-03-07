return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  config = function()
    require("telescope").setup({})
    require("telescope").load_extension("fzf")

    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<Leader>ff", builtin.find_files, { desc = "Find files" })
    vim.keymap.set("n", "<Leader>fg", builtin.live_grep, { desc = "Live grep" })
    vim.keymap.set("n", "<Leader>fb", builtin.buffers, { desc = "Buffers" })
    vim.keymap.set("n", "<Leader>fh", builtin.help_tags, { desc = "Help tags" })
  end,
}
