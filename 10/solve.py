from sys import argv as args

path = args[1] if len(args) >= 2 else "sample-input.txt"
with open(path) as f:
	lines = f.read().splitlines()

def in_order():
	X = 1
	cycle_count = 0
	for line in lines:
		if line == "noop":
			cycle_count += 1
			yield X, cycle_count
		elif line.startswith("addx"):
			delta = int(line[5:])
			cycle_count += 1
			yield X, cycle_count
			cycle_count += 1
			yield X, cycle_count
			X += delta

points = {20, 60, 100, 140, 180, 220}

result = 0
for X, cycle_count in in_order():
	if cycle_count in points:
		result += X * cycle_count
print(result)

def in_order_with_crt():
	crt = [[0] * 40 for _ in range(6)]
	
	def update_crt():
		i = cycle_count - 1
		y, x = divmod(i, 40)
		if X == x or X + 1 == x or X - 1 == x:
			crt[y][x] = 1

	X = 1
	cycle_count = 0
	for line in lines:
		if line == "noop":
			cycle_count += 1
			update_crt()
		elif line.startswith("addx"):
			delta = int(line[5:])
			cycle_count += 1
			update_crt()
			cycle_count += 1
			update_crt()
			X += delta
	
	return crt

def viz(crt):
	for line in crt:
		line = "".join("#" if val else "." for val in line)
		print(line)

viz(in_order_with_crt())