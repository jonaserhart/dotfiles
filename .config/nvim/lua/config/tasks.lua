local M = {}

local function get_visual_selection()
  local _, ls, cs = unpack(vim.fn.getpos("'<"))
  local _, le, ce = unpack(vim.fn.getpos("'>"))
  if ls == 0 or le == 0 then return nil end

  local lines = vim.api.nvim_buf_get_lines(0, ls - 1, le, false)
  if #lines == 0 then return nil end

  lines[#lines] = string.sub(lines[#lines], 1, ce)
  lines[1] = string.sub(lines[1], cs)

  local text = table.concat(lines, " ")
  text = text:gsub("%s+", " "):gsub("^%s+", ""):gsub("%s+$", "")
  return text ~= "" and text or nil
end

local function task_add(title, mods, src)
  local cmd = { "task", "add", title }

  -- UDA: uda.src.
  if src and src ~= "" then
    table.insert(cmd, ("src:%s"):format(src))
  end

  if mods and mods ~= "" then
    for token in string.gmatch(mods, "%S+") do
      table.insert(cmd, token)
    end
  end

  vim.system(cmd, { text = true }, function(res)
    vim.schedule(function()
      if res.code == 0 then
        vim.notify(("Task added: %s"):format(title), vim.log.levels.INFO)
      else
        vim.notify(("Taskwarrior failed (%d): %s"):format(res.code, res.stderr or ""), vim.log.levels.ERROR)
      end
    end)
  end)
end

function M.add_task_from_selection_with_mods(mods)
  local title = get_visual_selection()
  if not title then
    vim.notify("No visual selection found (select text in Visual mode first).", vim.log.levels.WARN)
    return
  end

  local bufname = vim.api.nvim_buf_get_name(0)
  local src_file = (bufname ~= "" and bufname) or ("nvim://buf/" .. vim.api.nvim_get_current_buf())

  local _, ls = unpack(vim.fn.getpos("'<"))
  local line = ls > 0 and ls or vim.api.nvim_win_get_cursor(0)[1]

  local src = ("%s:%d"):format(src_file, line)

  task_add(title, mods, src)
end

return M
