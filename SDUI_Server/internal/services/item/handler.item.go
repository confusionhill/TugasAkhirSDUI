package item

import (
	"fmt"
	"github.com/gofiber/fiber/v2"
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
	sdui.Get("/item", h.GetListOfItemInterfaceHandler)
	sdui.Get("/item/:id", h.GetItemDetailInterfaceHandler)
	base.Get("/item", h.GetListOfItemsHandler)
	base.Get("/item/:id", h.GetItemDetailHandler)
}

func (h *Handler) GetListOfItemsHandler(c *fiber.Ctx) error {
	//_, ok := c.GetReqHeaders()["bearer"]
	//if !ok {
	//
	//}
	return c.SendString("items from base")
}

func (h *Handler) GetItemDetailHandler(c *fiber.Ctx) error {
	id, err := c.ParamsInt("id")
	if err != nil {
		return err
	}
	return c.SendString(fmt.Sprintf("item id = %d from base", id))
}

func (h *Handler) GetListOfItemInterfaceHandler(ctx *fiber.Ctx) error {
	return ctx.SendString("items from sdui")
}

func (h *Handler) GetItemDetailInterfaceHandler(ctx *fiber.Ctx) error {
	id, err := ctx.ParamsInt("id")
	if err != nil {
		return err
	}
	return ctx.SendString(fmt.Sprintf("item id = %d from sdui", id))
}
