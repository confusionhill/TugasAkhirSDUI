package signin

import (
	"SDUI_Server/internal/model/dto"
	"github.com/gofiber/fiber/v2"
	"net/http"
)

type Handler struct {
	ui   *UserInterface
	repo *Repository
}

func NewHandler(ui *UserInterface, repo *Repository) *Handler {
	return &Handler{
		ui:   ui,
		repo: repo,
	}
}

func (h *Handler) Register(sdui fiber.Router, base fiber.Router) {
	sdui.Post("/signin", h.SignInUserInterfaceHandler)
	base.Post("/signin", h.SignInUserHandler)
}

func (h *Handler) SignInUserHandler(c *fiber.Ctx) error {
	req := dto.SignInRequestDTO{}
	if err := c.BodyParser(&req); err != nil {
		return c.Status(http.StatusBadRequest).SendString("cannot handle request")
	}
	if req.Username != "test123" && req.Password != "test123" {
		return c.Status(404).SendString("user not found")
	}
	authKey, _ := h.repo.SignInUser(c.Context(), "", "")
	return c.JSON(map[string]string{
		"token": authKey,
	})
}

func (h *Handler) SignInUserInterfaceHandler(ctx *fiber.Ctx) error {
	resp, _ := h.repo.SignInUser(ctx.Context(), "", "")
	return ctx.JSON(resp)
}
