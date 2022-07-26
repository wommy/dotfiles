local nnoremap = require('keymap').nnoremap
local inoremap = require('keymap').inoremap
local nmap = require('keymap').nmap

vim.g.coc_global_extensions = {'coc-tsserver', 'coc-json', 'coc-html', 'coc-css', 'coc-emmet'}

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
vim.opt.updatetime=300

-- Don't pass messages to |ins-completion-menu|.
vim.opt.shortmess="c"

-- Always show the signcolumn, otherwise it would shift the text each time
-- diagnostics appear/become resolved.
vim.opt.signcolumn="number"

-- Use tab for trigger completion with characters ahead and navigate.
-- NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
-- other plugin before putting this into your config.
--inoremap <silent><expr> <TAB>
	--\ pumvisible() and "\<C-n>" or
	--\ CheckBackspace() and "\<TAB>" or
	--\ coc#refresh()
--inoremap('<expr><S-TAB>', (pumvisible() and "\<C-p>" or "\<C-h>")

--function! CheckBackspace() abort
	--let col = col('.') - 1
	--return !col || getline('.')[col - 1]  =~# '\s'
--endfunction

-- Use <c-space> to trigger completion.
inoremap('<silent><expr> <c-space>', 'coc#refresh()')

-- GoTo code navigation.
nmap('<silent> gd', '<Plug>(coc-definition)')
nmap('<silent> gy', '<Plug>(coc-type-definition)')
nmap('<silent> gi', '<Plug>(coc-implementation)')
nmap('<silent> gr', '<Plug>(coc-references)')
