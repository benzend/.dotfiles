local M = {
	'neovim/nvim-lspconfig',
	dependencies = {
		'L3MON4D3/LuaSnip'
	},
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
          formatting = {
            format = lspkind.cmp_format({
              mode = 'symbol_text',
              maxwidth = 50,
              ellispis_char = '...',
            })
          },
					expand = function(args)
						-- For `vsnip` user.
						-- vim.fn['vsnip#anonymous'](args.body)

						-- For `luasnip` user.
						require('luasnip').lsp_expand(args.body)

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
					["<CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = false
          }),
				}),

				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
				}, {
          { name = "buffer" }
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

      local capabilities = require('cmp_nvim_lsp').default_capabilities()

			vim.lsp.config("ts_ls", {
        capabilities = capabilities,
				on_attach = on_attach,
			})

			vim.lsp.config("rust_analyzer", {
				on_attach = on_attach,
        capabilities = capabilities,
				-- Server-specific settings...
				settings = {
					["rust-analyzer"] = {},
				},
			})

			vim.lsp.config("cssls", {
				on_attach = on_attach,
        capabilities = capabilities,
			})

			vim.lsp.config("html", {
				on_attach = on_attach,
        capabilities = capabilities,
			})
			vim.lsp.config("lua_ls", {
				on_attach = on_attach,
        capabilities = capabilities,
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
			})
			vim.lsp.config("intelephense", {
				on_attach = on_attach,
        capabilities = capabilities,
				settings = {
					intelephense = {
						stubs = {
							"wordpress",
						},
					},
				},
			})
			vim.lsp.config("gopls", {
				on_attach = on_attach,
        capabilities = capabilities,
			})
			vim.lsp.config("ruby_lsp", {
				on_attach = on_attach,
        capabilities = capabilities,
			})
      vim.lsp.config("ocamllsp", {
				on_attach = on_attach,
        capabilities = capabilities,
      })
	end
}

return M
