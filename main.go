package main

import (
	"log"
	"net/http"
)

func main() {
	log.Println("starting server...")
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		w.Write([]byte(`Hello wolrd12321123`))
	})

	http.HandleFunc("/test", func(w http.ResponseWriter, r *http.Request) {
		w.Write([]byte(`Hello world`))
	})
	log.Fatal(http.ListenAndServe(":3000", nil))
}