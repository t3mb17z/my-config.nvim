vim.o.background = "dark"

local tmpdir = os.getenv("TMPDIR") or "/tmp"

local function has_dbus_socket()
    local p = io.popen("ls " .. tmpdir .. "/dbus-* 2>/dev/null")
    local out = p:read("*a")
    p:close()
    return out ~= nil and out ~= ""
end

local is_termux_x11 = has_dbus_socket()

local scheme = ""
local colorscheme = "kanagawa"

local char = vim.fn.input("Is day?: ")
if char == 's' then
  scheme = "lotus"
elseif char == 'n' then
  scheme = "wave"
else
  scheme = "dragon"
end

local kanagawa = require("kanagawa")

---@diagnostic disable-next-line: missing-fields, param-type-mismatch
kanagawa.setup({
  commentStyle = { italic = is_termux_x11 },
  functionStyle = { italic = false, bold = true },
  keywordStyle = { italic = is_termux_x11 },
  statementStyle = { italic = is_termux_x11 },
  typeStyle = { bold = true },
  background = {
    dark = scheme,
    light = "lotus"
  }
})

vim.cmd.colorscheme(colorscheme)

return colorscheme
