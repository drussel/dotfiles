#!/bin/zshrc -fv

source ~/.zshenv.local

typeset -U path
typeset -U cppflags
typeset -U ldflags
typeset -U cxxflags
typeset -U pythonpath
cppflags=(`echo $CPPFLAGS`)
ldflags=(`echo $LDFLAGS`)
cxxflags=(`echo $CXXFLAGS`)
pythonpath=(`echo $PYTHONPATH| sed 's#:# #g'`)

export CPPFLAGS="`echo $cppflags`"
export LDFLAGS="`echo $ldflags`"
export CXXFLAGS="`echo $cxxflags`"
export PYTHONPATH="`echo $pythonpath| sed 's# #:#g'`"

export LS_COLORS="no=00:fi=00:di=33:ln=36:pi=34:ex=32:or=31:mi=31:*.C=35:*.cpp=35:*.cc=35:*.c=35:*.h=35:*.java=35:*.class=36:*.o=36:*.a=36:*~=34:*.tar=32:*.zip=32:*.gz=32:*.tgz=32:*.Z=32:*.z=32:*.rpm=32"


alias scale_10='convert \!:1 -scale 1000x1000% \!:2'

ssh() { /usr/bin/ssh $*; cd .; }
#alias ssh='ssh -X \!*; cd .'
alias jobs='jobs -l'		# also show process id's
    #    alias cp 'cp -i'
    #    alias mv 'mv -i'
alias .. 'cd ..'
#alias quiet='\!* >& /dev/null &'
#alias orig='cp -p \!:1 \!:1.orig'

#alias cwdcmd 'echo -n "]0;${USER}@${ROOTHOST}:$cwd]1;${HOST}"' #]0;${HOST}:$cwd

setopt nolistbeep
setopt listtypes
setopt automenu
setopt autocd
setopt hashcmds
setopt hist_ignoredups
setopt No_Beep
unsetopt bgnice
setopt correct
setopt correctall


#export CSHRCED=1

#alias shfs='sudo shfsmount -s -vvv --persistent -s root@primal.stanford.edu:/ /mnt/primal -o preserve,rmode=755,cachesize=1000'
alias ls='ls -G'