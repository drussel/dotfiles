
#!/bin/zshrc -fv

	case $TERM in
		xterm*)
			precmd () {print -Pn "\e]0;%m: %~\a"}
			;;
	esac

	setopt correct
	setopt correctall


	GREEN=`tput setaf 2 2`
	BLUE=`tput setaf 4 2`
	YELLOW=`tput setaf 3 2`
	LIGHTBLUE=`tput setaf 6 2`
	GRAY=`tput setaf 7 2`
	PURPLE=`tput setaf 5 2`
	RED=`tput setaf 1 2`
	BOLD=`tput bold 2`
	NORMAL=`tput sgr0 2`
#%B %b
	export PROMPT="%{${LIGHTBLUE}%}%n@%m%{${NORMAL}%}:%{${RED}%}%c%{${NORMAL}%}> "
	cd .

        export EDITOR=emacs

	compctl -l '' nohup exec man
	compctl -g"*.tex(:r) *(-/)" tex latex latex2e bibtex
	compctl -g"*.fig *(-/)" xfig fig2dev
	compctl -g"*.dvi *(-/)" xdvi dvips
	compctl -g"*.dvi.gz *(-/)" zxdvi
	compctl -g"*.(eps|ps) *(-/)" gs ghostview ghostscript
	compctl -u finger mail talk ytalk otalk xtalk
# Hack to not have "CVS" in the completion list of "cd" :)
# compctl -g"(CVS?|CV([^S]*|)|C([^V]*|)|[^C]*)(-/)" + -g".*(-/)" cd pushd popd
	compctl -g"*(-/)" + -g".*(-/)" cd pushd popd
	compctl -g "*(/)" + -g ".*(/)" rmdir
	compctl -g"*.(eps|ps|pdf)(.gz|.Z|) *(-/)" gv ghostview
	compctl -g"*.(pdf|apdf) *(-/)" acroread
	compctl -g"*.(pdf|apdf) *(-/)" xpdf
	compctl -g"*.(gz|z|Z|tgz) *(-/)" gunzip zcat
	compctl -g"*.bz2 *(-/)" bunzip2
	compctl -g"*.au *(-/)" play
	compctl -g"*(*) *(-/)" strip gprof gdb adb
	compctl -g"RCS/*(:s@RCS/@@:s/,v//)" co rlog rcs rcsdiff
	compctl -g"*.mgp *(-/)" mgp mgp2ps mgpembed

### Complète les pages de man.
	man_var() {
	  man_pages=( ${^manpath}/man*/*(N:t:r) )
	  compctl -k man_pages man
	  reply=( $man_pages )
	}
	compctl -K man_var man



	fix_cgal_src_tree() {
		pushd $1
		cd src/CGALPDB
                rm -rf *.cpp
		foreach i (~/src/CGAL/PDB/src/CGALPDB/*.cpp)
                   ln -s $i
                end

		cd ../CGAL
		foreach i (~/src/CGAL/Kinetic_data_structures/src/CGAL/*.cpp)
			rm -f $i:t
			ln -s $i
		end

                popd
	}
	fetch_cgal() {
		rm -rf /tmp/CGAL.tar.gz
		curl -k -u member1:cg4any1 https://cgal.geometryfactory.com/CGAL/Members/Releases/$1.tar.gz > /tmp/CGAL.tar.gz
		cd ~/src/CGAL
                rm -rf $1
		tar zxf /tmp/CGAL.tar.gz
	}

        fix_cgal_headers() {
            echo "Fixing CGAL headers"
            pushd $1/include/CGAL
	    rm -rf Kinetic Polynomial PDB
	    ln -s ~/src/CGAL/Kinetic_data_structures/include/CGAL/Kinetic
	    ln -s ~/src/CGAL/Kinetic_data_structures/include/CGAL/Polynomial
	    ln -s ~/src/CGAL/PDB/include/CGAL/PDB
	    pushd Tools
	    foreach i (~/src/CGAL/Kinetic_data_structures/include/CGAL/Tools/*.h)
		  rm -f $i:t
		  ln -s $i
	    end
            popd
            popd
        }


	install_cgal_internal() {
# -D_GLIBCXX_DEBUG -D_GLIBCXX_CONCEPT_CHECKS
		rm -rf ~/fs/include/CGAL ~/fs/lib/CGAL ~/fs/share/cgal `find ~/fs/lib/ -name libCGAL\*`
		cd ~/src/CGAL/$1
	        fix_cgal_src_tree ~/src/CGAL/$1
		fix_cgal_headers ~/src/CGAL/$1
                cmake -DCMAKE_INSTALL_PREFIX=$HOME/fs -DWITH_examples=true -DWITH_demos=true
                make
                make install


		fix_cgal_headers ~/fs
                cd ~/src/CGAL/$1
	}

        get_cgal_version() {
            version=`curl -k -u member1:cg4any1 https://cgal.geometryfactory.com/CGAL/Members/Releases/LATEST`
            echo $version:r:r
        }

	install_cgal() {
            ver=`get_cgal_version`
            echo Installing CGAL $ver
	    fetch_cgal $ver
            install_cgal_internal $ver
	}

	swap() {
		mv $1 /tmp/swapfile_zsh
		mv $2 $1
		mv /tmp/swapfile_zsh $2
	}

bindkey -e
bindkey '^D' delete-char
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line
bindkey '^B' backward-char
bindkey '^F' forward-char

source ~/.zshrc.local

function precmd      {
          echo `date +%Y-%m-%d--%H-%M-%S` $HOST $PWD `history -1` >> ~/.full_history
}
precmd=promptFunc