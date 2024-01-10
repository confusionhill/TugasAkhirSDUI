package components

const (
	STACK_TYPE      = "stack"
	TEXT_TYPE       = "text"
	SPACER_TYPE     = "spacer"
	BUTTON_TYPE     = "button"
	NAVIGATION_TYPE = "navigation"
)

type Component struct {
	Type        string      `json:"type"`
	Information interface{} `json:"info"`
}

type StackComponentInfo struct {
	Uid      string      `json:"uid"`
	Type     string      `json:"type"`
	Children []Component `json:"children"`
}

type TextComponentInfo struct {
	Uid     string  `json:"uid"`
	Message string  `json:"message"`
	Size    float64 `json:"size"`
}

type SpacerComponentInfo struct {
	Uid    string   `json:"uid"`
	Length *float64 `json:"length"`
}

type ButtonComponentInfo struct {
	Uid   string    `json:"uid"`
	Child Component `json:"child"`
}

type NavigationComponentInfo struct {
	Uid       string    `json:"uid"`
	TargetURL string    `json:"to"` // example, open item
	Child     Component `json:"child"`
}

type ImageComponentInfo struct {
	Uid string `json:"uid"`
}

type CircularImageComponentInfo struct {
	Uid string `json:"uid"`
}

type TextFieldComponentInfo struct {
	Uid      string `json:"uid"`
	IsSecure bool   `json:"is_secure"`
	Title    string `json:"title"`
}

type HorizontalScrollComponentInfo struct {
	Uid      string      `json:"uid"`
	Children []Component `json:"children"`
}
