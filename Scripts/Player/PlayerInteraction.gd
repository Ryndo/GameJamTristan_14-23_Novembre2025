class_name PlayerInteraction extends Area3D

func Interact() :
	var bodies = get_overlapping_bodies()
	for body in bodies :
		if body is Interactable :
			body.Interact()



func Hover(body):
	body.HoverAction()


func UnHover(body):
	body.UnHoverAction()
