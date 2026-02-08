local colors = {
    background     = "#292929",
    text           = "#D3B58D",
    comments       = "#FFFF00",
    keywords       = "#FFFFFF",
    type           = "#98FB98",
    strings        = "#BEBEBE",
    variables      = "#BFC9DB",
    functions      = "#FFFFFF",
    constants      = "#BFC9DB",
    macros         = "#E67D74",
    numbers        = "#66D9EF",
    builtin        = "#FFFFFF",
    punctuation    = "#D3B58D",
    white          = "#FFFFFF",
    error          = "#FF0000",
    warning        = "#E4D97D",
    selection      = "#0000FF",
    highlight_line = "#D89B75",
    line_fg        = "#555555",

    -- Monokai accent colors
    yellow         = "#EFFF18",
    orange         = "#FD971F",
    red            = "#F92672",
    magenta        = "#FD5FF0",
    blue           = "#7FEFD1",
    green          = "#A9ECB6",
    cyan           = "#A1EFE4",
}

vim.cmd("highlight clear")
vim.o.background = "dark"
vim.g.colors_name = "jblow"

-- UI Components
vim.api.nvim_set_hl(0, "Normal", { fg = colors.text, bg = colors.background })
vim.api.nvim_set_hl(0, "Cursor", { bg = colors.white })
vim.api.nvim_set_hl(0, "Visual", { bg = colors.selection })
vim.api.nvim_set_hl(0, "LineNr", { fg = colors.line_fg, bg = colors.background })
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = colors.white, bg = colors.background })
vim.api.nvim_set_hl(0, "CursorLine", { bg = colors.highlight_line })
vim.api.nvim_set_hl(0, "ColorColumn", { bg = colors.highlight_line })
vim.api.nvim_set_hl(0, "SignColumn", { fg = colors.white, bg = colors.background })
vim.api.nvim_set_hl(0, "FoldColumn", { fg = colors.white, bg = colors.background })
vim.api.nvim_set_hl(0, "VertSplit", { fg = colors.line_fg })
vim.api.nvim_set_hl(0, "MatchParen", { bg = colors.selection, bold = true })

-- Search
vim.api.nvim_set_hl(0, "Search", { bg = colors.selection })
vim.api.nvim_set_hl(0, "IncSearch", { bg = colors.selection })

-- Syntax Highlighting
vim.api.nvim_set_hl(0, "Comment", { fg = colors.comments })
vim.api.nvim_set_hl(0, "String", { fg = colors.strings })
vim.api.nvim_set_hl(0, "Number", { fg = colors.numbers })
vim.api.nvim_set_hl(0, "Float", { fg = colors.numbers })
vim.api.nvim_set_hl(0, "Boolean", { fg = colors.constants })
vim.api.nvim_set_hl(0, "Constant", { fg = colors.constants })
vim.api.nvim_set_hl(0, "Identifier", { fg = colors.variables })
vim.api.nvim_set_hl(0, "Function", { fg = colors.functions })
vim.api.nvim_set_hl(0, "Statement", { fg = colors.keywords })
vim.api.nvim_set_hl(0, "Keyword", { fg = colors.keywords })
vim.api.nvim_set_hl(0, "Operator", { fg = colors.text })
vim.api.nvim_set_hl(0, "Type", { fg = colors.type })
vim.api.nvim_set_hl(0, "PreProc", { fg = colors.macros })
vim.api.nvim_set_hl(0, "Include", { fg = colors.macros })
vim.api.nvim_set_hl(0, "Define", { fg = colors.macros })
vim.api.nvim_set_hl(0, "Macro", { fg = colors.macros })
vim.api.nvim_set_hl(0, "Special", { fg = colors.builtin })
vim.api.nvim_set_hl(0, "Delimiter", { fg = colors.punctuation })
vim.api.nvim_set_hl(0, "WarningMsg", { fg = colors.warning })
vim.api.nvim_set_hl(0, "Error", { fg = colors.error })
vim.api.nvim_set_hl(0, "ErrorMsg", { fg = colors.error })

-- Whitespace
vim.api.nvim_set_hl(0, "Whitespace", { fg = colors.warning })

-- Diagnostics
vim.api.nvim_set_hl(0, "DiagnosticError", { fg = colors.error })
vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = colors.warning })
vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = colors.blue })
vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = colors.cyan })

-- Status Line (mode-line → StatusLine)
vim.api.nvim_set_hl(0, "StatusLine", { fg = colors.background, bg = colors.text })
vim.api.nvim_set_hl(0, "StatusLineNC", { fg = colors.text, bg = colors.background })

-- Tab Line (tab-bar)
vim.api.nvim_set_hl(0, "TabLine", { fg = colors.text, bg = colors.background })
vim.api.nvim_set_hl(0, "TabLineFill", { bg = colors.background })
vim.api.nvim_set_hl(0, "TabLineSel", { fg = colors.background, bg = colors.text })

-- Pmenu (popup/completion menu)
vim.api.nvim_set_hl(0, "Pmenu", { fg = colors.text, bg = colors.background })
vim.api.nvim_set_hl(0, "PmenuSel", { fg = colors.background, bg = colors.text })

-- Diff
vim.api.nvim_set_hl(0, "DiffAdd", { fg = colors.green })
vim.api.nvim_set_hl(0, "DiffChange", { fg = colors.yellow })
vim.api.nvim_set_hl(0, "DiffDelete", { fg = colors.red })

-- TreeSitter Links
vim.api.nvim_set_hl(0, "@comment", { link = "Comment" })
vim.api.nvim_set_hl(0, "@string", { link = "String" })
vim.api.nvim_set_hl(0, "@number", { link = "Number" })
vim.api.nvim_set_hl(0, "@boolean", { link = "Boolean" })
vim.api.nvim_set_hl(0, "@constant", { link = "Constant" })
vim.api.nvim_set_hl(0, "@constant.builtin", { link = "Constant" })
vim.api.nvim_set_hl(0, "@function", { link = "Function" })
vim.api.nvim_set_hl(0, "@function.builtin", { fg = colors.builtin })
vim.api.nvim_set_hl(0, "@function.call", { link = "Function" })
vim.api.nvim_set_hl(0, "@method", { link = "Function" })
vim.api.nvim_set_hl(0, "@method.call", { link = "Function" })
vim.api.nvim_set_hl(0, "@variable", { fg = colors.text })
vim.api.nvim_set_hl(0, "@variable.builtin", { fg = colors.variables })
vim.api.nvim_set_hl(0, "@parameter", { fg = colors.text })
vim.api.nvim_set_hl(0, "@field", { fg = colors.text })
vim.api.nvim_set_hl(0, "@property", { fg = colors.text })
vim.api.nvim_set_hl(0, "@type", { link = "Type" })
vim.api.nvim_set_hl(0, "@type.builtin", { link = "Type" })
vim.api.nvim_set_hl(0, "@keyword", { link = "Keyword" })
vim.api.nvim_set_hl(0, "@keyword.function", { link = "Keyword" })
vim.api.nvim_set_hl(0, "@keyword.return", { link = "Keyword" })
vim.api.nvim_set_hl(0, "@keyword.operator", { link = "Keyword" })
vim.api.nvim_set_hl(0, "@include", { link = "PreProc" })
vim.api.nvim_set_hl(0, "@punctuation", { fg = colors.punctuation })
vim.api.nvim_set_hl(0, "@punctuation.bracket", { fg = colors.punctuation })
vim.api.nvim_set_hl(0, "@punctuation.delimiter", { fg = colors.punctuation })
vim.api.nvim_set_hl(0, "@operator", { fg = colors.text })
vim.api.nvim_set_hl(0, "@preproc", { link = "PreProc" })
vim.api.nvim_set_hl(0, "@define", { link = "Define" })
vim.api.nvim_set_hl(0, "@macro", { fg = colors.macros })

return colors
