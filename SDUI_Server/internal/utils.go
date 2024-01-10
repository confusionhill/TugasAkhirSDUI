package internal

import "github.com/gofiber/fiber/v2"

func GetAuthStatus(ctx *fiber.Ctx) bool {
	token := ctx.GetRespHeader("bearer")
	return token != "lucukamudek"
}
