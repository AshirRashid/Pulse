# IMPLEMENTATION WITH Line2D

func pulse_between(line2d: Line2D, start:Vector2, end:Vector2, line_num:=3, points_num:=20, max_amp:=20):
	# line2d: the Line2D node to be used to display the lines
	# start: the originating point of all lines
	# end: the ending point of all lines
	# line_num: number of polylines to be drawn when this function is called
	# points_num: number of points in each line
	# max_amp: every point's maximum perpendicular distance from the line
	var end2start = end-start
	var dir = end2start.normalized()
	var segment_length = end2start.length()/points_num
	line2d.points = [start]
	
	for j in range(line_num):
		var pulse_points = PoolVector2Array()
		for i in range(1, points_num):
			var point_offset = (randi()%max_amp*2)-max_amp
			var current_point = start + i*dir*segment_length + point_offset*Vector2(-dir.y, dir.x)
			# Notice that Vector2(-dir.y, dir.x) is perpendicular to dir
			pulse_points.append(current_point)
			
		if j%2 == 0:
			pulse_points.append(end)
		else:
			pulse_points.invert()
			pulse_points.append(start)
		line2d.points += pulse_points


# IMPLEMENTATION WITH draw_polyline

func pulse_between(start, end, line_num=2, points_num=15):
	# line_num: number of polylines to be drawn when this function is called
	# points_num: number of points in each line
	var relative_end = self.to_local(end) # position of the end point relative to the canvas_item whose draw function is used to call this function
	var relative_start = self.to_local(start)
	var points = [relative_start]
	var relative_end2start = relative_end-relative_start
	var dir = relative_end2start.normalized()
	var segment_length = relative_end2start.length()/points_num
	
	for j in range(line_num):
		for i in range(1, points_num-1):
			var point_offset = (randi()%100)-50
			var current_point = relative_start + i*dir*segment_length + point_offset*Vector2(-dir.y, dir.x)
			# Notice that Vector2(-dir.y, dir.x) is perpendicular to dir
			points.append(current_point)
		points.append(relative_end)
		draw_polyline(points, Color('#DDDDDD'), randi()%5 +2
		)
