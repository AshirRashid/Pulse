func pulse_between(start, target, line_num=2, points_num=15):
	var relative_target = self.to_local(target)
	var relative_start = self.to_local(start)
	var points = [relative_start]
	var relative_target2start = relative_target-relative_start
	var dir = relative_target2start.normalized()
	var segment_length = relative_target2start.length()/points_num
	
	for j in range(line_num):
		for i in range(1, points_num-1):
			var point_offset = (randi()%100)-50
			var current_point = relative_start + i*dir*segment_length + point_offset*Vector2(-dir.y, dir.x)
			points.append(current_point)
			off += 100
		points.append(relative_target)
		draw_polyline(points, Color('#DDDDDD'), randi()%5 +2
		)