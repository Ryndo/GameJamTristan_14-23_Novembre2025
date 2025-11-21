extends Area3D





func Hit() :
	print("hit")


func _on_body_entered(body):
	body.get_parent().Hitted()
