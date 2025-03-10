function __fish_ref_dynamic_completions
  if type -q task
    set tasks_and_projects $(task export | jq -r '[.[] | select(has("ref"))] | unique_by(.ref) | .[] | "\(.ref):\(.project)"')

    for line in $tasks_and_projects
      set -l task $(echo $line | cut -d ':' -f 1)
      set -l proj $(echo $line | cut -d ':' -f 2)
      complete -c ref -x -a "$task" -d "$proj"
    end

  end
end

__fish_ref_dynamic_completions

