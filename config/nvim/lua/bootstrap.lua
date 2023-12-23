local function clone_paq()
  local path = vim.fn.stdpath('data') .. '/site/pack/paqs/start/paq-nvim'
  local is_installed = vim.fn.empty(vim.fn.glob(path)) == 0

  if not is_installed then
    vim.fn.system {
      'git',
      'clone',
      '--depth=1',
      'https://github.com/savq/paq-nvim.git',
      path,
    }
    vim.cmd.packadd('paq-nvim')
    return true
  end
end

local function go(packages)
  local first_install = clone_paq()
  local paq = require('paq')

  require('plugins')

  if first_install then
    vim.notify('Installing plugins...')
    vim.cmd('autocmd User PaqDoneInstall quit')
    paq.install()
  else
    vim.notify('Updating plugins...')
    vim.cmd('autocmd User PaqDoneUpdate quit')
    paq.update()
  end
end

return {
  go = go,
}
