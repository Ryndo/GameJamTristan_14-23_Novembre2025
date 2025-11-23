class_name PlayerInteraction extends Area3D

func Interact() :
	var closestInteractable
	var bodies = get_overlapping_bodies()
	for body in bodies :
		if body is Interactable :
			if closestInteractable == null :
				closestInteractable = body
			elif position.distance_to(body.position) < position.distance_to(closestInteractable.position) :
				closestInteractable = body
	if closestInteractable != null :
		closestInteractable.Interact()



func Hover(body):
	body.HoverAction()


func UnHover(body):
	body.UnHoverAction()
