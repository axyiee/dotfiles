return {
	packer = {
		"goolord/alpha-nvim",
	},
	api = {
		"kyazdani42/nvim-web-devicons",
	},
	data = function()
		return {
			alpha = require("alpha"),
			art = {
				[[                                      ___                             ]],
				[[                                    ,--.'|_                           ]],
				[[                            ,---,   |  | :,'                          ]],
				[[  .--.--.               ,-+-. /  |  :  : ' :              ,--,  ,--,  ]],
				[[ /  /    '       .--,  ,--.'|'   |.;__,'  /    ,--.--.    |'. \/ .`|  ]],
				[[|  :  /`./     /_ ./| |   |  ,"' ||  |   |    /       \   '  \/  / ;  ]],
				[[|  :  ;_    , ' , ' : |   | /  | |:__,'| :   .--.  .-. |   \  \.' /   ]],
				[[ \  \    `./___/ \: | |   | |  | |  '  : |__  \__\/: . .    \  ;  ;   ]],
				[[  `----.   \.  \  ' | |   | |  |/   |  | '.'| ," .--.; |   / \  \  \  ]],
				[[ /  /`--'  / \  ;   : |   | |--'    ;  :    ;/  /  ,.  | ./__;   ;  \ ]],
				[['--'.     /   \  \  ; |   |/        |  ,   /;  :   .'   \|   :/\  \ ; ]],
				[[  `--'---'     :  \  \'---'          ---`-' |  ,     .-./`---'  `--`  ]],
				[[                \  ' ;                       `--`---'                 ]],
				[[                 `--`                                                 ]],
			},
		}
	end,
	exec = function(root)
		local theme = require("alpha.themes.theta")
		theme.header.val = root.art
		root.alpha.setup(theme.config)
	end,
}
