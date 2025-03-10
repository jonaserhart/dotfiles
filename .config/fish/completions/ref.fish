if type -q task
  complete -c ref -x -a '(task _unique ref)'
end

