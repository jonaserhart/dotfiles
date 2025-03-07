set open_browser open

if set -q OPEN_BROWSER_CMD
  set open_browser $OPEN_BROWSER_CMD
end

## command
function jira --description 'open a jira issue'
  if not set -q JIRA_URL 
    echo For 'jira' command availability, set the 'JIRA_URL' variable
    return 1
  end
  if test (count $argv) != 1
    echo Please provide a ticket
    return 1
  end
  set ticket = $argv[1]
  $open_browser $JIRA_URL$ticket
end

## completion
if type -q task
  complete -c jira -a '(task _unique jira)'
end

