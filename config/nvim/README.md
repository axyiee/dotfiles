<div align="center">
    <h1>🌌 fromsyntax/dotfiles/config/nvim</h1>
</div>

my personal neovim dotfiles optimized for a productive web and game development workflow

**🎨 themes.** pywal

## keybinds

<table>
    <tr>
        <td>Combination</td>
        <td>Function</td>
        <td>Modes</td>
        <tr>Where</tr>
    </tr>
    <tr>
        <td><code>,</code></td>
        <td>Leader</td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td><code><C-S-i></code></td>
        <td>LSP: Reformat code</td>
        <td>Normal</td>
        <td>Editor</td>
    </tr>
    <tr>
        <td><code><C-S-b></code></td>
        <td>LSP: Go to definition</td>
        <td>Normal</td>
        <td>Editor</td>
    </tr>
    <tr>
        <td><code><C-S-b></code></td>
        <td>LSP: Go to implementation</td>
        <td>Normal</td>
        <td>Editor</td>
    </tr>
    <tr>
        <td><code><C-S-f></code></td>
        <td>LSP: Find references</td>
        <td>Normal</td>
        <td>Editor</td>
    </tr>
    <tr>
        <td><code><F12></code></td>
        <td>LSP: Rename</td>
        <td>Normal</td>
        <td>*</td>
    </tr>
    <tr>
        <td><code><space>D</code></td>
        <td>LSP: Go to type definition</td>
        <td>Normal</td>
        <td>Editor</td>
    </tr>
    <tr>
        <td><code><space>ca</code></td>
        <td>LSP: Code action</td>
        <td>Normal</td>
        <td>Editor</td>
    </tr>
    <tr>
        <td><code>K</code></td>
        <td>LSP: Hover</td>
        <td>Normal</td>
        <td>Editor</td>
    </tr>
    <tr>
        <td><code><C-s></code></td>
        <td>Save file</td>
        <td>*</td>
        <td>Editor</td>
    </tr>
    <tr>
        <td><code><C-x></code></td>
        <td>Close buffer</td>
        <td>*</td>
        <td>Editor</td>
    </tr>
    <tr>
        <td><code><S-Tab></code></td>
        <td>Switch buffer focus</td>
        <td>Normal</td>
        <td>*</td>
    </tr>
    <tr>
        <td><code><Tab></code></td>
        <td>Insert indentation space</td>
        <td>Insert</td>
        <td>Editor</td>
    </tr>
    <tr>
        <tr><code><S-Tab></code></tr>
        <td>Insert unindentation space</td>
        <td>Insert</td>
        <td>Editor</td>
    </tr>
    <tr>
        <td><code><C-/></code></td>
        <td>Toggle comment</td>
        <td>*</td>
        <td>Editor</td>
    </tr>
    <tr>
        <td><code><A-(0-9)></code></td>
        <td>Switch to buffer at <i>n</i></td>
        <td>Normal</td>
        <td>Editor</td>
    </tr>
    <tr>
        <td><code><A-0></code></td>
        <td>Switch to last buffer</td>
        <td>Normal</td>
        <td>Editor</td>
    </tr>
    <tr>
        <td><code><C-p></code></td>
        <td>Telescope: open file finding view</td>
        <td>Normal</td>
        <td>*</td>
    </tr>
    <tr>
        <td><code><space>fg</code></td>
        <td>Telescope: open live grep view</td>
        <td>Normal</td>
        <td>*</td>
    </tr>
    <tr>
        <td><code><C-S-p></code></td>
        <td>Telescope: open buffers view</td>
        <td>Normal</td>
        <td>*</td>
    </tr>
    <tr>
        <td><code><leader>t</code></td>
        <td>nvim-tree: toggle file tree</td>
        <td>Normal</td>
        <td>*</td>
    </tr>
</table>

## language server dependencies 文字

everything here is optional except by fzy (unless you don't want telescope stuff to work)

- [`fzy`] - faster alternative to fzf
- [`npm`] (optional) - nodejs package manager; allows copilot to work
- [`doas npm i -g typescript`][`npm`] - typescript and javascript language server
- [`doas npm i -g vls`][`npm`] - vue.js language server
- [`doas npm i -g vscode-langservers-extracted`][`npm`] - html, eslint, json, css language servers
- [`doas npm i -g pyright`][`npm`] - python language server
- [`doas npm i -g cssmodules-language-server`][`npm`] - css modules language server
- [`doas npm i -g @fsouza/prettierd eslint_d`][`npm`] - javascript, css, html and markdown formatting and linting
- [`sumneko/lua-language-server`] - lua language server
- [`rust-analyzer`] - rust language server
- [`elixir-ls`] - elixir language server
- [`stylua`] - lua formatter

You can install everything on Arch Linux using `bin/dots neovim install`, assuming you have `yay` installed.

[`fzy`]: https://github.com/jhawthorn/fzy
[`npm`]: https://nodejs.org
[`rust-analyzer`]: https://rust-analyzer.github.io/manual.html
[`sumneko/lua-language-server`]: https://github.com/sumneko/lua-language-server
[`elixir-ls`]: https://github.com/elixir-lsp/elixir-ls
[`stylua`]: https://github.com/JohnnyMorganz/StyLua
