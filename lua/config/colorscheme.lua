vim.o.background = "dark"

-- local tmpdir = os.getenv("TMPDIR") or "/tmp"
--
-- local function has_dbus_socket()
--   local p = io.popen("ls " .. tmpdir .. "/dbus-* 2>/dev/null")
--   local out = p:read("*a")
--   p:close()
--   return out ~= nil and out ~= ""
-- end
--
-- local is_termux_x11 = has_dbus_socket()

require("nightfox").setup({})

vim.cmd.colorscheme("terafox")

return "terafox"
