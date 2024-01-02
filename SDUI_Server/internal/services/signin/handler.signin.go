package signin

import "github.com/gofiber/fiber/v2"

type Handler struct {
	repo *Repository
}

func NewHandler(repo *Repository) *Handler {
	return &Handler{
		repo: repo,
	}
}

func (h *Handler) SignInUserHandler(c *fiber.Ctx) error {
	resp, _ := h.repo.SignInUser(c.Context(), "", "")
	return c.JSON(resp)
}
