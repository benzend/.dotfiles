nnoremap = require("b.keymap").nnoremap
tnoremap = require("b.keymap").tnoremap
vnoremap = require("b.keymap").vnoremap

nnoremap("to", ":lua nvim_open_term()")
tnoremap("<ESC>", "<C-\\><C-n>")
nnoremap("<Leader>y", "+y")
vnoremap("<Leader>y", "+y")
