from ast import literal_eval
from copy import deepcopy
from functools import total_ordering
from itertools import chain
from sys import argv as args

path = args[1] if len(args) >= 2 else "sample-input.txt"
with open(path) as f:
	data = f.read().split("\n\n")

pairs = []

for pair in data:
	lines = pair.split("\n")
	left = literal_eval(lines[0])
	right = literal_eval(lines[1])
	pairs.append((left, right))

def compare(left, right):
	if isinstance(left, int) and isinstance(right, int):
		if left < right:
			return -1
		elif left > right:
			return 1
		else:
			return 0
	elif isinstance(left, list) and isinstance(right, list):
		left = deepcopy(left)
		right = deepcopy(right)
		while left and right:
			leftx  = left.pop(0)
			rightx = right.pop(0)
			cmp = compare(leftx, rightx)
			if cmp: return cmp
		if right:
			return -1
		if left:
			return 1
		return 0
	elif isinstance(left, int) and isinstance(right, list):
		return compare([left], right)
	elif isinstance(left, list) and isinstance(right, int):
		return compare(left, [right])
	else: assert False

result = 0
for i, (left, right) in enumerate(pairs, start=1):
	cmp = compare(left, right)
	if cmp == -1:
		result += i
print(result)

@total_ordering
class Packet:
	def __init__(self, data):
		self.data = data
	def __lt__(self, other):
		if not isinstance(other, Packet):
			return NotImplemented
		return compare(self.data, other.data) == -1
	def __eq__(self, other):
		if not isinstance(other, Packet):
			return NotImplemented
		return compare(self.data, other.data) == 0
	def __repr__(self):
		return f"Packet(data={self.data!r})"

packets = list(chain.from_iterable(pairs))
packets += [
	[[2]],
	[[6]]
]
packets = [Packet(x) for x in packets]
packets.sort()
packets = [x.data for x in packets]

print((packets.index([[2]]) + 1) * (packets.index([[6]]) + 1))