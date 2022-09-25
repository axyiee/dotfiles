local wezterm = require("wezterm")

return {
    default_cursor_style = "BlinkingBlock",
    use_fancy_tab_bar = false,
    tab_bar_at_bottom = true,
    tab_max_width = 999999,
    inactive_pane_hsb = {
        brightness = 0.7,
    },
    color_scheme = "Poimandres",
    font = wezterm.font("SpaceMono Nerd Font"),
    font_size = 13,
    line_height = 1.5
}
