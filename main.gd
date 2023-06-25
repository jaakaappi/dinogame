extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func translate_polygon(polygon: PackedVector2Array, position: Vector2) -> PackedVector2Array:
	var newPolygon = polygon
	for i in range(0, newPolygon.size()):
		newPolygon[i] += position
	return newPolygon

func _input(event):
	return
	if event is InputEventMouseButton:
		print("InputEventMouseButton")
		if event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			print("pressed", event)
#			var polygon = Polygon2D.new()
#			polygon.global_position = Vector2(656, 141)
#			polygon.polygon = [Vector2(-10,-10),Vector2(10,-10),Vector2(10,10),Vector2(-10,10)]
			print($Node2D/Polygon2D)
			var node = $Node2D/Polygon2D
			print(node.polygon)
			node.global_position = event.global_position
#			node.offset = event.global_position
#			for i in range(0, node.polygon.size()):
#				node.polygon[i] += event.global_position
			print("node.polygon",node.polygon)
			var result = Geometry2D.clip_polygons($Area2D/CollisionPolygon2D.polygon, translate_polygon(node.polygon, event.global_position))
			print(result)
			$Area2D/CollisionPolygon2D.set_deferred("polygon", result[0])
			print($Area2D/CollisionPolygon2D.polygon)
#			polygon.queue_free()
