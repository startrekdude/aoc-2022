from dataclasses import dataclass
from sys import argv as args

path = args[1] if len(args) >= 2 else "sample-input.txt"
with open(path) as f:
	lines = f.read().splitlines()

grid = lines
rows = len(lines)
cols = len(lines[0])

@dataclass(frozen=True)
class Point:
	y : int
	x : int
	
	def neighbours(self):
		if self.y != rows - 1: yield Point(self.y + 1, self.x)
		if self.y != 0       : yield Point(self.y - 1, self.x)
		if self.x != cols - 1: yield Point(self.y, self.x + 1)
		if self.x != 0       : yield Point(self.y, self.x - 1)
	
	def valid_neighbours(self):
		global grid
		for neighbour in self.neighbours():
			self_value = grid[self.y][self.x]
			other_value = grid[neighbour.y][neighbour.x]
			if self_value >= other_value:
				yield neighbour
			elif chr(ord(self_value) + 1) == other_value:
				yield neighbour

for y in range(rows):
	for x in range(cols):
		if grid[y][x] == "S":
			grid[y] = grid[y][:x] + "a" + grid[y][x+1:]
			start = Point(y, x)
		elif grid[y][x] == "E":
			grid[y] = grid[y][:x] + "z" + grid[y][x+1:]
			end = Point(y, x)

def dijkstras(start, end):
	global grid, rows, cols
	
	distance = {start: 0}
	visited  = set()
	to_visit = {start}
	
	while to_visit:
		next_to_visit = set()
		
		for node in to_visit:
			for neighbour in node.valid_neighbours():
				if neighbour not in visited:
					visited.add(neighbour)
					next_to_visit.add(neighbour)
					distance[neighbour] = distance[node] + 1
		
		to_visit = next_to_visit
	
	if end in distance:
		return distance[end]
	else:
		return 2**31 - 1

def viz_distance(distance):
	for y in range(rows):
		for x in range(cols):
			print(distance[Point(y, x)], end="")
		print()

print(dijkstras(start, end))

min_so_far = 2**31 - 1
for y in range(rows):
	for x in range(cols):
		if grid[y][x] != "a":
			continue
		
		p = Point(y, x)
		distance = dijkstras(p, end)
		if distance < min_so_far:
			min_so_far = distance
print(min_so_far)