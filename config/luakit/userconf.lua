--    __             __    _ __
--   / /  __ _____ _/ /__ (_) /_
--  / /__/ // / _ `/  '_// / __/
-- /____/\_,_/\_,_/_/\_\/_/\__/

-- Required imports
local modes    = require 'modes'
local settings = require 'settings'

-- Search engines
local engines   = settings.window.search_engines
engines['w!']   = function(arg)
    local l, s = arg:match("^(%a%a):%s*(.+)")
    if l then
        return "https://" .. l .. ".wikipedia.org/wiki/Special:Search?search=" .. s
    else
        return "https://en.wikipedia.org/wiki/Special:Search?search=" .. arg
    end
end
engines['!aur'] = "https://aur.archlinux.org/packages.php?O=0&K=%s&do_Search=Go"
engines['!aw']  = "https://wiki.archlinux.org/index.php/Special:Search?fulltext=Search&search=%s"
engines['!g']   = "https://www.google.com/search?name=f&hl=en&q=%s"
engines['!d']   = "https://www.duckduckgo.com/?q=%s"
engines['!z']   = engines['!g']

-- All keybindings added to the 'normal' mode.
modes.add_binds('normal', {
    {
        "<Control-c>",
        "Copy selected text.",
        function()
            luakit.selection.clipboard = luakit.selection.primary
        end
    },
    {
        "O",
        "Open URL in a new tab.",
        function(w)
            w:enter_cmd(":tabopen ")
        end
    },
    {
        "go",
        "Modify the current URL.",
        function(w)
            w:enter_cmd(":open " .. (w.view.uri or ""))
        end
    },
    {
        'gO',
        'Open a :tabopen command with the current URL as input.',
        function(w)
            w:enter_cmd(":tabopen " .. (w.view.uri or ""))
        end
    },
    {
        '<Control-v>',
        "Enter the passthrough mode.",
        function(w)
            w:set_mode('passthrough')
        end
    },
})

modes.remap_binds("normal", {
    { "<Mouse8>", ":back", true },
    { "<Mouse9>", ":forward", true },
})
