---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

local stbufnr = function()
  return vim.api.nvim_win_get_buf(vim.g.statusline_winid or 0)
end
M.ui = {
  theme = "monochrome",
  theme_toggle = { "monochrome", "one_light" },

  hl_override = highlights.override,
  hl_add = highlights.add,
  statusline = {
    order = { "mode", "relativepath", "file", "git", "%=", "lsp_msg", "%=", "diagnostics", "lsp", "cwd", "cursor" },
    overriden_modules = function(modules)
      table.remove(modules, 2)
      table.insert(
        modules,
        2,
        (function()
          local sep_l = ">"
          local sep_r = "%#St_sep_r#" .. "" .. " %#ST_EmptySpace#"

          local function gen_block(icon, txt, sep_l_hlgroup, iconHl_group, txt_hl_group)
            return sep_l_hlgroup .. sep_l .. iconHl_group .. icon .. " " .. txt_hl_group .. " " .. txt .. sep_r
          end

          local icon = "󰈚"
          local name = vim.fn.expand("%:.")

          if name ~= "" then
            local devicons_present, devicons = pcall(require, "nvim-web-devicons")

            if devicons_present then
              local ft_icon = devicons.get_icon(name)
              icon = (ft_icon ~= nil and ft_icon) or icon
            end
          else
            name = "<new>"
          end

          return gen_block(icon, name, "%#St_file_sep#", "%#St_file_bg#", "%#St_file_txt#")
        end)()
      )
    end,
  },

  telescope = { style = "bordered" }, -- borderless / bordered

  transparency = true,

  nvdash = {
    load_on_startup = true,
    header = {
      "███╗░░██╗███████╗░█████╗░██╗░░░██╗██╗███╗░░░███╗",
      "████╗░██║██╔════╝██╔══██╗██║░░░██║██║████╗░████║",
      "██╔██╗██║█████╗░░██║░░██║╚██╗░██╔╝██║██╔████╔██║",
      "██║╚████║██╔══╝░░██║░░██║░╚████╔╝░██║██║╚██╔╝██║",
      "██║░╚███║███████╗╚█████╔╝░░╚██╔╝░░██║██║░╚═╝░██║",
      "╚═╝░░╚══╝╚══════╝░╚════╝░░░░╚═╝░░░╚═╝╚═╝░░░░░╚═╝",
    }
  }
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
