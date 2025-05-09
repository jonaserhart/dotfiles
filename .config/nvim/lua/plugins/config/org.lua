return {
  "nvim-orgmode/orgmode",
  event = "VeryLazy",
  dependencies = {
    {
      "akinsho/org-bullets.nvim",
      config = function()
        require("org-bullets").setup()
      end,
    },
  },
  ft = { "org" },
  config = function()
    local config_utils = require("config.utils")
    local org_files_path = config_utils.get_custom_config("orgfiles", "~/orgfiles/")
    local custom_commands = config_utils.get_custom_config("custom_agenda_actions", {})
    local def_capture_templates = {
      t = {
        description = "new ticket",
        template = "ticket%?",
        target = org_files_path .. "tickets.org",
        properties = { empty_lines = 2 },
      },
      g = {
        description = "todo",
        template = "* TODO %?\n\tDEADLINE: %^{due}t",
        target = org_files_path .. "todos.org",
        properties = { empty_lines = 2 },
      },
      n = {
        description = "note",
        template = "note%?",
        datetree = {
          tree_type = "week",
          time_prompt = true
        },
        target = org_files_path .. "notes.org",
        properties = { empty_lines = 2 },
      },
    }

    local custom_capture_templates = config_utils.get_custom_config("custom_org_cap_templates", {})

    local org_cap_templates = config_utils.merge_tables(def_capture_templates, custom_capture_templates)

    -- Setup orgmode
    require("orgmode").setup({
      org_agenda_files = (org_files_path .. "**/*"),
      org_default_notes_file = (org_files_path .. "refile.org"),
      org_src_window_setup = "top 40new",
      org_agenda_min_height = 10,
      win_split_mode = 'horizontal',
      win_border = 'none',
      org_agenda_filter = "/",
      org_capture_templates = org_cap_templates,
      org_agenda_custom_commands = custom_commands,
      org_todo_keywords = {
        "TODO(t)",
        "PROGRESS(p)",
        "BLOCKED(b)",
        "|",
        "DONE(d)",
      },
      org_todo_keyword_faces = {
        PROGRESS = ":foreground #98adec :weight bold",
        BLOCKED = ":foreground #f4cc73  :weight bold",
      },
      notifications = {
        enabled = true,
        cron_enabled = true,
        repeater_reminder_time = { 0, 1, 5 },
        deadline_warning_reminder_time = { 0, 1, 5, 15, 30, 60 },
        reminder_time = { 0, 5, 10 },
        deadline_reminder = true,
        scheduled_reminder = true,
        notifier = function(tasks)
          local result = {}
          for _, task in ipairs(tasks) do
            require('orgmode.utils').concat(result, {
              string.format('# %s (%s)', task.category, task.humanized_duration),
              string.format('%s %s %s', string.rep('*', task.level), task.todo, task.title),
              string.format('%s: <%s>', task.type, task.time:to_string())
            })
          end

          if not vim.tbl_isempty(result) then
            require('orgmode.notifications.notification_popup'):new({ content = result })
          end
        end,
        cron_notifier = function(tasks)
          for _, task in ipairs(tasks) do
            local title = string.format('%s (%s)', task.category, task.humanized_duration)
            local subtitle = string.format('%s %s %s', string.rep('*', task.level), task.todo, task.title)
            local date = string.format('%s: %s', task.type, task.time:to_string())

            -- MacOS
            if vim.fn.executable('terminal-notifier') == 1 then
              vim.fn.system({ 'terminal-notifier', '-title', title, '-subtitle', subtitle, '-message', date })
            end
          end
        end
      },
    })

    vim.keymap.set("n", "<leader>toh", ":Telescope orgmode search_headings<cr>", {})
  end,
}
