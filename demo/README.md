### 最佳實踐
- docker image build
```
docker-compose -f build.yml build
```

- docker image push
```
docker-compose -f build.yml push
```

- set env
```
# vim /etc/environment
ENV={環境}
# 第一次設定 需執行套用才毀生效
source /etc/environment
```
- start service
```
docker-compose up -d
```

