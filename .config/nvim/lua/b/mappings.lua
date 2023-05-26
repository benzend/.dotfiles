local nnoremap = require('b.keymap').nnoremap
local tnoremap = require('b.keymap').tnoremap
local vnoremap = require('b.keymap').vnoremap

nnoremap('to', '<cmd>:terminal<CR>')
nnoremap('<Leader>ex', '<cmd>:Ex<CR>')
tnoremap('<ESC>', '<C-\\><C-n>')
nnoremap('<Leader>y', '+y')
vnoremap('<Leader>y', '+y')
