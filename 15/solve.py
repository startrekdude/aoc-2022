import re

from dataclasses import dataclass
from itertools import chain
from operator import attrgetter
from sys import argv as args

path = args[1] if len(args) >= 2 else "sample-input.txt"
with open(path) as f:
	lines = f.read().splitlines()

@dataclass(frozen=True)
class Point:
	x : int
	y : int
	
	def distance(self, other):
		return abs(self.x - other.x) + abs(self.y - other.y)

@dataclass(frozen=True)
class Sensor:
	pos        : Point
	beacon_pos : Point
	
	def in_range(self, p):
		return self.pos.distance(p) <= self.pos.distance(self.beacon_pos)

sensors = []
beacons = set()

for line in lines:
	nums = [int(x) for x in re.findall("[-\d]+", line)]
	beacon = Point(nums[2], nums[3])
	beacons.add(beacon)
	sensors.append(Sensor(
		pos       =Point(nums[0], nums[1]),
		beacon_pos=beacon
	))

Y = 2000000

xlo = min(chain((s.pos.x for s in sensors), (s.beacon_pos.x for s in sensors))) * 2
xhi = max(chain((s.pos.x for s in sensors), (s.beacon_pos.x for s in sensors))) * 2

count = 0
for x in range(xlo, xhi + 1):
	p = Point(x, Y)
	
	if p in beacons:
		continue
	
	if any(s.in_range(p) for s in sensors):
		count += 1

print(count)

@dataclass(frozen=True)
class Range:
	lo : int
	hi : int

def analyze_column(x):
	ranges = []
	for sensor in sensors:
		xDelta = abs(sensor.pos.x - x)
		distance = sensor.pos.distance(sensor.beacon_pos)
		yPos = sensor.pos.y
		yDelta = distance - xDelta
		
		yLo = yPos - yDelta
		yHi = yPos + yDelta
		if yLo <= yHi:
			ranges.append(Range(yLo, yHi))
	
	ranges.sort(key=attrgetter("lo"))
	
	for i in range(len(ranges) - 1):
		r1 = ranges[i]
		r2 = ranges[i + 1]
		maybe_gap = r1.hi < r2.lo - 1
		if maybe_gap:
			gap_y = r1.hi + 1
			if all(gap_y < r.lo or gap_y > r.hi for r in ranges):
				return Point(x, gap_y)
	return None

def tuning_frequency(p):
	return p.x * 4000000 + p.y

for x in range(4000001):
	p = analyze_column(x)
	if p:
		print(tuning_frequency(p))
		break