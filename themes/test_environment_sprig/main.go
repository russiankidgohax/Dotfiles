package main

import (
	"fmt"
	"os"
	"text/template"

	"github.com/Masterminds/sprig/v3"
)

func main() {
	// Define your template with Sprig functions
	tmpl := `{{ if .VIRTUAL_ENV }}{{ osBase .VIRTUAL_ENV }}{{ end }}`

	// Create a new template, add the Sprig functions, and parse the text
	t := template.Must(template.New("test").Funcs(sprig.TxtFuncMap()).Parse(tmpl))

	// Define your data (replace this with your actual data)
	data := map[string]string{
		"CONDA_DEFAULT_ENV": os.Getenv("CONDA_DEFAULT_ENV"),
		"VIRTUAL_ENV":       os.Getenv("VIRTUAL_ENV"),
	}

	// Execute the template and print the output
	err := t.Execute(os.Stdout, data)
	if err != nil {
		fmt.Println("Error executing template:", err)
	}
}
