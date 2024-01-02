package item

import (
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

func (r *Repository) AddItem() error {
	return nil
}

func (r *Repository) GetItemById(ctx context.Context, id int64) {

}

func (r *Repository) GetItems(ctx context.Context, page uint64, limit uint64) {
	
}
