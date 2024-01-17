package signin

import "SDUI_Server/internal/model/components"

type UserInterface struct {
}

func NewUserInterface() *UserInterface {
	return &UserInterface{}
}

func (ui *UserInterface) UserNotFoundInterface() []components.Component {
	return nil
}
