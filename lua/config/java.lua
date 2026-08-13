local home = os.getenv("HOME")
local prefix = os.getenv("PREFIX")
local jdtls_path = home .. "/jdtls"
local java_bin = (os.getenv("JAVA_HOME") or prefix) .. "/bin/java"
local workspace_dir = home .. "/.local/jdtls/workspace"
local project = workspace_dir .. '/' .. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")

local config = {
    cmd = {
        java_bin,
        "-Declipse.application=org.eclipse.jdt.ls.core.id1",
        "-Dosgi.bundles.defaultStartLevel=4",
        "-Declipse.product=org.eclipse.jdt.ls.core.product",
        "-Dlog.protocol=true",
        "-Dlog.level=ALL",
        "-Xmx1G",
        "--add-modules=ALL-SYSTEM",
        "--add-opens", "java.base/java.util=ALL-UNNAMED",
        "--add-opens", "java.base/java.lang=ALL-UNNAMED",
        "-jar", jdtls_path .. "/plugins/org.eclipse.equinox.launcher_1.7.0.v20250519-0528.jar",
        "-configuration", jdtls_path .. "/config_linux",
        "-data", project,
    },
    single_file_support = true,
    root_dir = nil,
    capabilities = nil,
    on_attach = nil,
    filetypes = nil
}

return config
