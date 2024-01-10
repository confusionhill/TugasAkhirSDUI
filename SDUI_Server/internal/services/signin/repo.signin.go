package signin

import (
	"SDUI_Server/internal"
	"context"
	"github.com/jmoiron/sqlx"
)

type Repository struct {
	db *sqlx.DB
}

func NewRepo(db *sqlx.DB) (*Repository, error) {
	return &Repository{
		db: db,
	}, nil
}

func (r *Repository) SignInUser(ctx context.Context, username string, password string) (string, error) {
	return internal.AuthKey, nil
}
