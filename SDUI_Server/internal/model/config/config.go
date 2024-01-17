package config

import (
	"encoding/json"
	"io"
	"os"
)

type Config struct {
	App      string `json:"app"`
	Port     string `json:"port"`
	Database string `json:"database"`
}

func New() (*Config, error) {
	filePath := "./files/secrets.config.json"
	var config Config

	// Open the JSON file
	file, err := os.Open(filePath)
	if err != nil {
		return nil, err
	}
	defer file.Close()

	// Read the file contents
	fileData, err := io.ReadAll(file)
	if err != nil {
		return nil, err
	}

	// Parse the JSON data into the Config struct
	err = json.Unmarshal(fileData, &config)
	return &config, err
}
