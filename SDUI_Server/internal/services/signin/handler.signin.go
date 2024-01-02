package signin

import "github.com/gofiber/fiber/v2"

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
	resp, _ := h.repo.SignInUser(c.Context(), "", "")
	return c.JSON(resp)
}

func (h *Handler) SignInUserInterfaceHandler(ctx *fiber.Ctx) error {
	resp, _ := h.repo.SignInUser(ctx.Context(), "", "")
	return ctx.JSON(resp)
}
