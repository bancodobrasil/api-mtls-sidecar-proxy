package main

import (
	"fmt"
	"net/http"

	runtime "github.com/banzaicloud/logrus-runtime-formatter"
	"github.com/gin-gonic/gin"
	"github.com/sirupsen/logrus"
)

func main() {
	logLevel := "info"

	l, err := logrus.ParseLevel(logLevel)
	if err != nil {
		panic("Invalid loglevel")
	}
	formatter := runtime.Formatter{ChildFormatter: &logrus.TextFormatter{
		FullTimestamp: true,
	}}
	formatter.Line = true
	formatter.File = true
	logrus.SetFormatter(&formatter)
	logrus.SetLevel(l)

	logrus.Infof("Starting mTLS Flat API Demo...")

	r := gin.Default()

	r.GET("/", func(c *gin.Context) {
		c.JSON(http.StatusOK, gin.H{"responseMessage": "I'm a GET secured by an mTLS!"})
	})

	r.POST("/", func(c *gin.Context) {
		var json map[string]string
		if err := c.ShouldBindJSON(&json); err != nil {
			c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
			return
		}
		c.JSON(http.StatusOK, gin.H{"responseMessage": fmt.Sprintf("I'm a POST secured by an mTLS!. You said: %s", json["requestMessage"])})
	})

	r.Run()
}
