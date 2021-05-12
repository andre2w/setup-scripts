function ga
  set -l files (git status -s | string sub -s 4 | fzf --multi)

  if test ! -n "$files"
    return
  end

  git add $files
end

