local keymap = vim.keymap.set

-- Buffer
keymap("n", "<leader>d", "<cmd>bdelete<return>", { silent = true })
keymap("n", "<leader>D", "<cmd>bdelete!<return>", { silent = true })
keymap("n", "<leader><leader>", "<c-^>")

-- Quick save
keymap("n", "<esc><esc>", "<cmd>write<return>")

-- Quick exit terminal mode
keymap("t", "<esc>", "<C-\\><C-n>")

-- Unmap suspend
keymap("n", "<c-z>", "")

-- Toggle quickfix
keymap("n", "<leader>q", function()
  local open = vim.fn.getqflist({ winid = 0 }).winid ~= 0
  if open then
    vim.cmd("cclose")
  else
    vim.cmd("copen")
    vim.cmd("wincmd p")
  end
end)

-- Searching and replacing
-- keymap("n", "<leader>ff", [[:Rg ]])
-- keymap("n", "<leader>fw", [[:Rg <<C-r><C-w>>]])
-- keymap("v", "<leader>fw", [[y:Rg <C-r>"]])
-- keymap("n", "<leader>sw", [[:%s/\<<C-r><C-w>\>//c<Left><Left>]])
-- keymap("v", "<leader>sw", [[y:%s/<C-r>"//c<Left><Left>]])

-- fzf
local ok, fzf = pcall(require, "fzf-lua")
if ok then
  keymap("n", "ff", fzf.files)
  keymap("n", "fg", fzf.buffers)
  keymap("n", "gd", fzf.lsp_definitions)
  keymap("n", "gr", fzf.lsp_references)
  keymap("n", "gs", fzf.lsp_document_symbols)
end

-- lsp
keymap("n", "ga", vim.lsp.buf.code_action)
keymap("n", "<leader>f", function()
  vim.lsp.buf.format({ async = true })
end)

-- vim-test
keymap("n", "<leader>t", "<cmd>w | TestNearest<CR>")
keymap("n", "<leader>T", "<cmd>w | TestFile<CR>")
keymap("n", "<leader>l", "<cmd>w | TestLast<CR>")
keymap("n", "<leader>S", "<cmd>w | TestSuite<CR>")
keymap("n", "<leader>m", "<cmd>w | make<CR>")
