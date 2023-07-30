local current_dir='%{$fg_bold[red]%}[%{$reset_color%}%~% %{$fg_bold[red]%}]%{$reset_color%}'
local git_branch='$()%{$reset_color%}'


PROMPT="
%(?,%{$fg[blue]%}┌──╼%{$fg_bold[blue]%}(%{$fg_bold[red]%}%n%{$fg_bold[red]%}㉿%{$fg_bold[red]%}Debian%{$fg_bold[blue]%})%{$fg_bold[white]%}-%{$fg_bold[blue]%}[%{$fg_bold[green]%}%(5~|%-1~/…/%2~|%4~)%{$fg_bold[blue]%}]%{$reset_color%} ${git_branch}
%{$fg[blue]%}└─╼%{$fg_bold[white]%} ❯%{$fg_bold[blue]%}❯%{$fg_bold[cyan]%}❯%{$reset_color%} ,
%{$fg[blue]%}┌─╼%{$fg_bold[red]%}[%{$fg_bold[green]%}%(5~|%-1~/…/%2~|%4~)%{$fg_bold[red]%}]%{$reset_color%}
%{$fg[blue]%}└╼%{$fg_bold[white]%} ❯%{$fg_bold[blue]%}❯%{$fg_bold[cyan]%}❯%{$reset_color%} "

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="] %{$reset_color%}"