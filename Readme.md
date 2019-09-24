## 简介
本项目为Xhprof性能分析工具的测试demo，将收集的数据上报到MongoDB，通过XHGUI可视化后台查询性能报告。  
  
本项目的服务是通过Docker容器启动，只需要搭建好环境，即可实现一键启动。

## Docker开发环境
[Docker开发环境](Docker.md)

## 启用Xhprof收集功能
方案一：在Nginx配置中植入如下配置： 

```
    location ~ \.php$ {
        fastcgi_pass 127.0.0.1:9200;
        ...
        # 以下为xhprof性能分析插件开启配置
        ## 需要前置引入代码，开启性能分析收集
        fastcgi_param PHP_VALUE "auto_prepend_file=/www/demo/vendor/tinson/xhprof-collector/src/collector.php";
        ## 100表示全量，支持小数 1表示1%  0.1表示0.1%
        fastcgi_param XHGUI_ENABLE_PROB 100;
        ## mongodb的连接配置
        fastcgi_param XHGUI_MONGO_URI "mongodb://127.0.0.1:27017/xhprof?connectTimeoutMS=300";
    }
```

方案二：在代码开头处进行如下配置：  

```
$_SERVER['XHGUI_ENABLE_PROB'] = 100;
$_SERVER['XHGUI_MONGO_URI'] = "mongodb://127.0.0.1:27017/xhprof?connectTimeoutMS=300";
require '/www/demo/vendor/tinson/xhprof-collector/src/collector.php';
```

本Demo项目采用方案一，在assets/nginx/conf/server/demo.conf有完整的配置示例。

## 备注
本Demo中的mongo链接需要根据实际配置。


