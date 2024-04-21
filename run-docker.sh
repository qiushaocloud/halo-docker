CURR_DIR=$(cd "$(dirname "$0")"; pwd)

if [ ! -f "$CURR_DIR/.env" ];then
  echo "file $CURR_DIR/.env is not exist"
  exit
fi

HALO2_DATA_PATH=`grep HALO2_DATA_PATH $CURR_DIR/.env|grep -v grep|awk -F '=' '{print $2}' | sed 's/ //g' | sed "s/'//g" | sed 's/\"//g'`
if [ ! -f "$HALO2_DATA_PATH/application.yaml" ];then
  echo "file $HALO2_DATA_PATH/application.yaml is not exist"
  exit
fi

docker-compose up -d