package item

import (
	"SDUI_Server/internal/model/components"
	"SDUI_Server/internal/model/entity"
	"github.com/google/uuid"
)

type UserInterface struct {
}

func NewUserInterface() *UserInterface {
	return &UserInterface{}
}

func (ui *UserInterface) CreateItemCardInterface(items []entity.ItemEntity) []components.Component {
	compos := []components.Component{}
	for _, item := range items {
		compos = append(compos, components.Component{
			Type: components.TEXT_TYPE,
			Information: components.TextComponentInfo{
				Uid:     uuid.NewString(),
				Message: item.Title,
				Size:    10,
			},
		})
	}
	return compos
}

func (ui *UserInterface) CreateItemDetailInterface(item entity.ItemEntity) []components.Component {
	return []components.Component{
		{
			Type: components.TEXT_TYPE,
			Information: components.TextComponentInfo{
				Uid:     uuid.NewString(),
				Message: item.Title,
				Size:    10,
			},
		},
		{
			Type: components.NAVIGATION_TYPE,
			Information: components.NavigationComponentInfo{
				Uid:       uuid.NewString(),
				TargetURL: "/item/2",
				Child: components.Component{
					Type: components.TEXT_TYPE,
					Information: components.TextComponentInfo{
						Uid:     uuid.NewString(),
						Message: item.Category,
						Size:    10,
					},
				},
			},
		},
	}
}
