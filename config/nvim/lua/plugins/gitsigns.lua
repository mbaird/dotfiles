local ok, gitsigns = pcall(require, "gitsigns")
if not ok then return end

gitsigns.setup({
  on_attach = function(bufnr)
    local function map(mode, lhs, rhs, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, lhs, rhs, opts)
    end

    map("n", "]c", function()
      if vim.wo.diff then
        vim.cmd.normal({ "]c", bang = true })
      else
        gitsigns.nav_hunk("next")
      end
    end, { desc = "Next hunk" })

    map("n", "[c", function()
      if vim.wo.diff then
        vim.cmd.normal({ "[c", bang = true })
      else
        gitsigns.nav_hunk("prev")
      end
    end, { desc = "Previous hunk" })

    map("n", "<leader>hs", gitsigns.stage_hunk, { desc = "Stage hunk" })
    map("n", "<leader>hr", gitsigns.reset_hunk, { desc = "Reset hunk" })
    map("n", "<leader>hp", gitsigns.preview_hunk, { desc = "Preview hunk" })

    -- unimpaired-style toggles: yog{l,w,d}
    map("n", "yogl", gitsigns.toggle_linehl, { desc = "Toggle git line highlight" })
    map("n", "yogw", gitsigns.toggle_word_diff, { desc = "Toggle git word diff" })
    map("n", "yogd", gitsigns.toggle_deleted, { desc = "Toggle git deleted lines" })
  end,
})
