return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      sources = {
        lsp_implementations = {
          transform = function(item)
            if item.file and item.file:match("_mock") then
              return false
            end
          end,
        },
      },
    },
  },
}
