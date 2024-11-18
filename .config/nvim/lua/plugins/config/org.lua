return {
  "nvim-orgmode/orgmode",
  event = 'VeryLazy',
  ft = { 'org' },
  config = function()
    local org_files_path = require("custom.utils").get_custom_config("orgfiles", "~/orgfiles/")
    -- Setup orgmode
    require('orgmode').setup({
      org_agenda_files = (org_files_path .. '**/*'),
      org_default_notes_file = (org_files_path .. 'refile.org'),
      org_src_window_setup = 'top 40new',
      org_agenda_min_height = 30,
      org_agenda_filter = '/',
      org_capture_templates = {
        t = { description = 'new ticket', template = 'ticket%?', target = org_files_path .. 'tickets.org', },
        g = { description = 'todo', template = '* TODO %?\n\tDEADLINE: %^{due}t', target = org_files_path .. 'todos.org' },
        m = { description = 'meeting', template = 'meetingnotes%?', target = org_files_path .. 'meetings.org' },
        n = { description = 'note', template = 'note%i', target = org_files_path .. 'notes.org' },
      },
      notifications = {
        enabled = true,
        cron_enabled = true,
        repeater_reminder_time = { 0, 1, 5 },
        deadline_warning_reminder_time = { 0, 1, 5, 15, 30, 60 },
        reminder_time = 10,
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
            if vim.fn.executable('terminal-notifier') == 1 then
              vim.loop.spawn('terminal-notifier', { args = { '-title', title, '-subtitle', subtitle, '-message', date } })
            end
          end
        end
      },
    })
  end,
}