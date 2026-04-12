-- This will run last in the setup process.
-- This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

vim.cmd([[
  hi Normal guibg=NONE ctermbg=NONE
  hi NormalNC guibg=NONE ctermbg=NONE
  hi EndOfBuffer guibg=NONE ctermbg=NONE
  hi NeoTreeNormal guibg=NONE ctermbg=NONE
  hi NeoTreeNormalNC guibg=NONE ctermbg=NONE
  hi SnacksNormal guibg=NONE ctermbg=NONE
  hi SnacksNormalNC guibg=NONE ctermbg=NONE
]])
