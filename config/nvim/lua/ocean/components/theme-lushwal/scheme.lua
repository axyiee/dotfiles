-- nyoom-engineering/oxocarbon.nvim

local ok, lush = pcall(require, 'lush')
if not ok then
	print('Lush is not available.' .. lush)
	return
end
local xdg_cache = os.getenv('XDG_CACHE_HOME') or (os.getenv('HOME') .. '/.cache')
local ok, file = pcall(vim.fn.readfile, xdg_cache .. "/wal/colors.json")
if not ok then
	print('Failed to read pywal file.', file)
	file = ""
end
local ok, colors = pcall(vim.fn.json_decode, file)
if not ok then
	print('Failed to decode pywal data.' .. wal)
end
local hsl = lush.hsl
return lush(function()
	if not ok then return {} end
	local colors = {
		foreground = hsl(colors.special.foreground),
		background = hsl(colors.special.background),
		cursor = hsl(colors.special.cursor),
		color0 = hsl(colors.colors.color0),
		color1 = hsl(colors.colors.color1),
		color2 = hsl(colors.colors.color2),
		color3 = hsl(colors.colors.color3),
		color4 = hsl(colors.colors.color4),
		color5 = hsl(colors.colors.color5),
		color6 = hsl(colors.colors.color6),
		color7 = hsl(colors.colors.color7),
		color8 = hsl(colors.colors.color8),
		color9 = hsl(colors.colors.color9),
		color10 = hsl(colors.colors.color10),
		color11 = hsl(colors.colors.color11),
		color12 = hsl(colors.colors.color12),
		color13 = hsl(colors.colors.color13),
		color14 = hsl(colors.colors.color14),
		color15 = hsl(colors.colors.color15),
		pink = hsl(colors.colors.color4).rotate(65).mix(hsl(colors.colors.color5), 50), -- Pink
		brown = hsl(colors.colors.color1).mix(hsl(colors.colors.color5), 15), -- Brown
	}
	return {
		-- [->]Editor[<-]
		ColorColumn({ fg = colors.color0, bg = colors.color1 }),
		Cursor({ fg = colors.color0, bg = colors.color3 }),
		CursorLine({ fg = colors.color0, bg = colors.color1 }),
		CursorLineNr({ fg = colors.color4, bg = "None" }),
		QuickFixLine({ fg = colors.color0, bg = colors.color1 }),
		Error({ fg = colors.color4, bg = colors.color11 }),
		LineNr({ fg = colors.color3, bg = colors.color0 }),
		NonText({ fg = colors.color3, bg = "None" }),
		Normal({ fg = colors.foreground, bg = colors.color0 }),
		Pmenu({ fg = colors.foreground, bg = colors.color0 }),
		PmenuSbar({ fg = colors.foreground, bg = colors.color0 }),
		PmenuSel({ fg = colors.foreground, bg = colors.color1 }),
		PmenuThumb({ fg = colors.foreground, bg = colors.color0 }),
		SpecialKey({ fg = colors.color3, bg = "None" }),
		Visual({ fg = colors.color0, bg = colors.color1 }),
		VisualNOS({ fg = colors.color0, bg = colors.color1 }),
		TooLong({ fg = "None", bg = colors.color4 }),
		Debug({ fg = colors.color13, bg = "None" }),
		Macro({ fg = colors.color7, bg = "None" }),
		MatchParen({ fg = "None", bg = colors.color1, gui = "none" }),
		Bold({ fg = "None", bg = "None", gui = "bold" }),
		Italic({ fg = "None", bg = "None", gui = "italic" }),
		Underlined({ fg = "None", bg = "None", gui = "underline" }),

		-- [->]Diagnostics[<-]
		DiagnosticWarn({ fg = colors.color8, bg = "None" }),
		DiagnosticError({ fg = colors.color10, bg = "None" }),
		DiagnosticInfo({ fg = colors.color9, bg = "None" }),
		DiagnosticHint({ fg = colors.color4, bg = "None" }),
		DiagnosticUnderlineWarn({ fg = colors.color8, bg = "None", gui = "undercurl" }),
		DiagnosticUnderlineError({ fg = colors.color10, bg = "None", gui = "undercurl" }),
		DiagnosticUnderlineInfo({ fg = colors.color8, bg = "None", gui = "undercurl" }),
		DiagnosticUnderlineHint({ fg = colors.color8, bg = "None", gui = "undercurl" }),

		-- [->]LSP[<-]
		LspReferenceText({ fg = "None", bg = colors.color3 }),
		LspReferenceread({ fg = "None", bg = colors.color3 }),
		LspReferenceWrite({ fg = "None", bg = colors.color3 }),
		LspSignatureActiveParameter({ fg = colors.color8, bg = "None" }),

		-- [->Gutter[<-]
		Folded({ fg = colors.color2, bg = "None" }),
		FoldColumn({ fg = colors.color1, bg = "None" }),
		SignColumn({ fg = colors.color1, bg = "None" }),

		-- [->]Navigation[<-]
		Directory({ fg = colors.color8, bg = "None" }),

		-- [->]Prompts[<-]
		EndOfBuffer({ fg = colors.color0, bg = "None" }),
		ErrorMsg({ fg = colors.color10, bg = "None" }),
		ModeMsg({ fg = colors.color4, bg = "None" }),
		MoreMsg({ fg = colors.color8, bg = "None" }),
		Question({ fg = colors.color4, bg = "None" }),
		Substitute({ fg = colors.color4, bg = "None" }),
		WarningMsg({ fg = colors.color13, bg = "None" }),
		WildMenu({ fg = colors.color8, bg = colors.color1 }),

		-- [->]Vim Help[<-]
		helpHyperTextJump({ fg = colors.color8, bg = "None" }),
		helpSpecial({ fg = colors.color9, bg = "None" }),
		helpHeadline({ fg = colors.color10, bg = "None" }),
		helpHeader({ fg = colors.color15, bg = "None" }),

		-- [->]Diff[<-]
		DiffAdd({ fg = "#114232", bg = "None", gui = "bold" }),
		DiffChange({ fg = "#399e4d", bg = "None", gui = "bold" }),
		DiffText({ fg = "#2f3f5c", bg = "None", gui = "bold" }),
		DiffDelete({ fg = "#8c3b4d", bg = "None", gui = "bold" }),
		DiffAdded({ DiffAdd }),
		DiffChanged({ DiffChange }),
		DiffRemoved({ DiffDelete }),

		-- [->]Search[<-]
		IncSearch({ fg = colors.color0, bg = colors.color1 }),
		Search({ fg = colors.color0, bg = colors.color1 }),

		-- [->]Tabs[<-]
		-- TabLine({ fg = colors.color4, bg = colors.color1 }),
		-- TabLineFill({ fg = colors.color4, bg = colors.color1 }),
		-- TabLineSel({ fg = colors.color8, bg = colors.color3 }),

		-- [->]Window[<-]
		Title({ fg = colors.color4, bg = "None" }),
		VertSplit({ fg = colors.color1, bg = colors.color0 }),

		-- [->]Syntax[<-]
		Boolean({ fg = colors.color1, abg = "None" }), 
		Character({ fg = colors.color3, bg = "None" }),
		String({ fg = colors.color3, bg = "None" }),
		Float({ fg = colors.color1, bg = "None" }),
		Number({ fg = colors.color1, bg = "None" }),
		Comment({ fg = colors.color3, bg = "None" }),
		Conceal({ fg = "None", bg = "None" }),
		Conditional({ fg = colors.color3, bg = "None" }),
		Constant({ fg = colors.color6, bg = "None" }),
		Decorator({ fg = colors.color12, bg = "None" }),
		Define({ fg = colors.pink, bg = "None" }),
		Delimeter({ fg = colors.brown, bg = "None" }),
		Exception({ fg = colors.color9, bg = "None" }),
		Function({ fg = colors.color6, bg = "None" }),
		Identifier({ fg = colors.color6, bg = "None" }),
		Include({ fg = colors.pink, bg = "None" }),
		Keyword({ fg = colors.color5, bg = "None" }),
		Label({ fg = colors.color6, bg = "None" }),

		Operator({ fg = colors.color5, bg = "None" }),
		PreProc({ fg = colors.color3, bg = "None" }),
		Repeat({ fg = colors.color3, bg = "None" }),
		Special({ fg = colors.foreground, bg = "None" }),
		SpecialChar({ fg = colors.foreground, bg = "None" }),
		SpecialComment({ fg = colors.color8, bg = "None" }),
		Statement({ fg = colors.color3, bg = "None" }),
		StorageClass({ fg = colors.color6, bg = "None" }),
		Structure({ fg = colors.color6, bg = "None" }),
		Tag({ fg = colors.color6, bg = "None" }),
		Todo({ fg = colors.color3, bg = "None" }),
		Type({ fg = colors.color3, bg = "None" }),
		Typedef({ fg = colors.color3, bg = "None" }),

		-- [->]Neovim[<-]
		NvimInternalError({ fg = colors.color0, bg = colors.color8 }),
		NormalFloat({ fg = colors.color5, bg = colors.color0 }),
		FloatBorder({ fg = colors.color0, bg = colors.color0 }),
		NormalNC({ fg = colors.color5, bg = colors.color0 }),
		TermCursor({ fg = colors.color0, bg = colors.color1 }),
		TermCursorNC({ fg = colors.color0, bg = colors.color1 }),

		-- [->]Statusline/Winbar[<-]
		StatusLine({ fg = colors.color4, bg = colors.color0 }),
		StatusLineNC({ fg = colors.color4, bg = colors.color1 }),
		StatusReplace({ fg = colors.color0, bg = colors.color8 }),
		StatusInsert({ fg = colors.color0, bg = colors.pink }),
		StatusVisual({ fg = colors.color0, bg = colors.color14 }),
		StatusTerminal({ fg = colors.color0, bg = colors.color11 }),
		StatusNormal({ fg = colors.color0, bg = colors.color15 }),
		StatusCommand({ fg = colors.color0, bg = colors.color13 }),
		StatusLineDiagnosticWarn({ fg = "#FFA69E", bg = "None", gui = "bold" }),
		StatusLineDiagnosticError({ fg = "#93E1D8", bg = "None", gui = "bold" }),

		-- [->]Telescope[<-]
		TelescopeBorder({ fg = colors.color0, bg = colors.color0 }),
		TelescopePromptBorder({ fg = colors.color2, bg = colors.color2 }),
		TelescopePromptNormal({ fg = colors.color5, bg = colors.color2 }),
		TelescopePromptPrefix({ fg = colors.color8, bg = colors.color2 }),
		TelescopeNormal({ fg = "None", bg = colors.color0 }),
		TelescopePreviewTitle({ fg = colors.color2, bg = colors.color12 }),
		TelescopePromptTitle({ fg = colors.color2, bg = colors.color11 }),
		TelescopeResultsTitle({ fg = colors.color0, bg = colors.color0 }),
		TelescopeSelection({ fg = "None", bg = colors.color2 }),
		TelescopePreviewLine({ fg = "None", bg = colors.color1 }),

		-- [->]Notify[<-]
		NotifyERRORBorder({ fg = colors.color8, bg = "None" }),
		NotifyWARNBorder({ fg = colors.color15, bg = "None" }),
		NotifyINFOBorder({ fg = colors.color5, bg = "None" }),
		NotifyDEBUGBorder({ fg = colors.color13, bg = "None" }),
		NotifyTRACEBorder({ fg = colors.color13, bg = "None" }),
		NotifyERRORIcon({ fg = colors.color8, bg = "None" }),
		NotifyWARNIcon({ fg = colors.color15, bg = "None" }),
		NotifyINFOIcon({ fg = colors.color5, bg = "None" }),
		NotifyDEBUGIcon({ fg = colors.color13, bg = "None" }),
		NotifyTRACEIcon({ fg = colors.color13, bg = "None" }),
		NotifyERRORTitle({ fg = colors.color8, bg = "None" }),
		NotifyWARNTitle({ fg = colors.color15, bg = "None" }),
		NotifyINFOTitle({ fg = colors.color5, bg = "None" }),
		NotifyDEBUGTitle({ fg = colors.color13, bg = "None" }),
		NotifyTRACETitle({ fg = colors.color13, bg = "None" }),

		-- [->]Completion[<-]
		CmpItemAbbr({fg = "#adadad", bg = "None"}),
		CmpItemAbbrMatch({fg = colors.color5, bg = "None", gui = "bold" }),
		CmpItemAbbrMatchFuzzy({fg = colors.color4, bg = "None", gui = "bold"}),
		CmpItemMenu({fg = colors.color1, bg = "None"}),
		CmpItemKindInterface                   { fg = colors.color0, bg="#3ddbd9", }, 
		CmpItemKindColor                       { fg = colors.color0, bg="#3ddbd9", }, 
		CmpItemKindTypeParameter               { fg = colors.color0, bg="#3ddbd9", },
		CmpItemKindText                        { fg = colors.color0, bg="#78a9ff", }, 
		CmpItemKindEnum                        { fg = colors.color0, bg="#78a9ff", }, 
		CmpItemKindKeyword                     { fg = colors.color0, bg="#78a9ff", }, 
		CmpItemKindConstant                    { fg = colors.color0, bg="#ee5396", }, 
		CmpItemKindConstructor                 { fg = colors.color0, bg="#ee5396", },
		CmpItemKindReference                   { fg = colors.color0, bg="#ee5396", },
		CmpItemKindFunction                    { fg = colors.color0, bg="#33b1ff", },
		CmpItemKindStruct                      { fg = colors.color0, bg="#33b1ff", }, 
		CmpItemKindClass                       { fg = colors.color0, bg="#33b1ff", },
		CmpItemKindModule                      { fg = colors.color0, bg="#33b1ff", },
		CmpItemKindOperator                    { fg = colors.color0, bg="#33b1ff", },
		CmpItemKindField                       { fg = colors.color0, bg="#ff7eb6", }, 
		CmpItemKindProperty                    { fg = colors.color0, bg="#ff7eb6", },
		CmpItemKindEvent                       { fg = colors.color0, bg="#ff7eb6", },
		CmpItemKindUnit                        { fg = colors.color0, bg="#42be65", },
		CmpItemKindSnippet                     { fg = colors.color0, bg="#42be65", },
    CmpItemKindCopilot                     { fg = colors.color0, bg="#6CC644", },
		CmpItemKindFolder                      { fg = colors.color0, bg="#42be65", },
		CmpItemKindVariable                    { fg = colors.color0, bg="#be95ff", }, 
		CmpItemKindFile                        { fg = colors.color0, bg="#be95ff", }, 
		CmpItemKindMethod                      { fg = colors.color0, bg="#82cfff", },
		CmpItemKindValue                       { fg = colors.color0, bg="#82cfff", }, 
		CmpItemKindEnumMember                  { fg = colors.color0, bg="#82cfff", }, 
		CmpItemAbbrDefault                     { fg="#d0d0d0", }, 
		CmpItemAbbrDeprecatedDefault           { fg="#525252", }, 
		CmpItemAbbrDeprecated                  { CmpItemAbbrDeprecatedDefault }, 
		CmpItemAbbrMatchDefault                { fg="#d0d0d0", },
		CmpItemAbbrMatchFuzzyDefault           { fg="#d0d0d0", },
		CmpItemKindDefault                     { fg="#d0d0d0", },
		CmpItemKind                            { CmpItemKindDefault }, 
		CmpItemMenuDefault                     { fg="#d0d0d0", },

    -- [->]Indent Blankline[<-]
    IndentBlanklineIndent                 { fg=colors.color1 }
	}
end)
