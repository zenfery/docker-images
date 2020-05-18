## 判断当前是否为 k8s 的 Headless Service 方式部署，如果hostname为 -0、-1结尾则执行
host_name=$(hostname)
if [[ "${host_name}" =~ -[0-9]+$ ]]; then
    k8sid=${host_name##*-}
    myid=$(($k8sid + 1))
    echo "$myid" > "${ZOO_DATA_DIR}/myid"
fi
