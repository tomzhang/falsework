#!/bin/sh
echo "!!!! Start shell "

source ./allconfig.cfg

hostlist=${r'$'}{hostjq[*]}
if [ ! -n "$1" ] ;then
	echo ""
else
	echo "特定的host: $1" 
	hostlist=("$1")
fi

for host in ${r'$'}{hostlist}
do

	echo "=====开始启动${r'$'}{warName} 服务器：${r'$'}{host}"
	ssh tomcat@${r'$'}{host} "nohup /usr/java/jdk1.7.0_71/bin/java -Dloader.path=/usr/webser/springboot/common_libs/ -jar /usr/webser/springboot/${r'$'}{prjName}.jar --spring.config.location=/usr/webser/springboot/${r'$'}{prjName}_conf/application.properties > /dev/null 2>&1 &"
	echo "-------启动成功"

done
