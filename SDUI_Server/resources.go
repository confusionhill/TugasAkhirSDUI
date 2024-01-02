package main

import (
	"github.com/jmoiron/sqlx"
	_ "github.com/lib/pq"
)

type MainResources struct {
	db *sqlx.DB
}

func NewRsc() (*MainResources, error) {
	db, err := sqlx.Open("postgres", "postgresql://confusionhill:k6Cg0KrdVnXA@ep-autumn-moon-97540434.ap-southeast-1.aws.neon.tech/sdui_db?sslmode=require")
	if err != nil {
		return nil, err
	}
	return &MainResources{
		db: db,
	}, nil
}
