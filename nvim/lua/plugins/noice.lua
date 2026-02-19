return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    cmdline = {
      view = "cmdline",
      format = {
        cmdline = false,
        search_down = false,
        search_up = false,
        filter = false,
        lua = false,
        help = false,
        input = false,
      },
    },
  },
}
