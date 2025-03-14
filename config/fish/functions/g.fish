function g
  if test (count $argv) -gt 0
    git $argv
  else
    git status
  end
end

complete -c g -w git
