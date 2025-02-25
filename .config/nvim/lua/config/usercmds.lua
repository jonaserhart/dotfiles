local function orgmode_usercmds()
  local agendaapi = require("orgmode.api.agenda")

  vim.api.nvim_create_user_command('AgendaDay', function()
    agendaapi.agenda({ span = "day", })
  end, {})

  vim.api.nvim_create_user_command('AgendaWeek', function()
    agendaapi.agenda({ span = "week", })
  end, {})

  vim.api.nvim_create_user_command('AgendaYesterday', function()
    local yesterday = os.date("[%Y-%m-%d %a %H:%M]", os.time() - 24 * 60 * 60)
    local now = os.date("[%Y-%m-%d %a %H:%M]", os.time())
    vim.defer_fn(function()
      vim.api.nvim_feedkeys("CLOSED>\"" .. yesterday .. "\"+CLOSED<\"" .. now .. "\"" ..
        vim.api.nvim_replace_termcodes('<CR>', true, true, true), 'n', false)
    end, 10)

    agendaapi.tags()
  end, {})
end

local function create_tmp_file()
  local user_input = vim.fn.input("Enter filetype: ")
  vim.cmd(":enew")
  vim.cmd(":w ~/tmp/temp." .. user_input)
end

local function clear_tmp_files()
  os.execute("rm " .. "~/tmp/*")
end


return {
  setup = function()
    orgmode_usercmds()

    vim.api.nvim_create_user_command("LazyGit", function()
      local w = require("wezterm")
      w.spawn("lazygit", { new_window = true, cwd = vim.fn.getcwd() })
      -- vim.cmd("FloatermNew --height=0.9 --width=0.9 --wintype=float --name=lazygit --autoclose=2 lazygit")
    end, {})

    vim.api.nvim_create_user_command("TempFile", create_tmp_file, {})
    vim.api.nvim_create_user_command("ClearTempFiles", clear_tmp_files, {})

    -- load custom autocmds by environment
    local customcmds = require("config.utils").req_custom_module("usercmds")
    if customcmds ~= nil then
      customcmds.setup()
    end
  end
}
