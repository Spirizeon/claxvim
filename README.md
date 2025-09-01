![image](https://github.com/Spirizeon/clax.nvim/assets/123345456/7f27f8e4-0152-483a-a4eb-51289ba05a6d)


<div align="center">

# ClaxVim
[![OpenSSF Scorecard](https://api.scorecard.dev/projects/github.com/spirizeon/claxvim/badge)](https://scorecard.dev/viewer/?uri=github.com/spirizeon/claxvim)

Distributable neovim config written in Lua, Lazy.nvim and Shell.Built from scratch, has all the features of a modern IDE

> This project is dedicated to my friend "Clax", in a stupid attempt to make him install Arch Linux (Lol)

</div>

## Installation:

Simply run this install script
```

cd clax.nvim
chmod +x install
./install
```
![image](https://github.com/user-attachments/assets/01bb575c-378e-4d9f-92a9-74396d2e04bb)


### Keybinds
Here's a table of keybinds from your Lua file for the Neovim config:

| Keybind | Functionality |
| --- | --- |
| `<leader>ot` | Open a vertical split terminal |
| `<leader>pv` | Netrw command |
| `<leader>nt` | Neotree command |
| `<leader>md` | Toggle Markdown Preview (only works on .md files) |
| `<leader>ff` | Find files using telescope |
| `<leader>lg` | Live grep using telescope |
| `<leader>fb` | List buffers using telescope |
| `<leader>of` | List old files using telescope |
| `<leader>nf` | New file |
| `<A-,>` | Go to previous buffer |
| `<A-.>` | Go to next buffer |
| `<A-<>`, `<A->>` | Move to previous/next buffer |
| `<A-1>`, `<A-2>`, `<A-3>`, `<A-4>`, `<A-5>`, `<A-6>`, `<A-7>`, `<A-8>`, `<A-9>`, `<A-0>` | Go to buffer in position 1 through 9 or last |
| `<A-p>` | Pin/unpin buffer |
| `<A-c>` | Close buffer |
| `<C-p>` | Magic buffer-picking mode |
| `<Space>bb`, `<Space>bd`, `<Space>bl`, `<Space>bw` | Sort buffers by buffer number, directory, language, or window number |
| `<C-k>` | Select previous suggestion |
| `<C-j>` | Select next suggestion |
| `<C-b>` | Scroll docs up |
| `<C-f>` | Scroll docs down |
| `<C-Space>` | Show completion suggestions |
| `<C-e>` | Close completion window |
| `<CR>` | Confirm selection (without selecting) |

This table is based on the keybinds defined by default.
Explore the `init.lua` file to customize keybindings, plugins, and other settings to suit your workflow. The Packer.nvim integration provides a clean and organized way to manage your plugins.

## Uninstall
Simply run this command
```
rm -rf ~/.config/nvim ~/.local/share/nvim
```
## Contribute:

We welcome contributions! Whether it's bug fixes, new features, or optimizations, feel free to open issues and pull requests.

