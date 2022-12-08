from itertools import chain
from sys import argv as args

path = args[1] if len(args) >= 2 else "sample-input.txt"
with open(path) as f:
	lines = f.read().splitlines()

grid = lines
rows = len(grid)
cols = len(grid[0])
visibility = [[0] * cols for _ in range(rows)]

def tree(y, x):
	return int(grid[y][x])

def visible(y, x):
	at = tree(y, x)
	upvis    = all(tree(y2, x) < at for y2 in range(0, y))
	downvis  = all(tree(y2, x) < at for y2 in range(y + 1, rows))
	leftvis  = all(tree(y, x2) < at for x2 in range(0, x))
	rightvis = all(tree(y, x2) < at for x2 in range(x + 1, cols))
	vis = upvis or downvis or leftvis or rightvis
	if x == 0 or y == 0 or x == cols - 1 or y == rows - 1:
		assert vis
	visibility[y][x] = vis
	return vis

for y in range(rows):
	for x in range(cols):
		visible(y, x)

def scenic_score_1d(at, it):
	score = 0
	for y, x in it:
		score += 1
		val = tree(y, x)
		if val >= at:
			break
	return score

def scenic_score(y, x):
	at = tree(y, x)
	upscore    = scenic_score_1d(at, ((y2, x) for y2 in reversed(range(0, y))))
	downscore  = scenic_score_1d(at, ((y2, x) for y2 in range(y + 1, rows)))
	leftscore  = scenic_score_1d(at, ((y, x2) for x2 in reversed(range(0, x))))
	rightscore = scenic_score_1d(at, ((y, x2) for x2 in range(x + 1, cols)))
	score =  upscore * downscore * leftscore * rightscore
	return score

print(sum(chain.from_iterable(visibility)))

max_so_far = 0
for y in range(rows):
	for x in range(cols):
		score = scenic_score(y, x)
		if score > max_so_far:
			max_so_far = score
print(max_so_far)