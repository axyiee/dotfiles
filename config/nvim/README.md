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
        <td>Where</td>
    </tr>
    <tr>
        <td><code>,</code></td>
        <td>Leader</td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td><code>&lt;C-S-i&gt;</code></td>
        <td>LSP: Reformat code</td>
        <td>Normal</td>
        <td>Editor</td>
    </tr>
    <tr>
        <td><code>&lt;C-S-b&gt;</code></td>
        <td>LSP: Find implementations</td>
        <td>Normal</td>
        <td>Editor</td>
    </tr>
    <tr>
        <td><code>&lt;C-b&gt;</code></td>
        <td>LSP: Go to definiton</td>
        <td>Normal</td>
        <td>Editor</td>
    </tr>
    <tr>
        <td><code>&lt;C-S-f&gt;</code></td>
        <td>LSP: Find references</td>
        <td>Normal</td>
        <td>Editor</td>
    </tr>
    <tr>
        <td><code>&lt;F2&gt;</code></td>
        <td>LSP: Rename</td>
        <td>Normal</td>
        <td>*</td>
    </tr>
    <tr>
        <td><code>&lt;leader&gt;D</code></td>
        <td>LSP: Go to type definition</td>
        <td>Normal</td>
        <td>Editor</td>
    </tr>
    <tr>
        <td><code>&lt;C-k&gt;</code></td>
        <td>LSP: Code action</td>
        <td>Normal</td>
        <td>Editor</td>
    </tr>
    <tr>
        <td><code>&lt;space&gt;&lt;space&gt;</code></td>
        <td>LSP: Hover</td>
        <td>Normal</td>
        <td>Editor</td>
    </tr>
    <tr>
        <td><code>&lt;C-s&gt;</code></td>
        <td>Save file</td>
        <td>*</td>
        <td>Editor</td>
    </tr>
    <tr>
        <td><code>&lt;C-x&gt;</code></td>
        <td>Close buffer</td>
        <td>*</td>
        <td>Editor</td>
    </tr>
    <tr>
        <td><code>&lt;S-Tab&gt;</code></td>
        <td>Switch buffer focus</td>
        <td>Normal</td>
        <td>*</td>
    </tr>
    <tr>
        <td><code>&lt;Tab&gt;</code></td>
        <td>Insert indentation space</td>
        <td>Insert</td>
        <td>Editor</td>
    </tr>
    <tr>
        <td><code>&lt;S-Tab&gt;</code></td>
        <td>Completion: Previous suggestion</td>
        <td>Normal</td>
        <td>*</td>
    </tr>
    <tr>
        <td><code>&lt;Tab&gt;</code></td>
        <td>Completion: Next suggestion</td>
        <td>Insert</td>
        <td>Editor</td>
    </tr>
    <tr>
        <td><code>&lt;S-Tab&gt;</code></td>
        <td>Insert unindentation space</td>
        <td>Insert</td>
        <td>Editor</td>
    </tr>
    <tr>
        <td><code>&lt;leader&gt;j</code></td>
        <td>Move line down</td>
        <td>Normal, Visual</td>
        <td>Editor</td>
    </tr>
    <tr>
        <td><code>&lt;space&gt;k</code></td>
        <td>Move line up</td>
        <td>Normal, Visual</td>
        <td>Editor</td>
    </tr>
    <tr>
        <td><code>&lt;leader&gt;c</code></td>
        <td>Toggle comment</td>
        <td>*</td>
        <td>Editor</td>
    </tr>
    <tr>
        <td><code>&lt;leader&gt;cc</code></td>
        <td>Toggle block comment</td>
        <td>*</td>
        <td>Editor</td>
    </tr>
    <tr>
        <td><code>&lt;A-(1-9)&gt;</code></td>
        <td>Switch to buffer at <i>n</i></td>
        <td>Normal</td>
        <td>Editor</td>
    </tr>
    <tr>
        <td><code>&lt;A-0&gt;</code></td>
        <td>Switch to last buffer</td>
        <td>Normal</td>
        <td>Editor</td>
    </tr>
    <tr>
        <td><code>&lt;C-o&gt;</code></td>
        <td>Telescope: open file browser view</td>
        <td>Normal</td>
        <td>*</td>
    </tr>
    <tr>
        <td><code>&ltC-p;&gt;</code></td>
        <td>Telescope: open find files view</td>
        <td>Normal</td>
        <td>*</td>
    </tr>
    <tr>
        <td><code>&lt;C-p&gt;</code></td>
        <td>Telescope: open live grep view</td>
        <td>Normal</td>
        <td>*</td>
    </tr>
    <tr>
        <td><code>&lt;C-S-p&gt;</code></td>
        <td>Telescope: open buffers view</td>
        <td>Normal</td>
        <td>*</td>
    </tr>
    <tr>
        <td><code>&lt;leader&gt;t</code></td>
        <td>nvim-tree: toggle file tree</td>
        <td>Normal</td>
        <td>*</td>
    </tr>
</table>

## language server dependencies 文字

- [`fzf`]
- [`npm`] (optional) - nodejs package manager; allows copilot to work
- [`doas npm i -g typescript`][`npm`] - typescript and javascript language server
- [`doas npm i -g vls`][`npm`] - vue.js language server
- [`doas npm i -g vscode-langservers-extracted`][`npm`] - html, eslint, json, css language servers
- [`doas npm i -g pyright`][`npm`] - python language server
- [`doas npm i -g cssmodules-language-server`][`npm`] - css modules language server
- [`doas npm i -g @fsouza/prettierd`][`npm`] - javascript, css, html and markdown formatting
- [`sumneko/lua-language-server`] - lua language server
- [`rust-analyzer`] - rust language server
- [`stylua`] - lua formatter

You can install everything on Arch Linux using `bin/dots neovim install`, assuming you have `yay` installed.

[`fzy`]: https://github.com/jhawthorn/fzy
[`npm`]: https://nodejs.org
[`rust-analyzer`]: https://rust-analyzer.github.io/manual.html
[`sumneko/lua-language-server`]: https://github.com/sumneko/lua-language-server
[`stylua`]: https://github.com/JohnnyMorganz/StyLua
