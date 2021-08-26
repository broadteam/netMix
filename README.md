### netMix

首次运行，在改项目根目录下运行：

```
docker-compose up -d && docker-compose logs -f
```

进行构建！

### 管理命令

###### 服务器启动和构建命令

如需管理服务，请在命令后面加上服务器名称，例如：

```
docker-compose up                  # 创建并且启动所有容器
docker-compose up -d               # 创建并且后台运行方式启动所有容器
docker-compose up netmix     # 创建并且启动netmix容器
docker-compose up -d netmix  # 创建并且已后台运行的方式启动netmix容器

docker-compose up -d --build netmix

docker-compose start netmix         # 启动服务
docker-compose stop netmix          # 停止服务
docker-compose restart netmix       # 重启服务
docker-compose build netmix         # 构建或者重新构建服务

docker-compose rm netmix            # 删除并且停止php容器
docker-compose down                # 停止并删除容器，网络，图像和挂载卷
```
