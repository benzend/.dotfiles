local nnoremap = require('benzend.config.keymap').nnoremap

nnoremap('<Leader>ha', function()
	require("harpoon.mark").add_file()
end)
nnoremap('<Leader>hl', function()
	require("harpoon.ui").toggle_quick_menu()
end)
