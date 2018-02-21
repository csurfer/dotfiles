# Exports
export TSDEV=1
export GIT_ROOT=~/thoughtspot

# To get karma working on ubuntu
export CHROME_BIN=/usr/bin/google-chrome
#export DISPLAY=:1

# To get IBUS warning removed from Webstorm
export IBUS_ENABLE_SYNC_MODE=1

# Classpath
export CLASSPATH=$GIT_ROOT/callosum/common/target/callosum-common-1.0-SNAPSHOT.jar
export CLASSPATH=$CLASSPATH:$GIT_ROOT/callosum/metadata/target/callosum-metadata-1.0-SNAPSHOT.jar
export CLASSPATH=$CLASSPATH:$GIT_ROOT/callosum/data/target/callosum-data-1.0-SNAPSHOT.jar

# Java paths
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_144.jdk/Contents/Home
export MAVEN_HOME=/usr/local/scaligent/toolchain/apache-maven/apache-maven-3.0.4
export MAVEN_OPTS="-Xms1024m -Xmx4096m -XX:PermSize=1024m"

# Path
export PATH=$GIT_ROOT:$CLASSPATH:$JAVA_HOME/bin:$MAVEN_HOME/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/usr/local/lib/:$HOME/Library/:/usr/local/opt/protobuf@2.5/bin

# nvm setup
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# Aliases
alias tql='~/thoughtspot/build-opt/etl/sqlparser/sql_cli --falcon_manager_address "zoo_server {host: \"localhost\" port: 2181} cluster_name: \"local\" service_name:\"falcon_manager\" task_name: \"falcon_manager\" port_name:\"rpc\"" --falcon_worker_address "zoo_server {host: \"localhost\" port: 2181} cluster_name: \"local\" service_name:\"falcon\" task_name: \"worker\" port_name:\"rpc\""'

# Directory paths
alias tlc='cd /usr/local/scaligent/toolchain'
alias ts='cd $GIT_ROOT'

# Force tmux to use 256 colours.
alias tmux="tmux -2"
alias tma="tmux -2 attach-session -t"

# Git aliases.
alias gb='git branch --list $@'
alias gl='git log --pretty=format:"%Cred%h%Creset | %Cgreen%<(25)%an%Creset | %s"'
alias gs='git status'
alias gcm='git checkout master'
alias gpr='git pull --rebase'

# Faster Work additions
function longestReboot () {
  pushd
  cd ~/thoughtspot
  scons -c
  mvn clean
  sudo -v
  ./testing/cluster_tool.sh --build start --datadir datasets/ssbm/tpch.5K --clean
  popd
}

function rebootCluster () {
  pushd
  cd ~/thoughtspot
  sudo -v
  ./testing/cluster_tool.sh --build start --datadir datasets/ssbm/tpch.5K --clean
  popd
}

function pushCluster () {
  pushd
  cd ~/thoughtspot
  sudo -v
  ./testing/cluster_tool.sh start --datadir datasets/ssbm/tpch.5K --clean
  popd
}

function pushCallosum () {
  pushd
  cd ~/thoughtspot
  ./build-out/orion/client/tscli.par --testdev service push tomcat production/orion/tomcat/tomcat_dev.config
  popd
}

function rebootCallosum () {
  pushd
  cd ~/thoughtspot
  mvn package -DskipTests=true --offline -T 1C
  popd
}

function pushBlink () {
  pushd
  cd ~/thoughtspot
  sudo -v
  ./build-opt/orion/client/tscli.par --testdev service push nginx production/orion/nginx/nanny_dev_local.config
  popd
}

function rebootBlink () {
  pushd
  cd ~/thoughtspot/blink
  grunt package
  pushBlink
  popd
}

function pushNginx () {
  pushBlink
}

function rebootNginx () {
  pushd
  cd ~/thoughtspot
  scons mode=opt -j12 net/nginx
  pushNginx
  popd
}

function restartService () {
  pushd
  cd ~/thoughtspot
  ./build-opt/orion/client/tscli.par --adv --zoo localhost --cluster local service restart $1
  popd
}

function checkStyle () {
  local _styleDir="third-party/checkstyle/checkstyle-6.17";
  local _styleJar="$_styleDir/checkstyle-6.17-all.jar";
  local _cp="$_styleJar:${CLASSPATH}";
  local _main="com.puppycrawl.tools.checkstyle.Main";
  local _cfg="$_styleDir/checkstyle-config.xml";
  pushd
  cd ~/thoughtspot
  local java_files=$(git status -s|grep "\.java"|cut -d " " -f 3|tr '\n' ' ')
  if [ "$java_files" = "" ]
  then
    echo "No files to check !";
  else
    java -Dsamedir=$_styleDir -cp $_cp $_main -c $_cfg $java_files
  fi
  popd
}

function pushWar () {
  scp ~/thoughtspot/callosum/server/target/callosum-server-1.0-SNAPSHOT.war "$1"@"$2":~/thoughtspot/callosum/server/target/
}

function pushWarK8s () {
  scp ~/thoughtspot/callosum/server/target/callosum-server-1.0-SNAPSHOT.war "$1"@"$2":/usr/local/scaligent/release/callosum/server/target/ 
}

function mac2ws () {
  git diff --name-only | xargs -I{} -n 1 scp {} vishwas.sharma@10.77.144.99:~/thoughtspot/{}
}

function ws2mac () {
  ssh devbox 'cd ~/thoughtspot && git diff --name-only' | xargs -I{} -n 1 scp vishwas.sharma@10.77.144.99:~/thoughtspot/{} {}
}

function logit () {
  curl $1 > log.log
}
