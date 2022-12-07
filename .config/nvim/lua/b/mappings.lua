nnoremap = require('b.keymap').nnoremap
tnoremap = require('b.keymap').tnoremap
vnoremap = require('b.keymap').vnoremap

nnoremap('to', '<cmd>:terminal<CR>')
nnoremap('<Leader>ex', '<cmd>:Ex<CR>')
tnoremap('<ESC>', '<C-\\><C-n>')
nnoremap('<Leader>y', '+y')
vnoremap('<Leader>y', '+y')
