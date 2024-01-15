return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",

        {
            "L3MON4D3/LuaSnip",
            version = "v2.*",
            build = "make install_jsregexp",
        },
        "saadparwaiz1/cmp_luasnip",
        "rafamadriz/friendly-snippets",
    },
    config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")
        local CompletionItemKind = require("cmp.types").lsp.CompletionItemKind

        local has_words_before = function()
            unpack = unpack or table.unpack
            local line, col = unpack(vim.api.nvim_win_get_cursor(0))
            return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
        end

        require("luasnip.loaders.from_vscode").lazy_load()
        local l = require("luasnip.extras").lambda

        luasnip.add_snippets("all", {
            luasnip.snippet("$basename", { l(l.TM_FILENAME_BASE) }),
        })

        local COMPLETION_KINDS = {
            Class = "",
            Color = "",
            Constant = "",
            Constructor = "",
            Enum = "",
            EnumMember = "",
            Event = "",
            Field = "",
            File = "󰈙",
            Folder = "",
            Function = "",
            Interface = "",
            Keyword = "",
            Method = "",
            Module = "",
            Operator = "",
            Property = "",
            Reference = "",
            Snippet = "",
            Struct = "",
            Text = "",
            TypeParameter = "",
            Unit = "",
            Value = "",
            Variable = "",
        }

        cmp.setup({
            enabled = function()
                local in_prompt = vim.api.nvim_get_option_value("buftype", { scope = "local" }) == "prompt"
                if in_prompt then
                    return false
                end
                local context = require("cmp.config.context")
                return not (context.in_treesitter_capture("comment") == true or context.in_syntax_group("Comment"))
            end,
            confirmation = {
                get_commit_characters = function()
                    return {}
                end,
            },
            view = {
                entries = "custom",
            },
            completion = {
                completeopt = "longest,menuone",
                keyword_pattern = [[\%(-\?\d\+\%(\.\d\+\)\?\|\h\w*\%(-\w*\)*\)]],
                keyword_length = 1,
            },
            window = {
                completion = {
                    col_offset = -2,
                    side_padding = 1,
                },
                documentation = {
                    winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
                },
            },
            formatting = {
                fields = { "kind", "abbr", "menu" },
                format = function(_, vim_item)
                    local function _trim(text, length)
                        if not text then
                            return ""
                        end

                        if text and text:len() > length then
                            text = text:sub(1, length - 2) .. " 󰇘"
                        end

                        return text
                    end

                    local trimmed_abbr = _trim(vim_item.abbr, 40)

                    local kind_name = vim_item.kind

                    vim_item.kind = COMPLETION_KINDS[vim_item.kind]
                    vim_item.abbr = string.format("%s%s", trimmed_abbr, string.rep(" ", 40 - trimmed_abbr:len()))
                    vim_item.menu = kind_name

                    return vim_item
                end,
            },
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            preselect = cmp.PreselectMode.None,
            mapping = {
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-e>"] = cmp.mapping.abort(),
                ["<CR>"] = cmp.mapping.confirm({ select = true }),
                ["<C-n>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    else
                        fallback()
                    end
                end, { "i" }),
                ["<C-p>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    else
                        fallback()
                    end
                end, { "i" }),
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.expand_or_jumpable() then
                        luasnip.expand_or_jump()
                    elseif has_words_before() then
                        cmp.complete()
                    else
                        fallback()
                    end
                end, { "i", "s" }),
                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),
                ["<Down>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    else
                        fallback()
                    end
                end, { "i" }),
                ["<Up>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    else
                        fallback()
                    end
                end, { "i" }),
            },
            sources = {
                { name = "path" },
                { name = "nvim_lua" },
                {
                    name = "nvim_lsp",
                    entry_filter = function(entry, context)
                        local kind = entry:get_kind()

                        local line = context.cursor_line
                        local col = context.cursor.col
                        local char_before_cursor = string.sub(line, col - 1, col - 1)

                        if char_before_cursor == "." then
                            return kind ~= CompletionItemKind.Snippet
                        end

                        return true
                    end,
                },
                { name = "luasnip" },
                { name = "buffer", keyword_length = 5 },
                { name = "crates" },
            },
            sorting = {
                comparators = {
                    cmp.config.compare.offset,
                    cmp.config.compare.exact,
                    cmp.config.compare.score,
                    cmp.config.compare.length,
                    function(entry1, entry2)
                        local KIND_PRIORITY = {
                            EnumMember = 1,
                            Property = 2,
                            Field = 3,
                            Method = 4,
                            Enum = 5,
                            Struct = 6,
                            Class = 7,
                            Interface = 8,
                            Constant = 9,
                            Variable = 10,
                            Keyword = 11,
                            Function = 12,
                            Module = 13,
                            Folder = 14,
                            File = 15,
                        }

                        local kind1_priority = KIND_PRIORITY[CompletionItemKind[entry1:get_kind()]] or 100
                        local kind2_priority = KIND_PRIORITY[CompletionItemKind[entry2:get_kind()]] or 100

                        return kind1_priority < kind2_priority
                    end,
                    cmp.config.compare.kind,
                    cmp.config.compare.sort_text,
                    cmp.config.compare.order,
                },
            },
        })
    end,
}
