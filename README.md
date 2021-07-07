## 主要功能
- 演示使用env 帶變數
  - .env
  - env_file

### env 用途
- .env
  - 傳參數到docker build
- env_file
  - container 環境變數使用

### 補充 docker build 傳參數
- 傳參數
```
docker build --build-arg BASE_IMAGE=ubuntu:18.04 --build-arg PHP_VERSION=8.0 -t php:apache8.0 .
```

### 查看設定檔
```
docker-compose config
```
### 設定環境變數
```
export ENV=beta
```
### 永久套用
- 修改 `/etc/environment`
