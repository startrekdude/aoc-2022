from collections import defaultdict
from dataclasses import dataclass
from enum import Enum
from sys import argv as args

path = args[1] if len(args) >= 2 else "sample-input.txt"
with open(path) as f:
	lines = f.read().splitlines()

class Tile(Enum):
	OPEN = 0
	WALL = 1

class Direction(Enum):
	NORTH = 0
	EAST  = 1
	SOUTH = 2
	WEST  = 3

@dataclass(frozen=True)
class Point:
	y : int
	x : int
	
	def moves(self):
		yield self
		if self.y != height - 1: yield Point(self.y + 1, self.x)
		if self.x != width  - 1: yield Point(self.y, self.x + 1)
		if self.y !=          0: yield Point(self.y - 1, self.x)
		if self.x !=          0: yield Point(self.y, self.x - 1)
	
	def __add__(self, other):
		if not isinstance(other, Point):
			return NotImplemented
		return Point(self.y + other.y, self.x + other.x)

tiles = []
blizzards = {}

for y, line in enumerate(lines):
	tiles.append([])
	for x, c in enumerate(line):
		if c == "#":
			tiles[-1].append(Tile.WALL)
		else:
			tiles[-1].append(Tile.OPEN)
			p = Point(y, x)
			if c == "^":
				blizzards[p] = [Direction.NORTH]
			elif c == "v":
				blizzards[p] = [Direction.SOUTH]
			elif c == ">":
				blizzards[p] = [Direction.EAST]
			elif c == "<":
				blizzards[p] = [Direction.WEST]
			elif c == ".": pass
			else: assert False

height = len(tiles)
width  = len(tiles[0])

def step_blizzards(blizzards):
	new_blizzards = defaultdict(list)
	for p in blizzards:
		for d in blizzards[p]:
			delta = {
				Direction.NORTH: Point(-1, 0),
				Direction.EAST : Point(0, 1),
				Direction.SOUTH: Point(1, 0),
				Direction.WEST : Point(0, -1),
			}[d]
			q = p + delta
			if tiles[q.y][q.x] == Tile.WALL:
				if   d == Direction.NORTH:
					q = Point(height - 2, p.x)
				elif d == Direction.SOUTH:
					q = Point(1, p.x)
				elif d == Direction.EAST:
					q = Point(p.y, 1)
				elif d == Direction.WEST:
					q = Point(p.y, width - 2)
			new_blizzards[q].append(d)
	return dict(new_blizzards)

def make_memo_table(blizzards):
	memo = [blizzards, step_blizzards(blizzards)]
	while memo[-1] != memo[0]:
		memo.append(step_blizzards(memo[-1]))
	return memo[:-1]

memo = make_memo_table(blizzards)

def pathfind(start, dest, minute=0):
	reached   = {(minute % len(memo), start.y, start.x): minute}
	positions = [start]

	while positions:
		minute       += 1
		blizzdex      = minute % len(memo)
		curblizz      = memo[blizzdex]
		new_positions = []
		for p in positions:
			for q in p.moves():
				if tiles[q.y][q.x] == Tile.WALL: continue
				if q in curblizz: continue
				
				if q == dest:
					return minute
				
				key = (blizzdex, q.y, q.x)
				if key in reached: continue
				
				reached[key] = minute
				new_positions.append(q)
		positions = new_positions
	return -1

start = Point(0, 1)
dest  = Point(height - 1, width - 2)

count = pathfind(start, dest)
print(count)
count = pathfind(dest, start, count)
count = pathfind(start, dest, count)
print(count)