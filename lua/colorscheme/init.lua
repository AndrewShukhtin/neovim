local scheduler = require('colorscheme.scheduler')

if scheduler.is_night() then
  vim.cmd("colorscheme carbonfox")
else
  vim.cmd("colorscheme dayfox")
end
