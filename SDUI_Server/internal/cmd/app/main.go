package main

import (
	"SDUI_Server/internal"
	"SDUI_Server/internal/services/item"
	"SDUI_Server/internal/services/signin"
	"github.com/gofiber/fiber/v2"
	"github.com/gofiber/fiber/v2/log"
)

func main() {
	rsc, err := internal.NewRsc()
	if err != nil {
		log.Fatal(err)
		return
	}
	app := fiber.New()
	sduiRoute := app.Group("/sdui")
	baseRoute := app.Group("/base")
	sduiRoute.Get("", func(ctx *fiber.Ctx) error {
		return ctx.SendString("from SDUI")
	})
	baseRoute.Get("", func(ctx *fiber.Ctx) error {
		return ctx.SendString("from Base")
	})

	// item route
	itemRepo, err := item.NewRepo(rsc.Db)
	if err != nil {
		log.Fatal(err)
	}
	itemUI := item.NewUserInterface()
	itemHandler := item.NewHandler(itemUI, itemRepo)
	itemHandler.Register(sduiRoute, baseRoute)

	// sign in route
	signInRepo, err := signin.NewRepo(rsc.Db)
	if err != nil {
		log.Fatal(err)
	}
	signInUI := signin.NewUserInterface()
	signInHandler := signin.NewHandler(signInUI, signInRepo)
	signInHandler.Register(sduiRoute, baseRoute)

	app.Listen(":4389")
}
