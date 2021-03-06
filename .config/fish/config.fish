set fish_greeting

set fish_color_autosuggestion 666666
set fish_color_command '5FAFFF' '--bold'
set fish_color_param normal

set fish_pager_color_description 878787
set fish_pager_color_prefix '5FAFFF' '--bold'
set fish_pager_color_completion normal
set fish_pager_color_progress white

function man
	command env LESS_TERMCAP_mb=(set_color normal) \
	LESS_TERMCAP_md=(set_color -o $fish_color_command) \
	LESS_TERMCAP_me=(set_color normal) \
	LESS_TERMCAP_se=(set_color normal) \
	LESS_TERMCAP_so=(set_color white) \
	LESS_TERMCAP_ue=(set_color normal) \
	LESS_TERMCAP_us=(set_color -u white) \
	man "$argv"
end

function mkcd
	mkdir "$argv"
	cd "$argv"
end

function fish_prompt
	set_color --bold blue
	echo -n (whoami)
	set_color --bold normal
	echo -n " "(prompt_pwd)" "
	set_color --bold blue
	echo -n "\$ "
	set_color normal
end

function fish_user_key_bindings
	bind \cf 'commandline -f accept-autosuggestion; commandline -f execute'
	bind \cr 'commandline -r "ranger "'
end

