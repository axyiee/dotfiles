// ==UserScript==
// @name          Dark Reader (Unofficial)
// @icon          https://darkreader.org/images/darkreader-icon-256x256.png
// @namespace     DarkReader
// @description	  Inverts the brightness of pages to reduce eye strain
// @version       4.7.15
// @author        https://github.com/darkreader/darkreader#contributors
// @homepageURL   https://darkreader.org/ | https://github.com/darkreader/darkreader
// @run-at        document-end
// @grant         none
// @include       http*
// @require       https://cdn.jsdelivr.net/npm/darkreader/darkreader.min.js
// @noframes
// ==/UserScript==

const blocked = [
    /http(s)?:\/\/(localhost|127.0.0.1)/,
    /http(s)?:\/\/discord.com\/(app|channels)/,
    /http(s)?:\/\/open.spotify.com/,
    /http(s)?:\/\/www.netflix.com/,
    /http(s)?:\/\/www.figma.com/,
    /http(s)?:\/\/(.*).steampowered.com/,
    /http(s)?:\/\/steamcommunity.com/,
    /http(s)?:\/\/(.*).oracle.com/,
    /http(s)?:\/\/www.fiverr.com/,
    /http(s)?:\/\/www.upwork.com/,
    /http(s)?:\/\/(.*)minecraft.net/,
    /http(s)?:\/\/www.google.com(.br)?/,
    /http(s)?:\/\/coolors.co/,
    /http(s)?:\/\/wallhaven.cc/,
    /http(s)?:\/\/imagecolorpicker.com/,
    /http(s)?:\/\/www.reddit.com/,
];

for (const url of blocked) {{
    if (location.href.match(url)) {{
        return;
    }}
}}

DarkReader.enable({{
    brightness: 100,
    contrast: 100,
    sepia: 0,
    darkSchemeBackgroundColor: "{background}",
    darkSchemeTextColor: "{foreground}",
}});
