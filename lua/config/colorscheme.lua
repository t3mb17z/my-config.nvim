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
-- local colorscheme = "tokyonight"

local char = vim.fn.input("Is day?: ")
if char == 's' then
  scheme = "tokyonight-day"
elseif char == 'n' then
  scheme = "tokyonight-night"
else
  scheme = "tokyonight-storm"
end

require("tokyonight").setup({
  styles = {
    comments = { italic = is_termux_x11 },
    keywords = { italic = is_termux_x11 },
    functions = { bold = true, underline = true },
    variables = {},
  }
})

vim.cmd.colorscheme(scheme)

return scheme
