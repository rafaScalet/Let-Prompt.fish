if status is-interactive
  function fish_greeting
    if type -q fastfetch
      fastfetch --config ~/.config/fastfetch/greeting.jsonc
      if test $status -ne 0
        fastfetch
      end
    else
      echo "Welcome "(set_color cyan)(whoami)(set_color normal)", to your new setup of "(set_color yellow)(hostnamectl | grep "Operating System" | cut -d ' ' -f3-)(set_color normal)
      echo "install "(set_color green)"fastfetch "(set_color normal)"and "(set_color magenta)"starship "(set_color normal)"to start"
    end
  end


  function fish_title
    set -l current_dir (basename (pwd))
    set -l parent_dir (basename (dirname (pwd)))

    echo $parent_dir/$current_dir
  end

  if type -q starship
    starship init fish | source
  end
end