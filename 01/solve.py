from sys import argv as args

path = args[1] if len(args) >= 2 else "sample-input.txt"
with open(path) as f:
	lines = f.read().splitlines()

elves = []
elf = []
for line in lines:
	if not line:
		elves.append(elf)
		elf = []
	else:
		elf.append(int(line))
elves.append(elf)

print(max(sum(elf) for elf in elves))

elves = sorted(elves, key=sum, reverse=True)

print(sum(elves[0]) + sum(elves[1]) + sum(elves[2]))