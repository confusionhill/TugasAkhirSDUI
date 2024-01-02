package item

import "github.com/gofiber/fiber/v2"

type Handler struct {
}

func (h *Handler) GetListOfItemsHandler(c *fiber.Ctx) error {
	_, ok := c.GetReqHeaders()["bearer"]
	if !ok {

	}
	return nil
}

func (h *Handler) GetItemDetailHandler(c *fiber.Ctx) error {
	return nil
}
