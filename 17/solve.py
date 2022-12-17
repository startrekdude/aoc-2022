from itertools import cycle
from sys import argv as args

ROCKS = [
	[[1, 1, 1, 1]],
	[
		[0, 1, 0],
		[1, 1, 1],
		[0, 1, 0],
	],
	[
		[0, 0, 1],
		[0, 0, 1],
		[1, 1, 1],
	],
	[
		[1],
		[1],
		[1],
		[1],
	],
	[
		[1, 1],
		[1, 1],
	]
]

path = args[1] if len(args) >= 2 else "sample-input.txt"
with open(path) as f:
	lines = f.read().splitlines()

class Rock:
	def __init__(self, shape):
		self.shape = shape
	def place(self, highest_y):
		self.x = 2
		self.y = len(self.shape) + 3 + highest_y
	def cells(self):
		dx = 0
		dy = 0
		for line in self.shape:
			for c in line:
				yield c, self.x + dx, self.y + dy
				dx += 1
			
			dx = 0
			dy -= 1
	def push(self, jet, room):
		delta = 1 if jet == ">" else -1
		for c, x, y in self.cells():
			x += delta
			if c == 1 and (x > 6 or x < 0 or room[y][x]):
				return
		self.x += delta
	def fall(self, room):
		for c, x, y in self.cells():
			y -= 1
			if c == 1 and (y < 0 or room[y][x]):
				return True
		self.y -= 1
		return False
	def draw_on(self, room):
		for c, x, y in self.cells():
			if c == 1:
				room[y][x] = 1

jeti = 0
rocks = cycle(ROCKS)
room = [[0] * 7 for _ in range(10_000)]
highest_y = -1

def next_jet():
	global jeti
	result = lines[0][jeti]
	jeti += 1
	jeti %= len(lines[0])
	return result

def fall():
	global room, highest_y
	
	rock = Rock(next(rocks))
	rock.place(highest_y)
	while True:
		rock.push(next_jet(), room)
		stopped = rock.fall(room)
		if stopped:
			break
	rock.draw_on(room)
	if rock.y > highest_y:
		highest_y = rock.y

for _ in range(2022):
	fall()
print(highest_y + 1)

jeti = 0
rocks = cycle(ROCKS)
room = [[0] * 7 for _ in range(1_000_000)]
highest_y = -1

fingerprints = {}

rocks_fell = 0
while rocks_fell < 1000000000000:
	fall()
	rocks_fell += 1
	
	fp_jeti  = jeti % len(lines[0])
	fp_rocks = rocks_fell % len(ROCKS)
	
	hitmap = [0] * 7
	iy = highest_y
	while iy > 0:
		row = room[iy]
		for i, c in enumerate(row):
			hitmap[i] += c
		if all(c >= 1 for c in hitmap):
			break
		iy -= 1
	
	if iy == 0:
		continue
	
	fpthis = room[iy:highest_y + 1]
	fpkey = (fp_jeti, fp_rocks)
	if fpkey in fingerprints:
		fpold, old_rocks_fell, old_highest_y = fingerprints[fpkey]
		if fpold == fpthis and fpkey == (1411, 2):
			print(fpkey, fpold)
			print(old_rocks_fell, old_highest_y)
			print(rocks_fell, highest_y)
			drocks = rocks_fell - old_rocks_fell
			dhighest = highest_y - old_highest_y
			print(drocks, dhighest)
			can_apply = (1000000000000 - rocks_fell) // drocks
			rocks_fell += can_apply * drocks
			delta_highest = can_apply * dhighest
			print(rocks_fell, dhighest)
			#break
	else:
		if rocks_fell > 1972:
			fingerprints[fpkey] = fpthis, rocks_fell, highest_y

answer = delta_highest + highest_y + 1
#assert answer == 1514285714288
print(answer)
