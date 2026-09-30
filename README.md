# classic.nvim

A modern Neovim colorscheme written in Lua, ported from the [base16](http://chriskempson.com/projects/base16/) palettes:

- [`base16-classic-dark`](https://github.com/chriskempson/base16-vim/blob/master/colors/base16-classic-dark.vim)
- [`base16-tomorrow-night`](https://github.com/chriskempson/base16-vim/blob/master/colors/base16-tomorrow-night.vim) (the dark variant of *Tomorrow*)

This theme uses [ellisonleao/gruvbox.nvim](https://github.com/ellisonleao/gruvbox.nvim) as a structural template, so you get the same convenient `setup()` API and override capabilities.

## Prerequisites

- Neovim 0.8.0+
- `termguicolors` enabled (the plugin forces it on load)

## Installation

### lazy.nvim

```lua
{
  "<your-github-user>/classic.nvim",
  priority = 1000,
  config = true,
}
```

### packer

```lua
use { "<your-github-user>/classic.nvim" }
```

### vim-plug

```vim
Plug '<your-github-user>/classic.nvim'
```

## Usage

```lua
require("classic").setup()
vim.cmd.colorscheme("classic")
```

To use the *Tomorrow Night* palette instead:

```lua
require("classic").setup({ variant = "tomorrow" })
vim.cmd.colorscheme("classic")
```

## Configuration

```lua
require("classic").setup({
  variant = "classic",          -- "classic" | "tomorrow"
  terminal_colors = true,       -- add neovim terminal colors
  undercurl = true,
  underline = true,
  bold = true,
  italic = {
    strings = true,
    emphasis = true,
    comments = true,
    operators = false,
    folds = true,
  },
  strikethrough = true,
  inverse = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  palette_overrides = {},
  overrides = {},
  dim_inactive = false,
  transparent_mode = false,
})
```

### Palette overrides

```lua
require("classic").setup({
  palette_overrides = {
    green = "#00ff00",
  },
})
```

### Highlight overrides

```lua
require("classic").setup({
  overrides = {
    Comment = { fg = "#666666", italic = true },
    ["@keyword"] = { fg = "#ff5555" },
  },
})
```

## Default palettes

### `classic`

| role    | color   |
| ------- | ------- |
| bg0     | #151515 |
| bg1     | #202020 |
| bg2     | #303030 |
| bg3     | #505050 |
| fg4     | #B0B0B0 |
| fg1     | #D0D0D0 |
| fg2     | #E0E0E0 |
| fg0     | #F5F5F5 |
| red     | #AC4142 |
| orange  | #D28445 |
| yellow  | #F4BF75 |
| green   | #90A959 |
| aqua    | #75B5AA |
| blue    | #6A9FB5 |
| purple  | #AA759F |
| brown   | #8F5536 |

### `tomorrow`

| role    | color   |
| ------- | ------- |
| bg0     | #1d1f21 |
| bg1     | #282a2e |
| bg2     | #373b41 |
| bg3     | #969896 |
| fg4     | #b4b7b4 |
| fg1     | #c5c8c6 |
| fg2     | #e0e0e0 |
| fg0     | #ffffff |
| red     | #cc6666 |
| orange  | #de935f |
| yellow  | #f0c674 |
| green   | #b5bd68 |
| aqua    | #8abeb7 |
| blue    | #81a2be |
| purple  | #b294bb |
| brown   | #a3685a |

## License

MIT
