from dataclasses import dataclass
from sys import argv as args

path = args[1] if len(args) >= 2 else "sample-input.txt"
with open(path) as f:
	lines = f.read().splitlines()

@dataclass(frozen=True)
class Point:
	x : int
	y : int
	z : int
	
	def adjacent(self):
		x = self.x
		y = self.y
		z = self.z
		yield Point(x + 1, y, z)
		yield Point(x - 1, y, z)
		yield Point(x, y + 1, z)
		yield Point(x, y - 1, z)
		yield Point(x, y, z + 1)
		yield Point(x, y, z - 1)
	
	def small(self):
		return abs(self.x) < 25 and abs(self.y) < 25 and abs(self.z) < 25

cubes = []
for line in lines:
	x, y, z = line.split(",")
	x = int(x)
	y = int(y)
	z = int(z)
	cubes.append(Point(x, y, z))

cubes = set(cubes)

count = 0
for cube in cubes:
	for p in cube.adjacent():
		if p not in cubes:
			count += 1
print(count)

assert Point(0, 0, 0) not in cubes

air      = set((Point(0, 0, 0),))
last_air = air.copy()
for _ in range(50):
	new_air = set()
	for p in last_air:
		for q in p.adjacent():
			if q not in cubes and q not in air and q.small():
				new_air.add(q)
	air |= new_air
	last_air = new_air

# print(len(air))

count = 0
for cube in cubes:
	for p in cube.adjacent():
		if p in air:
			count += 1
print(count)