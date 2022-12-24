from dataclasses import dataclass
from enum import Enum
from itertools import product
from sys import argv as args

path = args[1] if len(args) >= 2 else "sample-input.txt"
with open(path) as f:
	lines = f.read().splitlines()

@dataclass(frozen=True)
class Point:
	y : int
	x : int
	
	def adjacent_points(self):
		for yd, xd in product((-1, 0, 1), repeat=2):
			if yd == 0 and xd == 0: continue
			yield Point(self.y + yd, self.x + xd)

class Direction(Enum):
	NORTH = 0
	SOUTH = 1
	WEST  = 2
	EAST  = 3

elves = set()
y = 0
x = 0
for line in lines:
	for c in line:
		if c == "#":
			elves.add(Point(y, x))
		x += 1
	x = 0
	y += 1

directions = [Direction.NORTH, Direction.SOUTH, Direction.WEST, Direction.EAST]

def propose(elf, elves, directions):
	if not any(p in elves for p in elf.adjacent_points()):
		return None
	
	y = elf.y
	x = elf.x
	
	for direction in directions:
		if   direction == Direction.NORTH     and \
		     Point(y - 1, x) not in elves     and \
		     Point(y - 1, x + 1) not in elves and \
		     Point(y - 1, x - 1) not in elves:
			return Point(y - 1, x)
		elif direction == Direction.SOUTH     and \
		     Point(y + 1, x) not in elves     and \
			 Point(y + 1, x + 1) not in elves and \
			 Point(y + 1, x - 1) not in elves:
			return Point(y + 1, x)
		elif direction == Direction.WEST      and \
		     Point(y, x - 1) not in elves     and \
			 Point(y + 1, x - 1) not in elves and \
			 Point(y - 1, x - 1) not in elves:
			return Point(y, x - 1)
		elif direction == Direction.EAST      and \
		     Point(y, x + 1) not in elves     and \
			 Point(y + 1, x + 1) not in elves and \
			 Point(y - 1, x + 1) not in elves:
			return Point(y, x + 1)
	
	return None

def height(elves):
	return max(elf.y for elf in elves) - min(min(elf.y for elf in elves), 0) + 1

def width(elves):
	return max(elf.x for elf in elves) - min(min(elf.x for elf in elves), 0) + 1

def viz(elves):
	y = min(min(elf.y for elf in elves), 0)
	x = min(min(elf.x for elf in elves), 0)
	
	for _ in range(height(elves)):
		for _ in range(width(elves)):
			if Point(y, x) in elves:
				print("#", end="")
			else:
				print(".", end="")
			x += 1
		
		print()
		x = min(min(elf.x for elf in elves), 0)
		y += 1

def count(elves):
	min_y = min(elf.y for elf in elves)
	max_y = max(elf.y for elf in elves)
	min_x = min(elf.x for elf in elves)
	max_x = max(elf.x for elf in elves)
	
	y = min_y
	x = min_x
	result = 0
	while y <= max_y:
		while x <= max_x:
			if Point(y, x) not in elves:
				result += 1
			x += 1
		
		x = min_x
		y += 1
	return result

TOMBSTONE = object()

for _ in range(10):
	proposals = {}
	for elf in elves:
		proposal = propose(elf, elves, directions)
		if proposal in proposals:
			proposals[proposal] = TOMBSTONE
		else:
			proposals[proposal] = elf
	for dst, src in proposals.items():
		if src is TOMBSTONE: continue
		elves.remove(src)
		elves.add(dst)
	directions.append(directions.pop(0))

print(count(elves))

round_count = 10
while True:
	round_count += 1
	
	proposals = {}
	for elf in elves:
		proposal = propose(elf, elves, directions)
		if proposal in proposals:
			proposals[proposal] = TOMBSTONE
		else:
			proposals[proposal] = elf
	
	num_moved = 0
	for dst, src in proposals.items():
		if src is TOMBSTONE: continue
		elves.remove(src)
		elves.add(dst)
		num_moved += 1
	if num_moved == 0:
		break
		
	directions.append(directions.pop(0))
print(round_count)