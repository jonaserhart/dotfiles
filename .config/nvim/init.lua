-- 5.1 compatibiliy
table.unpack = table.unpack or unpack

require("config.vim-options")
require("config.lazy")

-- set up custom user commands
require("config.usercmds").setup()
