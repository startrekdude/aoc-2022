from sys import argv as args

from string import ascii_lowercase, ascii_uppercase

path = args[1] if len(args) >= 2 else "sample-input.txt"
with open(path) as f:
	lines = f.read().splitlines()

def to_priority(c):
	if c in ascii_lowercase:
		return ord(c) - ord('a') + 1
	elif c in ascii_uppercase:
		return ord(c) - ord('A') + 27
	assert False

result = 0
for line in lines:
	n = len(line)
	assert n % 2 == 0
	c1, c2 = line[:n // 2], line[n // 2:]
	c1 = set(c1)
	c2 = set(c2)
	assert len(c1 & c2) == 1
	c = list(c1 & c2)[0]
	result += to_priority(c)

print(result)

assert len(lines) % 3 == 0

result = 0
i = 0
while i < len(lines):
	c1 = set(lines[i])
	c2 = set(lines[i + 1])
	c3 = set(lines[i + 2])
	assert len(c1 & c2 & c3) == 1
	c = list(c1 & c2 & c3)[0]
	result += to_priority(c)
	i += 3
print(result)