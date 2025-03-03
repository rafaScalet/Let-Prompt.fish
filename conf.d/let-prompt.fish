status is-interactive || exit

if not set -q PROMPT; set -g PROMPT starship; end

function fish_greeting
  if type -q fastfetch
    if test -f ~/.config/fastfetch/greeting.jsonc
      fastfetch --config ~/.config/fastfetch/greeting.jsonc 2> /dev/null
    end
  else
    echo "Welcome "(set_color cyan)(whoami)(set_color normal)", to your new setup of "(set_color yellow)(hostnamectl | grep "Operating System" | cut -d ' ' -f3-)(set_color normal)
    echo "install "(set_color green)"fastfetch "(set_color normal)"and "(set_color magenta)"starship "(set_color normal)"to start"
  end
end

function fish_title
  set -l current_dir (basename (pwd))
  set -l parent_dir (basename (dirname (pwd)))

  switch $current_dir
    case (whoami)
      echo 
    case 'Documentos' 'Documents'
      echo 󰈙
    case 'Models' 'Modelos'
      echo 󰛼
    case 'Downloads'
      echo 
    case 'Music' 'Músicas'
      echo 󰝚
    case 'Pictures' 'Imagens'
      echo 
    case 'Projects' 'Developer' 'Dev'
      echo 󰲋
    case 'Games'
      echo 󰮂
    case 'Public' 'Público'
      echo 󰖟
    case 'Vídeos' 'Videos'
      echo 
    case 'Desktop' 'Área de trabalho'
      echo 
    case 'Dotfiles' 'Config' 'Configurations'
      echo 
    case 'Annotations' 'Notes'
      echo 
    case '*'
      echo $parent_dir/$current_dir
  end
end

switch $PROMPT
  case "starship"
    function starship_transient_prompt_func
      starship module character
    end

    starship init fish | source

    enable_transience
  case "ohmyposh"
    if set -q OHMYPOSH_CONFIG_PATH
      oh-my-posh init fish --config $OHMYPOSH_CONFIG_PATH | source
    else
      oh-my-posh init fish | source
    end
  case "*"
    function fish_prompt
      set_color magenta
      printf '%s' $USER
      set_color normal
      printf ' in '

      set_color yellow
      printf '%s' (basename (pwd))
      set_color normal

      # Line 2
      echo
      set_color green
      printf '↪ '
      set_color normal
    end
end
