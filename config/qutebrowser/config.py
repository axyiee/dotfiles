import subprocess
import os
from qutebrowser.api import interceptor

# ================== Youtube Ad Blocking ======================= {{{
def filter_yt(info: interceptor.Request):
    """Block the given request if necessary."""
    url = info.request_url
    if (
        url.host() == "www.youtube.com"
        and url.path() == "/get_video_info"
        and "&adformat=" in url.query()
    ):
        info.block()
interceptor.register(filter_yt)

c.url.searchengines = {
    'DEFAULT':  'https://google.com/search?hl=en&q={}',
    '!g':       'https://google.com/search?hl=en&q={}',
    '!a':       'https://www.amazon.com/s?k={}',
    '!d':       'https://duckduckgo.com/?ia=web&q={}',
    '!dd':      'https://thefreedictionary.com/{}',
    '!e':       'https://www.ebay.com/sch/i.html?_nkw={}',
    '!fb':      'https://www.facebook.com/s.php?q={}',
    '!gh':      'https://github.com/search?o=desc&q={}&s=stars',
    '!gist':    'https://gist.github.com/search?q={}',
    '!gi':      'https://www.google.com/search?tbm=isch&q={}&tbs=imgo:1',
    '!gn':      'https://news.google.com/search?q={}',
    '!ig':      'https://www.instagram.com/explore/tags/{}',
    '!m':       'https://www.google.com/maps/search/{}',
    '!p':       'https://pry.sh/{}',
    '!r':       'https://www.reddit.com/search?q={}',
    '!sd':      'https://slickdeals.net/newsearch.php?q={}&searcharea=deals&searchin=first',
    '!t':       'https://www.thesaurus.com/browse/{}',
    '!tw':      'https://twitter.com/search?q={}',
    '!w':       'https://en.wikipedia.org/wiki/{}',
    '!yelp':    'https://www.yelp.com/search?find_desc={}',
    '!yt':      'https://www.youtube.com/results?search_query={}'
}

# ====================== xresources ======================= {{{
# taken from https://qutebrowser.org/doc/help/configuring.html
def read_xresources(prefix):
    """
    read settings from xresources
    """
    props = {}
    x = subprocess.run(["xrdb", "-query"], stdout=subprocess.PIPE)
    lines = x.stdout.decode().split("\n")
    for line in filter(lambda l: l.startswith(prefix), lines):
        prop, _, value = line.partition(":\t")
        props[prop] = value
    return props

# ==================== Colors ===================== {{{

def lighten(hex_color, factor):
    if len(hex_color) != 7:
        raise Exception("Passed %s into lighten(), needs to be in #87c95f format." % hex_color)
    r = int(hex_color[1:3], 16)
    g = int(hex_color[3:5], 16)
    b = int(hex_color[5:7], 16)
    r = r + (255 - r) * factor
    g = g + (255 - g) * factor
    b = b + (255 - b) * factor
    return "#%02x%02x%02x" % (int(r), int(g), int(b))

xresources = read_xresources("*")
background = xresources["*.background"]
foreground = xresources["*.foreground"]
selected = lighten(background, 0.01)

c.colors.statusbar.normal.bg = background
c.colors.statusbar.command.bg = background
c.colors.statusbar.command.fg = foreground
c.colors.statusbar.normal.fg = foreground

c.colors.tabs.even.bg = background
c.colors.tabs.odd.bg = background
c.colors.tabs.even.fg = foreground
c.colors.tabs.odd.fg = foreground
c.colors.hints.bg = background
c.colors.hints.fg = foreground
c.colors.tabs.selected.even.bg = selected
c.colors.tabs.selected.odd.bg = selected

# change title format
c.tabs.title.format = "{audio}{current_title}"

c.colors.tabs.indicator.stop = xresources["*.color14"]
c.colors.completion.odd.bg = background
c.colors.completion.even.bg = background
c.colors.completion.fg = foreground
c.colors.completion.category.bg = background
c.colors.completion.category.fg = foreground
c.colors.completion.item.selected.bg = background
c.colors.completion.item.selected.fg = foreground

# If not in light theme
if xresources["*.background"] != "#ffffff":
    c.colors.webpage.preferred_color_scheme = 'dark'
    # c.qt.args = ['blink-settings=darkMode=4']
#    c.colors.webpage.darkmode.enabled = True
#    c.hints.border = "1px solid #FFFFFF"

#c.content.unknown_url_scheme_policy = 'allow-all'
c.fonts.default_size = "13pt"
c.content.javascript.enabled = True
c.statusbar.show = 'in-mode'
c.tabs.show = "multiple"
config.bind('xx', 'config-cycle tabs.show multiple never;; config-cycle statusbar.show in-mode never')

c.content.blocking.method = 'adblock'
c.content.blocking.adblock.lists = [
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/annoyances.txt", 
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/badlists.txt",
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/badware.txt",
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/filters-2020.txt",
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/filters-2021.txt",
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/filters-2022.txt",
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/filters.txt",
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/privacy.txt",
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/resource-abuse.txt",
]
c.content.blocking.enabled = True

config.load_autoconfig()
