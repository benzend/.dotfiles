local M = {
	'neovim/nvim-lspconfig',
	config = function()
		-- Setup nvim-cmp.
			local cmp = require("cmp")
			local source_mapping = {
				nvim_lsp = "[LSP]",
				nvim_lua = "[Lua]",
				-- cmp_tabnine = "[TN]",
				path = "[Path]",
			}
			local lspkind = require("lspkind")

			cmp.setup({
				snippet = {
					expand = function(args)
						-- For `vsnip` user.
						-- vim.fn['vsnip#anonymous'](args.body)

						-- For `luasnip` user.
						-- luasnip.lsp_expand(args.body)

						-- For `ultisnips` user.
						-- vim.fn['UltiSnips#Anon'](args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						else
							fallback()
						end
					end, { "i", "s" }),
					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						else
							fallback()
						end
					end, { "i", "s" }),
					["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
					["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
					["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
					["<C-y>"] = cmp.config.disable,
					["<C-e>"] = cmp.mapping({
						i = cmp.mapping.abort(),
						c = cmp.mapping.close(),
					}),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
				}),

				formatting = {
					format = function(entry, vim_item)
						vim_item.kind = lspkind.presets.default[vim_item.kind]
						local menu = source_mapping[entry.source.name]
						if entry.source.name == "cmp_tabnine" then
							if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
								menu = entry.completion_item.data.detail .. " " .. menu
							end
							vim_item.kind = ""
						end
						vim_item.menu = menu
						return vim_item
					end,
				},

				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
				}),
			})
			-- Mappings.
			-- See `:help vim.diagnostic.*` for documentation on any of the below functions
			local opts = { noremap = true, silent = true }
			vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
			vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)

			-- Use an on_attach function to only map the following keys
			-- after the language server attaches to the current buffer
			local on_attach = function(client, bufnr)
				-- Enable completion triggered by <c-x><c-o>
				vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

				-- Mappings.
				-- See `:help vim.lsp.*` for documentation on any of the below functions
				local bufopts = { noremap = true, silent = true, buffer = bufnr }
				vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
				vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
				vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
				vim.keymap.set("n", "<space>sh", vim.lsp.buf.signature_help, bufopts)
				vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
				vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
				vim.keymap.set("n", "<space>wl", function()
					print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
				end, bufopts)
				vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
				vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
				vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
				vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
				vim.keymap.set("n", "<space>fo", function()
					vim.lsp.buf.format({ async = true })
				end, bufopts)
			end

			local lsp_flags = {
				-- This is the default in Nvim 0.7+
				debounce_text_changes = 150,
			}
			require("lspconfig")["tsserver"].setup({
				on_attach = on_attach,
				flags = lsp_flags,
			})
			require("lspconfig")["rust_analyzer"].setup({
				on_attach = on_attach,
				flags = lsp_flags,
				-- Server-specific settings...
				settings = {
					["rust-analyzer"] = {},
				},
			})
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities.textDocument.completion.completionItem.snippetSupport = true
			require("lspconfig")["cssls"].setup({
				on_attach = on_attach,
				flags = lsp_flags,
				capabilities = capabilities,
			})
			require("lspconfig")["html"].setup({
				on_attach = on_attach,
				flags = lsp_flags,
			})
			require("lspconfig")["lua_ls"].setup({
				on_attach = on_attach,
				flags = lsp_flags,
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
			})
			require("lspconfig")["intelephense"].setup({
				on_attach = on_attach,
				flags = lsp_flags,
				settings = {
					intelephense = {
						stubs = {
							"wordpress",
						},
					},
				},
			})
			require("lspconfig")["solargraph"].setup({
				on_attach = on_attach,
				flags = lsp_flags,
				settings = {
					diagnostics = true
				}
			})
	end
}

return M
