# tmux panes
alias ipython3='echo $(tmux display -pt ${TMUX_PANE} "#{pane_index}") > $HOME/.tmux-panes/ipython3; ipython3'
alias matlab='echo $(tmux display -pt ${TMUX_PANE} "#{pane_index}") > $HOME/.tmux-panes/matlab; matlab'

alias tawk="awk -F '\t' -v OFS='\t'"
alias mtawk="mawk -F '\t' -v OFS='\t'"
alias les="less -S -N -#2"
alias vimrc="$EDITOR ~/.vimrc"
alias lower="tr '[:upper:]' '[:lower:]'"
alias upper="tr '[:lower:]' '[:upper:]'"

alias neofetch="neofetch; sleep infinity;"
alias crypt="openssl aes-128-cbc -a -A -md md5 -kfile key"
alias noti="yes FINISHED | head | xargs figlet"
alias which="type -a"

alias parallize="xargs -P `nproc` -0 -n1 -I {} bash -c"
alias freeproc="ps -eo pcpu --no-headers | awk -v P=`nproc` '{S+=\$1}END{print P-S/100}'"
alias freemem="free --giga | sed -n 2p | awk '{print \$NF}'"

alias mountbulk="sshfs -oauto_cache,reconnect,workaround=all hwalinga@sftp.tudelft.nl:/staff-bulk/tnw/BN/SB/Shared/ /data1/bulk/hwalinga/shared"
alias unmountbulk="fusermount -u /data1/bulk/hwalinga/shared"
alias autobulk="unmountbulk;mountbulk"
alias forceautomountbulk="pkill sshfs;autobulk"

alias localmountbulkhome="sshfs -oauto_cache,reconnect,workaround=all hwalinga@sftp.tudelft.nl:/student-homes/w/hwalinga /home/hielke/bulkhome"
alias localunmountbulkhome="fusermount -u /home/hielke/bulkhome"
alias localautobulkhome="localunmountbulkhome;localmountbulkhome"
alias localforceautomountbulkhome="pkill sshfs;localautobulkhome"
alias tudmount="localautobulkhome"

export BAT_THEME="GitHub"

function xcl() {
    /usr/bin/column -n -t -s $'\t' $1 | less -S -N -#2
}

vimpipe() {
    # http://javascript-ninja.fr/using-vimpipe-to-have-the-power-of-vim-to-manipulate-stdin/
  vim -u NONE -c "exec \"%norm $1\"" -es '+%print|q!' "${2:-/dev/stdin}"
}

how_in() { where="$1"; shift; IFS=+ curl "https://cht.sh/$where/$*"; }

dgrep() {
    awk -v target=$1 '
    BEGIN{spacer=0; ORS="";}
    /^>/{
    if (spacer) { print "\n"; }
    if ($0 ~ target) { spacer=1; next; }
    spacer=0; next;
    }
    spacer
    END{if (spacer) { print "\n"; } }
    ' $2;
}

revs() {
    [[ -n $1 ]] && { revs <<< $1; return; }
    revseq /dev/stdin /dev/stdout 2>/dev/null | tail -n+2 |
        awk 1 ORS="" && echo
}

translate() { wget -U "Mozilla/5.0" -qO - "http://translate.googleapis.com/translate_a/single?client=gtx&sl=auto&tl=$2&dt=t&q=$(echo $1 | sed "s/[\"'<>]//g")" | sed "s/,,,0]],,.*//g" | awk -F'"' '{print $2, $6}'; }
