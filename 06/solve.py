from sys import argv as args
from collections import Counter

path = args[1] if len(args) >= 2 else "sample-input.txt"
with open(path) as f:
	lines = f.read().splitlines()

packet = lines[0]

for i in range(4, len(packet)):
	c = Counter(packet[i-4:i])
	if max(c.values()) == 1:
		print(i)
		break

for i in range(14, len(packet)):
	c = Counter(packet[i-14:i])
	if max(c.values()) == 1:
		print(i)
		break