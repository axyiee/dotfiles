vim.opt.background = 'dark'
		    vim.g.colors_name = 'lushwal'
		    package.loaded['ocean.components.theme-lushwal.scheme'] = nil
		    return require('lush')(require('ocean.components.theme-lushwal.scheme'))
