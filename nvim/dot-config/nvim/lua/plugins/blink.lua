return {
    {
        'saghen/blink.cmp',
        -- use a release tag to download pre-built binaries
        version = '1.*',
        event = "VeryLazy",
        opts = {
            keymap = {
                preset = 'default',
                ['<A-1>'] = { function(cmp) cmp.accept({ index = 1 }) end },
                ['<A-2>'] = { function(cmp) cmp.accept({ index = 2 }) end },
                ['<A-3>'] = { function(cmp) cmp.accept({ index = 3 }) end },
                ['<A-4>'] = { function(cmp) cmp.accept({ index = 4 }) end },
                ['<A-5>'] = { function(cmp) cmp.accept({ index = 5 }) end },
                ['<A-6>'] = { function(cmp) cmp.accept({ index = 6 }) end },
                ['<A-7>'] = { function(cmp) cmp.accept({ index = 7 }) end },
                ['<A-8>'] = { function(cmp) cmp.accept({ index = 8 }) end },
                ['<A-9>'] = { function(cmp) cmp.accept({ index = 9 }) end },
                ['<A-0>'] = { function(cmp) cmp.accept({ index = 10 }) end },
            },

            completion = {
                documentation = {
                    auto_show = true
                },
                list = {
                    selection = {
                        preselect = true,
                        auto_insert = false,
                    }
                },
                menu = {
                    draw = {
                        columns = {
                            {
                                "item_idx",
                            },
                            {
                                "label",
                                "label_description",
                                gap = 1,
                            },
                            {
                                "kind_icon",
                                "kind",
                                gap = 1,
                            },
                            {
                                "source_name",
                            }
                        },
                        components = {
                            item_idx = {
                                text = function(ctx)
                                    if ctx.idx == 10 then
                                        return "0"
                                    end

                                    if ctx.idx >= 10 then
                                        return " "
                                    end

                                    return tostring(ctx.idx)
                                end
                            }
                        }
                    }
                }
            },

            signature = {
                enabled = true,
            },

            -- Default list of enabled providers defined so that you can extend it
            -- elsewhere in your config, without redefining it, due to `opts_extend`
            sources = {
                default = { 'lsp', 'path', 'snippets', 'buffer' },
            },

            fuzzy = { implementation = "prefer_rust_with_warning" }
        },
        opts_extend = { "sources.default" }
    }
}
