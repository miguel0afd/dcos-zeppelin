#!/bin/bash -xe
XD_VERSION=${XD_ZP_VERSION:=1.7.0}

echo "Installing Crossdata interpreter"

/zeppelin-0.6.2-bin-all/bin/install-interpreter.sh --name crossdata -t com.stratio.crossdata:zeppelin-crossdata_2.11:$XD_VERSION

echo "Crossdata interpreter installed"

echo "Adding Crossdata interpreter to the Zeppeling configuration"

cp /zeppelin-0.6.2-bin-all/conf/zeppelin-site.xml.template /zeppelin-0.6.2-bin-all/conf/zeppelin-site.xml
sed -i 's|org.apache.zeppelin.spark.SparkInterpreter|org.apache.zeppelin.crossdata.CrossdataInterpreter,org.apache.zeppelin.spark.SparkInterpreter|' /zeppelin-0.6.2-bin-all/conf/zeppelin-site.xml

echo "Crossdata interpreter added to the Zeppeling configuration"

echo "Starting Zeppelin..."

/zeppelin-0.6.2-bin-all/bin/zeppelin.sh start
