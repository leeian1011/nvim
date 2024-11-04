---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },

    --  format with conform
    ["<leader>fm"] = {
      function()
        require("conform").format()
      end,
      "formatting",
    }

  },
  v = {
    [">"] = { ">gv", "indent"},
  },
}

-- more keybinds!

M.nvimtree = {
  n = {
    ["<C-p>"] = { "<cmd> NvimTreeToggle<CR>", "Toggle nvimtree", opts = { nowait = true} },
  }
}

M.general = {
  n = {
    ["<leader>|"] = { "<cmd> vert split<CR>", "Split buffer vertically", opts = { nowait = true } },
    ["<leader>_"] = { "<cmd> split<CR>", "Split buffer horizontally", opts = { nowait = true } },
  }
}

M.telescope = {
  n = {
    ["<leader>fg"] = { "<cmd> Telescope live_grep <CR>", "Live grep" },
    ["<leader>ff"] = { "<cmd> Telescope find_files <CR>", "Live files" },
  }
}
return M
