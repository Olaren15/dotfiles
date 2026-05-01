-- Must be loaded before blink
require("lazydev").setup({
  library = {
    -- See the configuration section for more details
    -- Load luvit types when the `vim.uv` word is found
    { path = "${3rd}/luv/library", words = { "vim%.uv" } },
  },
})

require("blink.cmp").setup({
  keymap = {
    preset = "default",
    ["<A-1>"] = {
      function(cmp)
        cmp.accept({ index = 1 })
      end,
    },
    ["<A-2>"] = {
      function(cmp)
        cmp.accept({ index = 2 })
      end,
    },
    ["<A-3>"] = {
      function(cmp)
        cmp.accept({ index = 3 })
      end,
    },
    ["<A-4>"] = {
      function(cmp)
        cmp.accept({ index = 4 })
      end,
    },
    ["<A-5>"] = {
      function(cmp)
        cmp.accept({ index = 5 })
      end,
    },
    ["<A-6>"] = {
      function(cmp)
        cmp.accept({ index = 6 })
      end,
    },
    ["<A-7>"] = {
      function(cmp)
        cmp.accept({ index = 7 })
      end,
    },
    ["<A-8>"] = {
      function(cmp)
        cmp.accept({ index = 8 })
      end,
    },
    ["<A-9>"] = {
      function(cmp)
        cmp.accept({ index = 9 })
      end,
    },
    ["<A-0>"] = {
      function(cmp)
        cmp.accept({ index = 10 })
      end,
    },
  },

  completion = {
    documentation = {
      auto_show = true,
    },
    list = {
      selection = {
        preselect = true,
        auto_insert = false,
      },
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
          },
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
            end,
          },
        },
      },
    },
  },

  signature = {
    enabled = true,
  },

  sources = {
    default = { "lazydev", "lsp", "path", "snippets", "buffer" },
    providers = {
      lazydev = {
        name = "LazyDev",
        module = "lazydev.integrations.blink",
        -- make lazydev completions top priority (see `:h blink.cmp`)
        score_offset = 100,
      },
    },
  },

  fuzzy = { implementation = "prefer_rust_with_warning" },
})
