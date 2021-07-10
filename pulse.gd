func pulse_between(start, end, line_num=2, points_num=15):
	# line_num: number of polylines to be drawn when this function is called
	# points_num: number of points in each line
	var relative_end = self.to_local(end)# position of the end point relative to the canvas_item whose draw function is used to call this function
	var relative_start = self.to_local(start)
	var points = [relative_start]
	var relative_end2start = relative_end-relative_start
	var dir = relative_end2start.normalized()
	var segment_length = relative_end2start.length()/points_num
	
	for j in range(line_num):
		for i in range(1, points_num-1):
			var point_offset = (randi()%100)-50
			var current_point = relative_start + i*dir*segment_length + point_offset*Vector2(-dir.y, dir.x)
			points.append(current_point)
		points.append(relative_end)
		draw_polyline(points, Color('#DDDDDD'), randi()%5 +2
		)
