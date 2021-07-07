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


### 注意事項
- CI server 需要以下檔案目錄
  - build.yml
  - .env (記錄版本號)
  - html (主要程式碼)

- 遠端主機只需要以下檔案目錄
  - docker-compose.yml (第一次部署)
  - .env (每次更新)
  - config (有更動設定)
