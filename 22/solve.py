from dataclasses import dataclass
from enum import Enum
from math import gcd
from sys import argv as args

path = args[1] if len(args) >= 2 else "sample-input.txt"
with open(path) as f:
	lines = f.read().splitlines()

class Tile(Enum):
	OPEN = 0
	WALL = 1

@dataclass(frozen=True)
class Point:
	y : int
	x : int
	
	def __add__(self, other):
		if not isinstance(other, Point):
			return NotImplemented
		return Point(self.y + other.y, self.x + other.x)

DIRECTIONS = [Point(0, 1), Point(1, 0), Point(0, -1), Point(-1, 0)]

EAST  = 0
SOUTH = 1
WEST  = 2
NORTH = 3

tiles        = {}
start_pos    = None
height       = 0
width        = 0
instructions = lines[-1]

y = 0
x = 0
for line in lines:
	if not line: break
	
	height = max(height, y)
	for c in line:
		width = max(width, x)
		p     = Point(y, x)
		if   c == " ":
			pass
		elif c == ".":
			tiles[p] = Tile.OPEN
			if not start_pos: start_pos = p
		elif c == "#":
			tiles[p] = Tile.WALL
		else: assert False
		x += 1
	x = 0
	y += 1

def decode_instructions(instructions):
	i = 0
	while i < len(instructions):
		if instructions[i] in {'L', 'R'}:
			yield instructions[i]
			i += 1
		else:
			start = i
			while i < len(instructions) and instructions[i].isdigit():
				i += 1
			yield int(instructions[start:i])

direction = 0
pos = start_pos
for instruction in decode_instructions(instructions):
	if   instruction == "R":
		direction = (direction + 1) % len(DIRECTIONS)
	elif instruction == "L":
		direction = (direction - 1) % len(DIRECTIONS)
	elif isinstance(instruction, int):
		delta = DIRECTIONS[direction]
		for _ in range(instruction):
			q = pos + delta
			while q not in tiles:
				q += delta
				if   q.x > width:
					q = Point(q.y, 0)
				elif q.x < 0:
					q = Point(q.y, width)
				elif q.y > height:
					q = Point(0, q.x)
				elif q.y < 0:
					q = Point(height, q.x)
			tile = tiles[q]
			if tile == Tile.OPEN:
				pos = q
			else: break
	else: assert False, instruction

width  += 1
height += 1

print((pos.y + 1) * 1000 + (pos.x + 1) * 4 + direction)

face_size = gcd(width, height)

if face_size == 4:
	faces = [
		Point(0, 8),
		Point(4, 0),
		Point(4, 4),
		Point(4, 8),
		Point(8, 8),
		Point(8, 12),
	]
	scale_factor = 100
	render_name = "sample.png"
elif face_size == 50:
	faces = [
		Point(0, 50),
		Point(0, 100),
		Point(50, 50),
		Point(100, 0),
		Point(100, 50),
		Point(150, 0),
	]
	scale_factor = 8
	render_name = "real.png"
else: assert False

def print_face(face):
	for yd in range(face_size):
		for xd in range(face_size):
			tile = tiles[Point(face.y + yd, face.x + xd)]
			if tile == Tile.OPEN:
				print(".", end="")
			elif tile == Tile.WALL:
				print("#", end="")
		print()

def render():
	from PIL import Image, ImageDraw, ImageFont
	
	im_width  = width * scale_factor
	im_height = height * scale_factor
	im = Image.new("RGB", (im_width, im_height), "white")
	draw = ImageDraw.Draw(im)
	font = ImageFont.truetype("arial.ttf", 200)
	
	def render_face(face, s):
		for yd in range(face_size):
			for xd in range(face_size):
				y = face.y + yd
				x = face.x + xd
				tile = tiles[Point(y, x)]
				iy = y * scale_factor
				ix = x * scale_factor
				color = (150, 150, 150) if tile == Tile.OPEN else (0, 0, 0)
				draw.rectangle([ix, iy, ix + scale_factor - 1, iy + scale_factor - 1], color, color)
		iy = (face.y + face_size // 2) * scale_factor - 100
		ix = (face.x + face_size // 2) * scale_factor - 50
		draw.text((ix, iy), s, "white", font)
	
	for i, face in enumerate(faces, 1):
		render_face(face, str(i))
	im.save(render_name)
	
render()

def face_north_edge(face):
	for xd in range(face_size):
		yield Point(face.y, face.x + xd)

def face_east_edge(face):
	x = face.x + face_size - 1
	for yd in range(face_size):
		yield Point(face.y + yd, x)

def face_south_edge(face):
	y = face.y + face_size - 1
	for xd in range(face_size):
		yield Point(y, face.x + xd)

def face_west_edge(face):
	for yd in range(face_size):
		yield Point(face.y + yd, face.x)

def show_face_edges(face):
	def c(p):
		return "#" if tiles[p] == Tile.WALL else "."
	print("NORTH")
	print("".join(c(p) for p in face_north_edge(face)))
	print("EAST")
	print("".join(c(p) for p in face_east_edge(face)))
	print("SOUTH")
	print("".join(c(p) for p in face_south_edge(face)))
	print("WEST")
	print("".join(c(p) for p in face_west_edge(face)))

stitches = {}
danger = set()

def stitch(src_face, src_edge, dst_face, dst_edge, new_direction, reverse=False):
	def make_edge_it(face, edge):
		if   edge == NORTH:
			return face_north_edge(face)
		elif edge == EAST:
			return face_east_edge(face)
		elif edge == SOUTH:
			return face_south_edge(face)
		elif edge == WEST:
			return face_west_edge(face)
		else: assert False
	
	src_face = faces[src_face - 1]
	dst_face = faces[dst_face - 1]
	src_it   = make_edge_it(src_face, src_edge)
	dst_it   = make_edge_it(dst_face, dst_edge)
	if reverse:
		dst_it = reversed(list(dst_it))
	
	for src, dst in zip(src_it, dst_it):
		if src in stitches:
			danger.add(src)
		stitches[src] = (dst, new_direction)

if face_size == 4:
	stitch(1, NORTH, 2, NORTH, SOUTH, True )
	stitch(1, WEST , 3, NORTH, SOUTH, False)
	stitch(1, EAST , 6, EAST , WEST , True )
	stitch(2, NORTH, 1, NORTH, SOUTH, True )
	stitch(2, WEST , 6, SOUTH, NORTH, True )
	stitch(2, SOUTH, 5, SOUTH, NORTH, True )
	stitch(3, NORTH, 1, WEST , EAST , False)
	stitch(3, SOUTH, 5, WEST , EAST , True )
	stitch(4, EAST , 6, NORTH, SOUTH, True )
	stitch(5, WEST , 3, SOUTH, NORTH, True )
	stitch(5, SOUTH, 2, SOUTH, NORTH, True )
	stitch(6, NORTH, 4, EAST , WEST , True )
	stitch(6, EAST , 1, EAST , WEST , True )
	stitch(6, SOUTH, 2, WEST , EAST , True )
elif face_size == 50:
	stitch(1, NORTH, 6, WEST , EAST , False)
	stitch(1, WEST , 4, WEST , EAST , True )
	stitch(2, NORTH, 6, SOUTH, NORTH, False)
	stitch(2, EAST , 5, EAST , WEST , True )
	stitch(2, SOUTH, 3, EAST , WEST , False)
	stitch(3, WEST , 4, NORTH, SOUTH, False)
	stitch(3, EAST , 2, SOUTH, NORTH, False)
	stitch(4, NORTH, 3, WEST , EAST , False)
	stitch(4, WEST , 1, WEST , EAST , True )
	stitch(5, EAST , 2, EAST , WEST , True )
	stitch(5, SOUTH, 6, EAST , WEST , False)
	stitch(6, WEST , 1, NORTH, SOUTH, False)
	stitch(6, SOUTH, 2, NORTH, SOUTH, False)
	stitch(6, EAST , 5, SOUTH, NORTH, False)
else: assert False

direction = 0
pos = start_pos
for instruction in decode_instructions(instructions):
	if   instruction == "R":
		direction = (direction + 1) % len(DIRECTIONS)
	elif instruction == "L":
		direction = (direction - 1) % len(DIRECTIONS)
	elif isinstance(instruction, int):
		for _ in range(instruction):
			delta = DIRECTIONS[direction]
			q = pos + delta
			maybe_new_direction = None
			if q not in tiles:
				if pos == Point(0, 50) and direction == NORTH:
					#print("FIXED")
					q = Point(150, 0)
					maybe_new_direction = EAST
				elif pos == Point(100, 0) and direction == NORTH:
					#print("FIXED")
					q = Point(50, 50)
					maybe_new_direction = EAST
				elif pos == Point(100, 0) and direction == WEST:
					#print("FIXED")
					q = Point(49, 50)
					maybe_new_direction = EAST
				elif pos == Point(199, 0) and direction == WEST:
					#print("FIXED")
					q = Point(0, 99)
					maybe_new_direction = SOUTH
				elif pos == Point(149, 99) and direction == EAST:
					#print("FIXED")
					q = Point(0, 149)
					maybe_new_direction = WEST
				else:
					q, maybe_new_direction = stitches[pos]
				
				#if pos in danger:
				#	print("DANGER")
				#	print(pos, q, DIRECTIONS[direction], DIRECTIONS[maybe_new_direction])
				#	print()
			tile = tiles[q]
			if tile == Tile.OPEN:
				pos = q
				if maybe_new_direction is not None:
					direction = maybe_new_direction
			else: break
	else: assert False, instruction
print((pos.y + 1) * 1000 + (pos.x + 1) * 4 + direction)