return {
  {
    "polirritmico/monokai-nightasty.nvim",
    name = "monokai-nightasty",
    priority = 1000,
    config = function()
      require("monokai-nightasty").setup({
        style = "dark", -- 可選: "dark" 或 "light"
        transparent = false, -- 啟用透明背景
        italic = {
          comments = true,
          strings = false,
          keywords = false,
          functions = false,
          variables = false,
        },
      })
      vim.cmd.colorscheme("monokai-nightasty")
    end,
  },
}
