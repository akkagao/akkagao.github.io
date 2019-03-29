---
title: Go开发实战 go mod 使用本地包
author: "CrazyWolf"
tags: ["golang", "ECHO", "web"]
date: 2019-03-29
---

**go mod 使用本地包的方法**

<!--more-->

### go mod 初体验

以简单的gin项目为例，在本地任意目录创建main.go,写入下面的内容。

```go
package main

import (
	"net/http"
	"github.com/gin-gonic/gin"
)
func main() {
	engin := gin.Default()
	engin.GET("/", func(c *gin.Context) {
		c.JSON(http.StatusOK, "ok")
	})
	engin.Run(":8080")
}

```

1. 使用 go mod init 命令生成go.mod 配置文件

2. 使用 go mod tidy 下载依赖包( 查看生成的go.mod)

   ```go
   module base
   
   go 1.12
   
   require (
   	github.com/gin-contrib/sse v0.0.0-20190301062529-5545eab6dad3 // indirect
   	github.com/gin-gonic/gin v1.3.0
   	github.com/golang/protobuf v1.3.1 // indirect
   	github.com/json-iterator/go v1.1.6 // indirect
   	github.com/mattn/go-isatty v0.0.7 // indirect
   	github.com/modern-go/concurrent v0.0.0-20180306012644-bacd9c7ef1dd // indirect
   	github.com/modern-go/reflect2 v1.0.1 // indirect
   	github.com/stretchr/testify v1.3.0 // indirect
   	github.com/ugorji/go/codec v0.0.0-20190320090025-2dc34c0b8780 // indirect
   	golang.org/x/net v0.0.0-20190320064053-1272bf9dcd53 // indirect
   	gopkg.in/go-playground/assert.v1 v1.2.1 // indirect
   	gopkg.in/go-playground/validator.v8 v8.18.2 // indirect
   	gopkg.in/yaml.v2 v2.2.2 // indirect
   )
   
   ```

   

3. 执行结果如下所示

```shell
➜  base git:(dev) ✗ go mod init base
go: creating new go.mod: module base
➜  base git:(dev) ✗ go mod tidy
go: finding github.com/gin-contrib/sse latest
go: finding github.com/golang/protobuf/proto latest
go: finding github.com/ugorji/go/codec latest
go: finding golang.org/x/net/context latest
go: finding github.com/stretchr/testify/assert latest
go: finding golang.org/x/net latest
go: finding github.com/modern-go/concurrent latest
➜  base git:(dev) ✗ go run main.go
```



### go mod 使用本地私有包

