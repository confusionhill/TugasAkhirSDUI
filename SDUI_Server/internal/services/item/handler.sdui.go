package item

import (
	"SDUI_Server/internal"
	"SDUI_Server/internal/model/components"
	"SDUI_Server/internal/model/dto"
	"github.com/gofiber/fiber/v2"
)

func (h *Handler) GetListOfItemInterfaceHandler(ctx *fiber.Ctx) error {
	page := ctx.QueryInt("page", 1)
	limit := ctx.QueryInt("limit", 10)
	items, err := h.repo.GetItems(ctx.Context(), uint64(page), uint64(limit))
	if err != nil {
		return ctx.Status(500).JSON(dto.SDUIResponseDTO{
			Title:  "Internal Error",
			Header: make([]components.Component, 0),
			Body:   h.ui.CreateNotFoundInterface(),
		})
	}
	isAuth := internal.GetAuthStatus(ctx)
	header := h.ui.CreateHeader(isAuth)
	body := h.ui.CreateItemCardInterface(items)
	return ctx.JSON(dto.SDUIResponseDTO{
		Title:  "Home",
		Header: header,
		Body:   body,
	})
}

func (h *Handler) GetItemDetailInterfaceHandler(ctx *fiber.Ctx) error {
	id, err := ctx.ParamsInt("id")
	if err != nil {
		return ctx.Status(404).SendString("cannot find item")
	}
	item, err := h.repo.GetItemById(ctx.Context(), int64(id))
	if err != nil {
		return ctx.Status(404).JSON(dto.SDUIResponseDTO{
			Title:  "Not Found",
			Header: make([]components.Component, 0),
			Body:   h.ui.CreateNotFoundInterface(),
		})
	}

	isAuth := internal.GetAuthStatus(ctx)
	header := h.ui.CreateHeader(isAuth)
	body := h.ui.CreateItemDetailInterface(*item)
	return ctx.JSON(dto.SDUIResponseDTO{
		Title:  item.Title,
		Header: header,
		Body:   body,
	})
}
