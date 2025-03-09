set open_browser open -u

if set -q OPEN_BROWSER_CMD
  set open_browser $OPEN_BROWSER_CMD
end

## command
function ref --description 'open a reference issue'
  if not set -q TICKETS_URL 
    echo For 'ref' command availability, set the 'TICKETS_URL' variable
    return 1
  end
  if test (count $argv) != 1
    echo Please provide a ticket
    return 1
  end
  set ticket = $argv[1]
  $open_browser $TICKETS_URL$ticket
end


