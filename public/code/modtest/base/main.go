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
