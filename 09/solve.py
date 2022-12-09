from dataclasses import dataclass
from itertools import product
from sys import argv as args

path = args[1] if len(args) >= 2 else "sample-input.txt"
with open(path) as f:
	lines = f.read().splitlines()

@dataclass(frozen=True)
class Point:
	x : int
	y : int
	
	def touching(self, other):
		for xDelta, yDelta in product((-1, 0, 1), repeat=2):
			if self == Point(other.x + xDelta, other.y + yDelta):
				return True
		return False

def update_tail(head, tail):
	if   head == Point(tail.x - 2, tail.y):
		tail = Point(tail.x - 1, tail.y)
	elif head == Point(tail.x + 2, tail.y):
		tail = Point(tail.x + 1, tail.y)
	elif head == Point(tail.x, tail.y - 2):
		tail = Point(tail.x, tail.y - 1)
	elif head == Point(tail.x, tail.y + 2):
		tail = Point(tail.x, tail.y + 1)
	elif not head.touching(tail):
		xDelta = 1 if head.x > tail.x else -1
		yDelta = 1 if head.y > tail.y else -1
		tail = Point(tail.x + xDelta, tail.y + yDelta)
	return tail

DIRECTIONS = {
	"U": (0, 1),
	"D": (0, -1),
	"L": (-1, 0),
	"R": (1, 0),
}

head = Point(0, 0)
tail = Point(0, 0)

visited = set()
visited.add(tail)

for command in lines:
	direction, count = command.split(" ")
	count = int(count)
	delta = DIRECTIONS[direction]
	for _ in range(count):
		head = Point(head.x + delta[0], head.y + delta[1])
		tail = update_tail(head, tail)
		visited.add(tail)

print(len(visited))

knots = [Point(0, 0)] * 10

visited = set()
visited.add(Point(0, 0))

for command in lines:
	direction, count = command.split(" ")
	count = int(count)
	delta = DIRECTIONS[direction]
	for _ in range(count):
		knots[0] = Point(knots[0].x + delta[0], knots[0].y + delta[1])
		for i in range(1, 10):
			head = knots[i - 1]
			tail = knots[i]
			tail = update_tail(head, tail)
			knots[i] = tail
		visited.add(knots[-1])

print(len(visited))