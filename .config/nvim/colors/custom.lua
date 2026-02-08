local colors = {
    red         = "#F92672",
    blue        = "#66D9EF",
    cyan        = "#A1EFE4",

    -- Adjusted for the new #333333 background
    background  = "#333333", -- Main background
    gutter      = "#333333", -- Matches main background
    highlight   = "#3F3F3F", -- Slightly lighter than background for CursorLine
    selection   = "#445069", -- Softer blue-grey for readability

    text        = "#D0B892",
    comment     = "#FFFF55", -- 53D549
    punctuation = "#8CDE94",
    keyword     = "#FFFFFF",
    variable    = "#D0B892",
    function_   = "#D0B892",
    special     = "#FD971F",
    string      = "#3AD0B5",
    constant    = "#87FFDE",
    macro       = "#8CDE94",
    number      = "#87FFDE",
    white       = "#FFFFFF",
    error       = "#FF0000",
    warning     = "#FFAA00",
    line_fg     = "#666666", -- Darkened slightly to stay subtle
    lualine_fg  = "#333333", -- Matches new background
    lualine_bg  = "#D3B58E",
}

vim.cmd("highlight clear")
vim.o.background = "dark"
vim.g.colors_name = "custom"

-- UI Components
vim.api.nvim_set_hl(0, "Normal", { fg = colors.text, bg = colors.background })
vim.api.nvim_set_hl(0, "Cursor", { bg = colors.white })
vim.api.nvim_set_hl(0, "Visual", { bg = colors.selection })
vim.api.nvim_set_hl(0, "LineNr", { fg = colors.line_fg, bg = colors.background })
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = colors.white, bg = colors.background })
vim.api.nvim_set_hl(0, "CursorLine", { bg = colors.highlight })
vim.api.nvim_set_hl(0, "ColorColumn", { bg = colors.highlight })
vim.api.nvim_set_hl(0, "VertSplit", { fg = colors.line_fg })
vim.api.nvim_set_hl(0, "MatchParen", { bg = colors.selection, bold = true })

-- Syntax Highlighting
vim.api.nvim_set_hl(0, "Comment", { fg = colors.comment })
vim.api.nvim_set_hl(0, "String", { fg = colors.string })
vim.api.nvim_set_hl(0, "Number", { fg = colors.number })
vim.api.nvim_set_hl(0, "Boolean", { fg = colors.constant })
vim.api.nvim_set_hl(0, "Constant", { fg = colors.constant })
vim.api.nvim_set_hl(0, "Identifier", { fg = colors.variable })
vim.api.nvim_set_hl(0, "Function", { fg = colors.function_ })
vim.api.nvim_set_hl(0, "Statement", { fg = colors.keyword })
vim.api.nvim_set_hl(0, "Keyword", { fg = colors.keyword })
vim.api.nvim_set_hl(0, "Type", { fg = colors.punctuation })
vim.api.nvim_set_hl(0, "PreProc", { fg = colors.macro })
vim.api.nvim_set_hl(0, "Special", { fg = colors.special })
vim.api.nvim_set_hl(0, "WarningMsg", { fg = colors.warning })
vim.api.nvim_set_hl(0, "Error", { fg = colors.error })

-- Diagnostics
vim.api.nvim_set_hl(0, "DiagnosticError", { fg = colors.red })
vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = colors.warning })
vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = colors.blue })
vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = colors.cyan })

-- Status Line
vim.api.nvim_set_hl(0, "StatusLine", { fg = colors.lualine_fg, bg = colors.lualine_bg })
vim.api.nvim_set_hl(0, "StatusLineNC", { fg = colors.line_fg, bg = colors.gutter })

-- TreeSitter Links
vim.api.nvim_set_hl(0, "@comment", { link = "Comment" })
vim.api.nvim_set_hl(0, "@string", { link = "String" })
vim.api.nvim_set_hl(0, "@number", { link = "Number" })
vim.api.nvim_set_hl(0, "@boolean", { link = "Boolean" })
vim.api.nvim_set_hl(0, "@constant", { link = "Constant" })
vim.api.nvim_set_hl(0, "@function", { link = "Function" })
vim.api.nvim_set_hl(0, "@function.builtin", { link = "Function" })
vim.api.nvim_set_hl(0, "@variable", { link = "Identifier" })
vim.api.nvim_set_hl(0, "@type", { link = "Type" })
vim.api.nvim_set_hl(0, "@keyword", { link = "Keyword" })
vim.api.nvim_set_hl(0, "@keyword.function", { link = "Keyword" })
vim.api.nvim_set_hl(0, "@field", { link = "Identifier" })
vim.api.nvim_set_hl(0, "@property", { link = "Identifier" })
vim.api.nvim_set_hl(0, "@parameter", { link = "Identifier" })

return colors
