local map = require('utils.helpers').map

map('x', 'J', ":move '>+1<CR>gv-gv")
map('x', 'K', ":move '<-2<CR>gv-gv")

map('n', 'H', '^')
map('n', 'L', '$')
map('v', 'H', '^')
map('v', 'L', '$')
map('x', 'H', '^')
map('x', 'L', '$')

-- Stay in indent mode
map('v', '<', '<gv')
map('v', '>', '>gv')

map('i', '<C-d>', '<Del>')

-- map('n', 'gj', 'j')
-- map('n', 'gk', 'k')
-- map('n', 'j', 'gj')
-- map('n', 'k', 'gk')
-- map('n', 'm', 'm')

vim.keymap.set({ 'n', 'v', 'o', 'x' }, 'M', '%', { remap = true, silent = true })

map('n', 'ma', 'ma')
map('n', 'mA', 'mA')
if vim.g.vscode then
  local vscode = require('vscode-neovim')
  map('n', 'ga', function()
    vscode.call('editor.action.quickFix')
  end)
  map('n', ']d', function()
    vscode.call('editor.action.marker.next')
  end)
  map('n', '[d', function()
    vscode.call('editor.action.marker.prev')
  end)
  map('n', ']e', function()
    vscode.call('go-to-next-error.next.error')
  end)
  map('n', '[e', function()
    vscode.call('go-to-next-error.prev.error')
  end)
  map('n', '<C-w>c', function()
    vscode.call('workbench.action.closeEditorsInGroup')
  end)
  map('n', 'gl', function()
    vscode.call('editor.action.showHover')
  end)
  map('n', 'gr', function()
    vscode.call('editor.action.goToReferences')
  end)
  map('n', 'gx', function()
    vscode.action('editor.action.openLink')
  end)
  map('n', '<space>', function()
    vscode.action('whichkey.show')
  end)

  vim.cmd([[
    function! s:manageEditorSize(...)
        let count = a:1
        let to = a:2
        for i in range(1, count ? count : 1)
            call VSCodeNotify(to ==# 'increase' ? 'workbench.action.increaseViewSize' : 'workbench.action.decreaseViewSize')
        endfor
    endfunction

    " Sample keybindings. Note these override default keybindings mentioned above.
    nnoremap <M-l> <Cmd>call <SID>manageEditorSize(v:count, 'increase')<CR>
    xnoremap <M-l> <Cmd>call <SID>manageEditorSize(v:count, 'increase')<CR>
    nnoremap <M-h> <Cmd>call <SID>manageEditorSize(v:count, 'decrease')<CR>
    xnoremap <M-h> <Cmd>call <SID>manageEditorSize(v:count, 'decrease')<CR>
    nnoremap <M-j> <Cmd>call <SID>manageEditorSize(v:count, 'decrease')<CR>
    xnoremap <M-j> <Cmd>call <SID>manageEditorSize(v:count, 'decrease')<CR>
    nnoremap <M-k> <Cmd>call <SID>manageEditorSize(v:count, 'increase')<CR>
    xnoremap <M-k> <Cmd>call <SID>manageEditorSize(v:count, 'increase')<CR>
  ]])
end
