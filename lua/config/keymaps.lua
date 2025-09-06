-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

map("i", "jj", "<esc>", {})

map("n", "<F5>", function()
  local ft = vim.bo.filetype
  local filename = vim.fn.expand("%")
  local basename = vim.fn.expand("%:r")

  if ft == "python" then
    vim.cmd("botright split | resize 15 | terminal python3 " .. filename)
  elseif ft == "c" then
    vim.fn.jobstart({ "clang", filename, "-o", basename }, {
      on_exit = function(_, code)
        if code == 0 then
          vim.cmd("botright split | resize 15 | terminal ./" .. basename)
        else
          print("C 編譯失敗")
        end
      end,
    })
  elseif ft == "cpp" then
    vim.fn.jobstart({ "clang++", filename, "-o", basename }, {
      on_exit = function(_, code)
        if code == 0 then
          vim.cmd("botright split | resize 15 | terminal ./" .. basename)
        else
          print("C++ 編譯失敗")
        end
      end,
    })
  else
    print("F5: 未設定此語言 (" .. ft .. ")")
  end
end, { desc = "依語言執行程式" })
