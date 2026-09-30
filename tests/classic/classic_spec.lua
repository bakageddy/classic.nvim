require("plenary.reload").reload_module("classic", true)
local classic = require("classic")
local default = classic.config

local function clear_term_colors()
  for item = 0, 15 do
    vim.g["terminal_color_" .. item] = nil
  end
end

describe("classic", function()
  it("works with default values", function()
    classic.setup()
    assert.are.same(classic.config, default)
  end)

  it("supports the tomorrow variant", function()
    classic.setup({ variant = "tomorrow" })
    assert.are.same(classic.config.variant, "tomorrow")
    assert.are.same(classic.palettes.tomorrow.red, "#cc6666")
  end)

  it("should override a highlight color", function()
    classic.setup({
      overrides = {
        Search = { fg = "#ff9900", bg = "#000000" },
        ColorColumn = { bg = "#ff9900" },
      },
    })
    classic.load()

    local search_group_id = vim.api.nvim_get_hl_id_by_name("Search")
    local search_values = {
      background = vim.fn.synIDattr(search_group_id, "bg", "gui"),
      foreground = vim.fn.synIDattr(search_group_id, "fg", "gui"),
    }

    assert.are.same(search_values, { background = "#000000", foreground = "#ff9900" })

    local color_column_group_id = vim.api.nvim_get_hl_id_by_name("ColorColumn")
    local color_column_values = {
      background = vim.fn.synIDattr(color_column_group_id, "bg", "gui"),
    }

    assert.are.same(color_column_values, { background = "#ff9900" })
  end)

  it("should create new highlights if they do not exist", function()
    classic.setup({
      overrides = {
        New = { bg = "#ff9900" },
      },
    })
    classic.load()

    local new_group_id = vim.api.nvim_get_hl_id_by_name("New")
    local new_group_values = {
      background = vim.fn.synIDattr(new_group_id, "bg", "gui"),
    }

    assert.are.same(new_group_values, { background = "#ff9900" })
  end)

  it("should override palette", function()
    classic.setup({
      variant = "classic",
      palette_overrides = {
        green = "#00ff00",
      },
    })
    classic.load()

    local group_id = vim.api.nvim_get_hl_id_by_name("String")
    local values = {
      fg = vim.fn.synIDattr(group_id, "fg", "gui"),
    }
    assert.are.same(values, { fg = "#00ff00" })
  end)

  it("does not set terminal colors when terminal_colors is false", function()
    clear_term_colors()
    classic.setup({ terminal_colors = false, variant = "classic" })
    classic.load()
    assert.is_nil(vim.g.terminal_color_0)
  end)

  it("sets terminal colors when terminal_colors is true", function()
    clear_term_colors()
    classic.setup({ terminal_colors = true, variant = "classic" })
    classic.load()
    assert.are.same(vim.g.terminal_color_0, classic.palettes.classic.bg0)
  end)

  it("multiple calls to setup() are independent", function()
    classic.setup({ variant = "tomorrow", overrides = { CursorLine = { bg = "#FF0000" } } })
    assert.are.same(classic.config.variant, "tomorrow")
    assert.are.same(classic.config.overrides.CursorLine.bg, "#FF0000")

    classic.setup({ variant = "classic" })
    assert.are.same(classic.config.variant, "classic")
    assert.is_nil(classic.config.overrides.CursorLine)

    classic.setup()
    assert.are.same(classic.config.variant, "classic")
  end)
end)
