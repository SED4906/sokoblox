extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var levels = [
#	#0
#	[[[2,2,6,7,1],[9,2,13,7,1],[11,5,11,5,5]],
#	 [[3,3,3,3,4],[4,4,5,5,2]]],
#	#1
#	[[[5,2,10,5,1],[9,5,10,5,-1],[8,3,8,3,-1],[9,3,9,3,5]],
#	 [[6,3,6,3,4],[8,4,8,4,2]]],
#	#2
#	[[[3,2,5,4,1],[6,2,7,2,1],[8,2,12,6,1],[4,3,4,3,5]],
#	 [[3,2,3,2,4],[10,3,10,5,2]]],
#	#3
#	[[[1,1,10,7,1],[14,4,14,4,5]],
#	 [[2,2,2,2,4],[6,4,6,4,2],[8,6,8,6,2],[9,2,9,2,2]]],
#	#4
#	[[[1,1,2,4,1],[4,4,7,5,1],[4,1,4,2,1],[4,7,4,8,1],[5,8,7,8,1],[8,8,9,8,6],[8,4,8,4,5],[7,7,7,7,1],[5,6,6,6,1]],
#	 [[1,4,1,4,4],[2,1,2,1,2],[4,2,4,2,2],[4,4,4,4,2],[6,8,7,8,2],[7,7,7,7,2]]],
#	#5
#	[[[1,1,3,3,1],[4,1,4,2,1],[5,0,8,3,1],[1,5,3,7,1],[10,1,13,3,1],[9,2,9,3,1],[2,4,3,4,1],[1,5,3,7,1],[5,5,7,7,1],[4,6,4,7,1],[11,5,13,7,1],[9,6,9,6,1],[2,2,2,2,6],[11,2,11,2,6],[12,6,12,6,5]],
#	 [[1,1,1,1,4],[6,2,7,2,2],[2,6,2,6,2],[6,6,6,6,2]]],
#	#6
#	[[[1,1,7,7,1],[2,4,7,4,-1],[4,3,4,5,-1],[6,2,6,2,6],[2,2,2,2,5]],
#	 [[1,1,1,1,4],[2,6,2,6,2],[4,6,4,6,2],[6,6,6,6,2]]],
#	#7
#	[[[1,1,2,5,1],[1,6,14,7,1],[12,1,14,5,1],[4,8,6,8,1],[4,1,6,4,1],[5,5,6,5,1],[3,1,3,3,1],[9,3,9,3,6],[3,2,3,2,5]],
#	 [[2,2,2,2,4],[5,3,5,3,2],[5,7,5,7,2],[13,2,13,2,2],[13,6,13,6,2]]],
#	#8
#	[[[1,1,3,3,1],[4,1,4,2,1],[5,2,6,6,1],[4,6,4,7,1],[1,5,3,7,1],[7,3,7,5,1],[8,2,10,6,1],[2,2,2,2,6],[2,6,2,6,5]],
#	 [[1,1,1,1,4],[9,4,9,4,2]]],
#	#9
#	[[[1,1,3,3,1],[2,2,4,4,1],[3,3,7,5,1],[6,2,8,4,1],[7,1,9,3,1],[4,6,6,8,1],[2,2,2,2,6],[8,2,8,2,6],[5,7,5,7,6],[5,6,5,6,5]],
#	 [[1,1,1,1,4],[4,4,6,4,2],[5,3,5,5,2]]],
#	#10
#	[[[1,1,7,7,1],[4,4,4,4,-1],[6,2,6,2,6],[6,4,6,4,6],[7,7,7,7,5],[4,6,4,6,6],[2,6,2,6,6]],
#	 [[2,2,2,2,4],[3,5,5,5,2],[5,3,5,5,2]]],
#	#11
#	[[[1,1,11,4,1],[5,1,5,3,-1],[7,2,7,4,-1],[2,3,2,3,6],[10,3,10,3,7],[3,2,3,2,5]],
#	 [[1,1,1,1,4]]],
#	#12
#	[[[1,1,10,6,1],[5,1,6,5,-1],[1,5,3,6,-1],[8,5,10,6,-1],[3,3,3,3,6],[8,3,8,3,7],[9,2,9,2,5]],
#	 [[1,1,1,1,4]]],
#	#13
#	[[[1,1,10,6,1],[5,1,6,5,-1],[1,5,3,6,-1],[8,5,10,6,-1],[3,3,3,3,7],[8,3,8,3,5],[12,6,13,7,6]],
#	 [[1,1,1,1,4]]],
#	#14
#	[[[1,1,3,7,1],[4,2,4,3,1],[4,5,4,6,1],[6,5,8,7,1],[12,1,8,2,1],[2,2,2,2,5],[2,6,2,6,7],[12,2,12,2,7],[13,1,13,1,6],[8,2,8,2,6],[10,4,10,4,6],[12,6,12,6,6]],
#	 [[6,5,8,7,2],[7,6,7,6,4]]],
#	#Win
#	[[[1,1,1,1,1],[2,2,2,2,1],[3,1,3,1,1],[1,3,1,3,1],[5,1,7,3,1],[9,1,11,3,1],[10,1,10,2,-1],[1,5,1,6,1],[2,6,2,7,1],[3,5,3,6,1],[5,5,7,5,1],[6,6,6,6,1],[5,7,7,7,1],[9,5,11,7,1],[10,6,10,7,-1],[13,1,14,4,1],[13,6,14,7,1]],
#	 [[6,2,6,2,4]]]
]

var undos = []

func blueprint(levels_blueprint):
	var lines = levels_blueprint.split("\n")
	var modulo = 0
	var level = []
	for line in lines:
		if modulo == 0:
			level.append(line)
		else:
			var layer = []
			var groups = line.split(":")
			for group in groups:
				var stringgroup = group.split(" ")
				var numbergroup = []
				for stringnumber in stringgroup:
					numbergroup.append(int(stringnumber))
				layer.append(numbergroup)
			level.append(layer)
		modulo=(modulo+1)%3
		if modulo == 0:
			levels.append(level)
			level = []

var current_level=0

func load_levelpack(filename):
	levels = []
	var file = File.new()
	file.open(filename,File.READ)
	var file_text=file.get_as_text()
	file.close()
	blueprint(file_text)
	setup(current_level)
	current_level=0

# Called when the node enters the scene tree for the first time.
func _ready():
	load_levelpack("res://levels.txt")

func undo():
	var undo_to = []
	if(len(undos) > 1):
		undo_to = undos.pop_back()
	else:
		undo_to = undos[0]
	$Layer0.clear()
	$Layer1.clear()
	var layer0 = undo_to[0]
	var layer1 = undo_to[1]
	for cell in layer0:
		$Layer0.set_cell(cell[0],cell[1],cell[2])
	for cell in layer1:
		$Layer1.set_cell(cell[0],cell[1],cell[2])

func make_undo():
	var used_cells0 = $Layer0.get_used_cells()
	var used_cells1 = $Layer1.get_used_cells()
	var layer0 = []
	var layer1 = []
	for cell in used_cells0:
		layer0.append([cell.x,cell.y,$Layer0.get_cellv(cell)])
	for cell in used_cells1:
		layer1.append([cell.x,cell.y,$Layer1.get_cellv(cell)])
	undos.append([layer0,layer1])

func setup(level):
	undos = []
	$Layer0.clear()
	$Layer1.clear()
	var layer0 = levels[level][1]
	var layer1 = levels[level][2]
	for box in layer0:
		for x in range(box[0],box[2]+1):
			for y in range(box[1],box[3]+1):
				$Layer0.set_cell(x,y,box[4])
	for box in layer1:
		for x in range(box[0],box[2]+1):
			for y in range(box[1],box[3]+1):
				$Layer1.set_cell(x,y,box[4])
	make_undo()
	$Label.text = String(level+1) + " - " + levels[level][0]

func push_box(from, to, direction):
	if $Layer1.get_cellv(to) == 2:
		push_box(to,to+direction,direction)
	$Layer1.set_cellv(from,-1)
	$Layer1.set_cellv(to,2)

func move_block():
	if Input.is_action_just_pressed("up"):
		var red_cells=$Layer1.get_used_cells_by_id(3)
		var black_cells=$Layer1.get_used_cells_by_id(4)
		if len(red_cells) == 2:
			if red_cells[0].x - red_cells[1].x == 0:
				var black_cell=red_cells[0]+Vector2(0,-1)
				if red_cells[1].y < red_cells[0].y:
					black_cell=red_cells[1]+Vector2(0,-1)
				if $Layer1.get_cellv(black_cell)==2:
					push_box(black_cell,black_cell+Vector2(0,-1),Vector2(0,-1))
				if $Layer0.get_cellv(black_cell) != -1:
					$Layer1.set_cellv(black_cell,4)
					$Layer1.set_cellv(red_cells[0],-1)
					$Layer1.set_cellv(red_cells[1],-1)
					$Click0.play()
					return true
			elif $Layer0.get_cellv(red_cells[0]+Vector2(0,-1)) != -1 and $Layer0.get_cellv(red_cells[1]+Vector2(0,-1)) != -1:
				$Layer1.set_cellv(red_cells[0],-1)
				$Layer1.set_cellv(red_cells[1],-1)
				if $Layer1.get_cellv(red_cells[0]+Vector2(0,-1))==2:
					push_box(red_cells[0]+Vector2(0,-1),red_cells[0]+Vector2(0,-2),Vector2(0,-1))
				if $Layer1.get_cellv(red_cells[1]+Vector2(0,-1))==2:
					push_box(red_cells[1]+Vector2(0,-1),red_cells[1]+Vector2(0,-2),Vector2(0,-1))
				$Layer1.set_cellv(red_cells[0]+Vector2(0,-1),3)
				$Layer1.set_cellv(red_cells[1]+Vector2(0,-1),3)
				$Click0.play()
				return true
		else:
			var black_cell=black_cells[0]
			if $Layer0.get_cellv(black_cell+Vector2(0,-2))==-1 and $Layer1.get_cellv(black_cell+Vector2(0,-1))==2:
				$Layer1.set_cellv(black_cell+Vector2(0,-1),-1)
				$Layer0.set_cellv(black_cell+Vector2(0,-2),0)
			if $Layer0.get_cellv(black_cell+Vector2(0,-1))!=-1 and $Layer0.get_cellv(black_cell+Vector2(0,-2))!=-1:
				$Layer1.set_cellv(black_cell,-1)
				if $Layer1.get_cellv(black_cell+Vector2(0,-1))==2:
					push_box(black_cell+Vector2(0,-1),black_cell+Vector2(0,-2),Vector2(0,-1))
				if $Layer1.get_cellv(black_cell+Vector2(0,-2))==2:
					push_box(black_cell+Vector2(0,-2),black_cell+Vector2(0,-3),Vector2(0,-1))
				$Layer1.set_cellv(black_cell+Vector2(0,-1),3)
				$Layer1.set_cellv(black_cell+Vector2(0,-2),3)
				$Click0.play()
				return true
	elif Input.is_action_just_pressed("down"):
		var red_cells=$Layer1.get_used_cells_by_id(3)
		var black_cells=$Layer1.get_used_cells_by_id(4)
		if len(red_cells) == 2:
			if red_cells[0].x - red_cells[1].x == 0:
					var black_cell=red_cells[0]-Vector2(0,-1)
					if red_cells[1].y > red_cells[0].y:
						black_cell=red_cells[1]-Vector2(0,-1)
					if $Layer1.get_cellv(black_cell)==2:
						push_box(black_cell,black_cell-Vector2(0,-1),Vector2(0,1))
					if $Layer0.get_cellv(black_cell) != -1:
						$Layer1.set_cellv(black_cell,4)
						$Layer1.set_cellv(red_cells[0],-1)
						$Layer1.set_cellv(red_cells[1],-1)
						$Click0.play()
						return true
			elif $Layer0.get_cellv(red_cells[0]-Vector2(0,-1)) != -1 and $Layer0.get_cellv(red_cells[1]-Vector2(0,-1)) != -1:
				$Layer1.set_cellv(red_cells[0],-1)
				$Layer1.set_cellv(red_cells[1],-1)
				if $Layer1.get_cellv(red_cells[0]-Vector2(0,-1))==2:
					push_box(red_cells[0]-Vector2(0,-1),red_cells[0]-Vector2(0,-2),Vector2(0,1))
				if $Layer1.get_cellv(red_cells[1]-Vector2(0,-1))==2:
					push_box(red_cells[1]-Vector2(0,-1),red_cells[1]-Vector2(0,-2),Vector2(0,1))
				$Layer1.set_cellv(red_cells[0]-Vector2(0,-1),3)
				$Layer1.set_cellv(red_cells[1]-Vector2(0,-1),3)
				$Click0.play()
				return true
		else:
			var black_cell=black_cells[0]
			if $Layer0.get_cellv(black_cell-Vector2(0,-2))==-1 and $Layer1.get_cellv(black_cell-Vector2(0,-1))==2:
				$Layer1.set_cellv(black_cell-Vector2(0,-1),-1)
				$Layer0.set_cellv(black_cell-Vector2(0,-2),0)
			if $Layer0.get_cellv(black_cell-Vector2(0,-1))!=-1 and $Layer0.get_cellv(black_cell-Vector2(0,-2))!=-1:
				$Layer1.set_cellv(black_cell,-1)
				if $Layer1.get_cellv(black_cell-Vector2(0,-1))==2:
					push_box(black_cell-Vector2(0,-1),black_cell-Vector2(0,-2),Vector2(0,1))
				if $Layer1.get_cellv(black_cell-Vector2(0,-2))==2:
					push_box(black_cell-Vector2(0,-2),black_cell-Vector2(0,-3),Vector2(0,1))
				$Layer1.set_cellv(black_cell-Vector2(0,-1),3)
				$Layer1.set_cellv(black_cell-Vector2(0,-2),3)
				$Click0.play()
				return true
	elif Input.is_action_just_pressed("left"):
		var red_cells=$Layer1.get_used_cells_by_id(3)
		var black_cells=$Layer1.get_used_cells_by_id(4)
		if len(red_cells) == 2:
			if red_cells[0].x - red_cells[1].x == 0:
				if $Layer0.get_cellv(red_cells[0]-Vector2(1,0)) != -1 and $Layer0.get_cellv(red_cells[1]-Vector2(1,0)) != -1:
					$Layer1.set_cellv(red_cells[0],-1)
					$Layer1.set_cellv(red_cells[1],-1)
					if $Layer1.get_cellv(red_cells[0]-Vector2(1,0))==2:
						push_box(red_cells[0]-Vector2(1,0),red_cells[0]-Vector2(2,0),Vector2(-1,0))
					if $Layer1.get_cellv(red_cells[1]-Vector2(1,0))==2:
						push_box(red_cells[1]-Vector2(1,0),red_cells[1]-Vector2(2,0),Vector2(-1,0))
					$Layer1.set_cellv(red_cells[0]-Vector2(1,0),3)
					$Layer1.set_cellv(red_cells[1]-Vector2(1,0),3)
					$Click0.play()
					return true
			else:
				var black_cell=red_cells[0]-Vector2(1,0)
				if red_cells[1].x < red_cells[0].x:
					black_cell=red_cells[1]-Vector2(1,0)
				if $Layer1.get_cellv(black_cell)==2:
					push_box(black_cell,black_cell+Vector2(-1,0),Vector2(-1,0))
				if $Layer0.get_cellv(black_cell) != -1:
					$Layer1.set_cellv(black_cell,4)
					$Layer1.set_cellv(red_cells[0],-1)
					$Layer1.set_cellv(red_cells[1],-1)
					$Click0.play()
					return true
		else:
			var black_cell=black_cells[0]
			if $Layer0.get_cellv(black_cell-Vector2(2,0))==-1 and $Layer1.get_cellv(black_cell-Vector2(1,0))==2:
				$Layer1.set_cellv(black_cell-Vector2(1,0),-1)
				$Layer0.set_cellv(black_cell-Vector2(2,0),0)
			if $Layer0.get_cellv(black_cell-Vector2(1,0))!=-1 and $Layer0.get_cellv(black_cell-Vector2(2,0))!=-1:
				$Layer1.set_cellv(black_cell,-1)
				if $Layer1.get_cellv(black_cell-Vector2(1,0))==2:
					push_box(black_cell-Vector2(1,0),black_cell-Vector2(2,0),Vector2(-1,0))
				if $Layer1.get_cellv(black_cell-Vector2(2,0))==2:
					push_box(black_cell-Vector2(2,0),black_cell-Vector2(3,0),Vector2(-1,0))
				$Layer1.set_cellv(black_cell-Vector2(1,0),3)
				$Layer1.set_cellv(black_cell-Vector2(2,0),3)
				$Click0.play()
				return true
	elif Input.is_action_just_pressed("right"):
		var red_cells=$Layer1.get_used_cells_by_id(3)
		var black_cells=$Layer1.get_used_cells_by_id(4)
		if len(red_cells) == 2:
			if red_cells[0].x - red_cells[1].x == 0:
				if $Layer0.get_cellv(red_cells[0]+Vector2(1,0)) != -1 and $Layer0.get_cellv(red_cells[1]+Vector2(1,0)) != -1:
					$Layer1.set_cellv(red_cells[0],-1)
					$Layer1.set_cellv(red_cells[1],-1)
					if $Layer1.get_cellv(red_cells[0]+Vector2(1,0))==2:
						push_box(red_cells[0]+Vector2(1,0),red_cells[0]+Vector2(2,0),Vector2(1,0))
					if $Layer1.get_cellv(red_cells[1]+Vector2(1,0))==2:
						push_box(red_cells[1]+Vector2(1,0),red_cells[1]+Vector2(2,0),Vector2(1,0))
					$Layer1.set_cellv(red_cells[0]+Vector2(1,0),3)
					$Layer1.set_cellv(red_cells[1]+Vector2(1,0),3)
					$Click0.play()
					return true
			else:
				var black_cell=red_cells[0]+Vector2(1,0)
				if red_cells[1].x > red_cells[0].x:
					black_cell=red_cells[1]+Vector2(1,0)
				if $Layer1.get_cellv(black_cell)==2:
					push_box(black_cell,black_cell+Vector2(1,0),Vector2(1,0))
				if $Layer0.get_cellv(black_cell) != -1:
					$Layer1.set_cellv(black_cell,4)
					$Layer1.set_cellv(red_cells[0],-1)
					$Layer1.set_cellv(red_cells[1],-1)
					$Click0.play()
					return true
		else:
			var black_cell=black_cells[0]
			if $Layer0.get_cellv(black_cell+Vector2(2,0))==-1 and $Layer1.get_cellv(black_cell+Vector2(1,0))==2:
				$Layer1.set_cellv(black_cell+Vector2(1,0),-1)
				$Layer0.set_cellv(black_cell+Vector2(2,0),0)
			if $Layer0.get_cellv(black_cell+Vector2(1,0))!=-1 and $Layer0.get_cellv(black_cell+Vector2(2,0))!=-1:
				$Layer1.set_cellv(black_cell,-1)
				if $Layer1.get_cellv(black_cell+Vector2(1,0))==2:
					push_box(black_cell+Vector2(1,0),black_cell+Vector2(2,0),Vector2(1,0))
				if $Layer1.get_cellv(black_cell+Vector2(2,0))==2:
					push_box(black_cell+Vector2(2,0),black_cell+Vector2(3,0),Vector2(1,0))
				$Layer1.set_cellv(black_cell+Vector2(1,0),3)
				$Layer1.set_cellv(black_cell+Vector2(2,0),3)
				$Click0.play()
				return true
	return false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("open"):
		$FileDialog.popup()
	if Input.is_action_just_pressed("reset"):
		$Click1.play()
		setup(current_level)
	if Input.is_action_just_pressed("undo"):
		$Click1.play()
		undo()
	if move_block():
		make_undo()
	var white_cells=$Layer1.get_used_cells_by_id(2)
	for white_cell in white_cells:
		if $Layer0.get_cellv(white_cell) == -1:
			$Layer1.set_cellv(white_cell,-1)
			$Layer0.set_cellv(white_cell,0)
	var black_cells=$Layer1.get_used_cells_by_id(4)
	for black_cell in black_cells:
		if $Layer0.get_cellv(black_cell) == 5:
			var win_condition = true
			for blue_cell in $Layer0.get_used_cells_by_id(6):
				if $Layer1.get_cellv(blue_cell) != 2:
					win_condition = false
			if win_condition:
				current_level+=1
				setup(current_level)
				$Click2.play()
			else:
				var orange_cells=$Layer0.get_used_cells_by_id(7)
				for orange_cell in orange_cells:
					$Layer1.set_cellv(orange_cell,2)

func _on_FileDialog_file_selected(path):
	load_levelpack(path)
