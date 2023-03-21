package main

import (
	"fmt"
	"net/http"
	"os"
	"time"
)

func main() {
	agora := time.Now()
	url := os.Args[1]
	get, err := http.Get(url)
	if err != nil {
		fmt.Println("Ocorreu um erro ao executaro get(url)")
		panic(err)
	}
	decorrido := time.Since(agora).Seconds()
	status := get.StatusCode
	//%d = Inteiro
	//%f = Float
	//%s = String
	fmt.Printf("Status: [%d] tempo de carga: [%f]\n", status, decorrido)
}
