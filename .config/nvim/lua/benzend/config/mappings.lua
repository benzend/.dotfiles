local nnoremap = require('benzend.config.keymap').nnoremap
local tnoremap = require('benzend.config.keymap').tnoremap
local vnoremap = require('benzend.config.keymap').vnoremap

nnoremap('to', '<cmd>:terminal<CR>')
nnoremap('<Leader>ex', '<cmd>:Oil<CR>')
tnoremap('<ESC>', '<C-\\><C-n>')
nnoremap('<Leader>y', '+y')
vnoremap('<Leader>y', '+y')
nnoremap('<Leader>fp', '<cmd>lua require("telescope").extensions.projects.projects{}<CR>')
