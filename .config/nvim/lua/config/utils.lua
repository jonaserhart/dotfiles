local req_custom_module = function(modulesubpath)
  local environment = os.getenv("NVIMENV") or "private"
  if environment ~= nil then
    local modulefound, module = pcall(require, "custom." .. environment .. "." .. modulesubpath)
    if modulefound then
      return module
    else
      return nil
    end
  else
    vim.notify("Could ont read custom module '" .. modulesubpath .. "' no NVIMENV found.", vim.log.levels.WARN)
    return nil
  end
end

local get_custom_config = function(key, default)
  local environment = os.getenv("NVIMENV")
  if environment ~= nil then
    local configs = req_custom_module("configs")
    if configs == nil then
      return default
    end
    local config = configs[key]
    if config ~= nil then
      return config
    else
      return default
    end
  else
    vim.notify("Could not read custom config key '" .. key .. "' no NVIMENV found.", vim.log.levels.WARN)
    return default
  end
end

return { req_custom_module = req_custom_module, get_custom_config = get_custom_config }
