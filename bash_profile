# export PS1="\w <U+1F354>  "
export PS1="\[\033[01;35m\]\u:\[\033[01;34m\]\w\[\033[00m\]\$ "
export MYSQL_PS1="mysql (\h) [\d]> "
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export SVN_EDITOR='/usr/bin/mate -w'

# java, tomcat
export JAVA_HOME=/Library/Java/JavaVirtualMachines/1.6.0_29-b11-402.jdk/Contents/Home
export CATALINA_HOME=/Library/Tomcat
export JAVA_OPTS="-Xms2048m -Xmx2048m"
export CATALINA_OPTS="-Xrunhprof:cpu=samples,file=/var/tmp/hprof.txt"
export CATA=$CATALINA_HOME
export xbuild=~/Library/Developer/Xcode/DerivedData/

# history
export HISTCONTROL=erasedups
export HISTSIZE=1000
shopt -s histappend
# boost
export BOOST_BUILD_PATH=/Users/pieter/work/code/boost_1_48_0/

#git
alias gitdiff='git difftool -t opendiff -y'

alias ls='ls -G'
export PATH=/Users/pieter/scripts:/usr/local/bin:/usr/bin:/usr/local/mysql/bin:/Library/Tomcat/Home/bin:/Users/pieter/work/valgrind/inst64/bin:$PATH
export CLASSPATH=/usr/local/lib/junit.jar:$CLASSPATH
##
# Your previous /Users/pieter/.bash_profile file was backed up as /Users/pieter/.bash_profile.macports-saved_2010-06-25_at_11:00:47
##


# once 
# pieter:~$ defaults write com.apple.dock no-bouncing -bool TRUE
# pieter:~$ killall Dock
#

#export MAGICK_HOME="/usr/local/ImageMagick-6.7.5"
#export DYLD_LIBRARY_PATH="$MAGICK_HOME/lib/"
#export DYLD_LIBRARY_PATH=/usr/local/mysql/lib:$DYLD_LIBRARY_PATH
