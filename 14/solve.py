from collections import defaultdict
from dataclasses import dataclass
from enum import Enum
from itertools import count, pairwise
from sys import argv as args

path = args[1] if len(args) >= 2 else "sample-input.txt"
with open(path) as f:
	lines = f.read().splitlines()

class Tile(Enum):
	AIR  = 1
	SAND = 2
	ROCK = 3

@dataclass(frozen=True)
class Point:
	x : int
	y : int
	
	def delta_to(self, other):
		if   self.x < other.x:
			return Point(1, 0)
		elif self.x > other.x:
			return Point(-1, 0)
		elif self.y < other.y:
			return Point(0, 1)
		elif self.y > other.y:
			return Point(0, -1)
		else: assert False
	
	def __add__(self, other):
		if not isinstance(other, Point):
			return NotImplemented
		return Point(self.x + other.x, self.y + other.y)

tiles = defaultdict(lambda: Tile.AIR)

for line in lines:
	point_specs = line.split(" -> ")
	points = []
	for point_spec in point_specs:
		x, y = point_spec.split(",")
		x = int(x)
		y = int(y)
		points.append(Point(x, y))
	for start, end in pairwise(points):
		step = start.delta_to(end)
		pos = start
		while pos != end:
			tiles[pos] = Tile.ROCK
			pos += step
		tiles[pos] = Tile.ROCK

void = max(p.y for p in tiles.keys())

def blocked(p):
	global tiles
	return tiles[p] != Tile.AIR or p.y == void + 2

def make_sand(part1=True):
	global tiles, void
	
	sand = Point(500, 0)
	while True:
		if   part1 and sand.y > void:
			return False
		elif not blocked(sand + Point(0, 1)):
			sand += Point(0, 1)
		elif not blocked(sand + Point(-1, 1)):
			sand += Point(-1, 1)
		elif not blocked(sand + Point(1, 1)):
			sand += Point(1, 1)
		else:
			tiles[sand] = Tile.SAND
			return sand != Point(500, 0)

initial_tiles = tiles.copy()

for x in count():
	if not make_sand():
		break
print(x)

tiles = initial_tiles

for x in count():
	if not make_sand(part1=False):
		break
print(x + 1)