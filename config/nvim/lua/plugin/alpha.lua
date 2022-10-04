local ok, alpha = pcall(require, "alpha")
if not ok then
    return
end

local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = {
    "⢀⣀ ⣀⣀ ⢀⣀ ⡇ ⢀⡀ ⢀⣀",
    "⠣⠼ ⠴⠥ ⠣⠼ ⠣ ⠣⠭ ⠣⠼",
}

dashboard.config.layout = {
    { type = "padding", val = 5 },
    dashboard.section.header,
    { type = "padding", val = 2 },
    dashboard.section.buttons,
    { type = "padding", val = 1 },
    dashboard.section.footer,
}

alpha.setup(dashboard.opts)
