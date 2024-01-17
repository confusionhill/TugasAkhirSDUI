package internal

import "github.com/gofiber/fiber/v2"

const AuthKey = "lucukamudek"

func GetAuthStatus(ctx *fiber.Ctx) bool {
	token := ctx.GetRespHeader("Authorization")
	return token != AuthKey
}
