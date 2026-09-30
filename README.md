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
  "bakageddy/classic.nvim",
  priority = 1000,
  config = true,
}
```

### packer

```lua
use { "bakageddy/classic.nvim" }
```

### vim-plug

```vim
Plug 'bakageddy/classic.nvim'
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

## License

MIT
