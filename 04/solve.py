from sys import argv as args

from collections import Counter
from dataclasses import dataclass

path = args[1] if len(args) >= 2 else "sample-input.txt"
with open(path) as f:
	lines = f.read().splitlines()

@dataclass(frozen=True)
class SectionRange:
	# both inclusive
	lo : int
	hi : int
	
	def contains(self, other):
		return self.lo <= other.lo and self.hi >= other.hi
	
	def any_overlap(self, other):
		return (
			self.lo  <= other.lo <= self.hi  or
			self.lo  <= other.hi <= self.hi  or
			other.lo <= self.lo  <= other.hi or
			other.lo <= self.hi  <= other.hi
		)

def parse_section_range(s):
	lo, hi = s.split("-")
	return SectionRange(int(lo), int(hi))

pairs = []

for line in lines:
	elf1, elf2 = line.split(",")
	pairs.append((parse_section_range(elf1), parse_section_range(elf2)))

count = 0
for first, second in pairs:
	if first.contains(second):
		count += 1
	elif second.contains(first):
		count += 1

print(count)

count = 0
for first, second in pairs:
	if first.any_overlap(second):
		count += 1

print(count)