#!/bin/bash -xe
XD_VERSION=${XD_ZP_VERSION:=1.7.0}
bin/install-interpreter.sh --name crossdata -t org.apache.zeppelin:zeppelin-crossdata_2.11:$XD_VERSION

cp conf/zeppelin-site.xml.template conf/zeppelin-site.xml
sed -i 's|org.apache.zeppelin.spark.SparkInterpreter|org.apache.zeppelin.crossdata.CrossdataInterpreter,org.apache.zeppelin.spark.SparkInterpreter|' conf/zeppelin-site.xml

CMD ["bin/zeppelin.sh", "start"]
