if status is-interactive
  function fish_greeting
    if type -q fastfetch
      fastfetch --config ~/.config/fastfetch/greeting.jsonc
      if test $status -ne 0
        fastfetch
      end
    else if type -q figlet
      figlet hello (whoami)
    else
      echo "Bem vindo "(set_color magenta)(whoami)(set_color normal)", ao seu novo setup"
      echo "instale o "(set_color cyan)"fastfetch "(set_color normal)"ou o "(set_color green)"figlet "(set_color normal)"para começar"
    end
  end


  function fish_title
    set -l current_dir (basename (pwd))
    set -l parent_dir (basename (dirname (pwd)))

    echo $parent_dir/$current_dir
  end
end