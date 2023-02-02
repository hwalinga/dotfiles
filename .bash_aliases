# PATH="/home/hielke/perl5/bin${PATH:+:${PATH}}"; export PATH;
# PERL5LIB="/home/hielke/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
# PERL_LOCAL_LIB_ROOT="/home/hielke/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
# PERL_MB_OPT="--install_base \"/home/hielke/perl5\""; export PERL_MB_OPT;
# PERL_MM_OPT="INSTALL_BASE=/home/hielke/perl5"; export PERL_MM_OPT;

# eval `perl -I ~/perl5/lib/perl5 -Mlocal::lib`
# export MANPATH=$HOME/perl5/man:$MANPATH


# Weird fix for strange routers.
# alias ssh="ssh -o IPQoS=0"
alias clusterlogin="ssh -t hwalinga@student-linux.tudelft.nl 'ssh sb-ont.tudelft.nl'"
alias xclusterlogin="ssh -t -X hwalinga@student-linux.tudelft.nl 'ssh -X sb-ont.tudelft.nl'"
alias mawk="$HOME/.linuxbrew/bin/mawk"
export LESS="-RXFMiX"
alias rg="rg -N -i"
alias lst="ls -trlh"

alias bulk="cd $BULK"
alias software="cd $SOURCE_SOFTWARE"
alias stud="cd /tudelft.net/staff-umbrella/abeellabstudents/hwalinga/jan"

export SACCT_FORMAT="jobid,jobname%60,state,start,elapsed,timelimit,MaxRSS,CPUTime,totalcpu,alloccpus,nodelist"
alias sacct="sacct --units=G"
export RANDOM_SEED="1234"

export PATH="$HOME/programs/bin:$PATH"

export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.cargo/bin"

export PATH="$PATH:$HOME/node_modules/.bin"

# CUSTOM PATHS

# export PATH="$PATH:$HOME/programs/CRISPRCasFinder/bin"
# export MACSY_HOME="/home/hielke/programs/CRISPRCasFinder/macsyfinder-1.0.5/"
# export PATH="$PATH:/home/hielke/programs/ViennaRNA-2.4.3/src/bin"

# After sourcing Python environment, do not modify PATH
# source ~/.venv/py39/bin/activate
# source /home/hielke/.cache/pypoetry/virtualenvs/demap-kqoNszLJ-py3.9/bin/activate

# export W3MIMGDISPLAY_PATH="/home/hielke/.linuxbrew/Cellar/w3m/0.5.3_6/libexec/w3m/w3mimgdisplay"

export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64/
export JRE_HOME=$JAVA_HOME

# CATALINA (TOMCAT)
# export CATALINA_HOME=/usr/share/tomcat8
# export CATALINA_BASE=/home/hielke/code/genius-web/catalina-home

# export CATALINA_HOME=/home/hielke/code/genius-web/apache-tomcat-8.5.46/

# export CATALINA_PID="$CATALINA_BASE/tomcat.pid"

# I keep important notes here.
cat ~/Important

export PATH="$HOME/.poetry/bin:$PATH"
export PATH="$HOME/code/film-fountain/bin:$PATH"

# ==== FZF

# export DISABLE_FZF_KEY_BINDINGS="true"

export FZF_DEFAULT_COMMAND='fd --type f'



export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

. ~/init/linuxbrew


export HOMEBREW_CURL_PATH="/home/nfs/hwalinga/bin/curl"
# export HOMEBREW_GIT_PATH="/home/nfs/hwalinga/bin/git"
export HOMEBREW_GIT_PATH=/home/nfs/hwalinga/.linuxbrew/bin/git

# export EDITOR='/home/hielke/.linuxbrew/bin/nvim'
export EDITOR='/home/nfs/hwalinga/.linuxbrew/bin/nvim'
alias vim="$EDITOR"
alias vi="$EDITOR"
alias vimrc="$EDITOR ~/.vimrc"

alias pytest="python3 -m pytest"

# tmux panes
alias ipython3='echo $(tmux display -pt ${TMUX_PANE} "#{pane_index}") > $HOME/.tmux-panes/ipython3; ipython3'
alias matlab='echo $(tmux display -pt ${TMUX_PANE} "#{pane_index}") > $HOME/.tmux-panes/matlab; matlab'

alias awk=bioawk
alias tawk="awk -F '\t' -v OFS='\t'"
alias mtawk="mawk -F '\t' -v OFS='\t'"
alias les="less -S -N -#2"
alias lower="tr '[:upper:]' '[:lower:]'"
alias upper="tr '[:lower:]' '[:upper:]'"
alias blockdistr="sed -i 's/# 0.0.0.0/0.0.0.0/' /etc/hosts"

alias neofetch="neofetch; sleep infinity;"
# alias crypt="openssl aes-128-cbc -a -A -md md5 -kfile key"
alias noti="yes FINISHED | head | xargs figlet"
alias which="type -a"
alias rot13="tr 'A-Za-z' 'N-ZA-Mn-za-m'"
alias open="xdg-open"

# Slurm
# export SNAKEMAKE_PROFILE=simple

alias parallize="xargs -P `nproc` -0 -n1 -I {} bash -c"
alias freeproc="ps -eo pcpu --no-headers | awk -v P=`nproc` '{S+=\$1}END{print P-S/100}'"
alias freemem="free --giga | sed -n 2p | awk '{print \$NF}'"

alias rs="./src/manage.py runserver"
alias dm="./src/manage.py "
alias dt="DEMAP_TESTING=1 "

alias mountbulk="sshfs -oauto_cache,reconnect,workaround=all hwalinga@sftp.tudelft.nl:/staff-bulk/tnw/BN/SB/Shared/ /data1/bulk/hwalinga/shared"
alias unmountbulk="fusermount -u /data1/bulk/hwalinga/shared"
alias autobulk="unmountbulk;mountbulk"
alias forceautomountbulk="pkill sshfs;autobulk"

alias localmountbulkhome="sshfs -oauto_cache,reconnect,workaround=all hwalinga@sftp.tudelft.nl:/student-homes/w/hwalinga /home/hielke/bulkhome"
alias localunmountbulkhome="fusermount -u /home/hielke/bulkhome"
alias localautobulkhome="localunmountbulkhome;localmountbulkhome"
alias localforceautomountbulkhome="pkill sshfs;localautobulkhome"
alias tudmount="localautobulkhome"

alias apt-install="apt-get --yes -t stretch-backports install"
alias sudo='sudo '
# alias ssh='xdotool key F10; ssh'

alias please='sudo $(fc -ln -1)'
alias f='TF_CMD=$(TF_ALIAS=f PYTHONIOENCODING=utf-8 TF_SHELL_ALIASES=$(alias) thefuck $(fc -ln -1 | tail -n 1)) && eval $TF_CMD && print -s $TF_CMD'
# eval $(thefuck --alias f)
# alias f='thefuck $(fc -ln -1)'
alias py=python

alias r="/usr/bin/r"

export BAT_THEME="GitHub"
export PATH="$PATH:$HOME/bin"
export PATH="$HOME/programs:$PATH"
export PYTHONBREAKPOINT="pudb.set_trace"

export PATH="$HOME/npm/bin:$PATH"
export NODE_PATH="NODE_PATH:$HOME/home/npm/lib/node_modules"
export GEM_HOME=$HOME/.gem
export PATH="$GEM_HOME/bin:$PATH"

export PATH="/home/hielke/repos/imgur-screenshot:$PATH"

# LESSOPEN="|lesspipe.sh %s"; export LESSOPEN

pdfcat() {
    pdftotext $1 -
}

m() {
    man $1 || help2man $1 | man -l -
}
alias man=m

ee () {
    "$@" &! exit;
}

glout() {
    if [[ -t 1 ]]; then
        # output goes to a terminal
        out=xclip
    else
        # output is redirected
        out=cat
    fi
    tmux capture-pane -p -J -S - | sed 's:\s*$::g' | tac |
        awk '/»/{f++} f; f>1 {exit}' |
        tail +4 |
        tac | tail +2 | perl -pe 'chomp if eof'| $out
}
gout() {
    if [[ -t 1 ]]; then
        # output goes to a terminal
        out=xclip
    else
        # output is redirected
        out=cat
    fi
    tmux capture-pane -p -J -S - > /tmp/command-output
    command=$(grep » /tmp/command-output | sed 's/»//; /^\s*$/d' | fzf | sed 's:/:\\/:g' )
    sed -n '/^»'$command'\s*$/,/^»/p' /tmp/command-output |
        head -n -3 | tail -n +2 | perl -pe 'chomp if eof' | $out
}

xcl() {
    /usr/bin/column -t -s $'\t' $1 | less -S -N -#2
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
