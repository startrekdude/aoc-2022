from sys import argv as args

from collections import namedtuple
from copy import deepcopy
from string import ascii_uppercase

path = args[1] if len(args) >= 2 else "sample-input.txt"
with open(path) as f:
	lines = f.read().splitlines()

stacks = [[] for _ in range(20)]

it = iter(lines)
while True:
	line = next(it)
	if line.startswith(" 1"):
		break
	for i, c in enumerate(line):
		if c in ascii_uppercase:
			real_index = (i - 1) // 4
			stacks[real_index].append(c)

for i in range(len(stacks) - 1, -1, -1):
	if stacks[i]:
		del stacks[i+1:]
		break

next(it)

MoveCommand = namedtuple("MoveCommand", ("count", "src", "dst"))

commands = []

for line in it:
	parts = line.split(" ")
	count = int(parts[1])
	src = int(parts[3]) - 1
	dst = int(parts[5]) - 1
	commands.append(MoveCommand(count, src, dst))

stacks_orig = deepcopy(stacks)

def exec_move_command(cmd):
	global stacks
	for _ in range(cmd.count):
		stacks[cmd.dst].insert(0, stacks[cmd.src].pop(0))

for cmd in commands:
	exec_move_command(cmd)

print("".join(a[0] for a in stacks))

stacks = stacks_orig

def exec_move_command2(cmd):
	global stacks
	temp = []
	for _ in range(cmd.count):
		temp.append(stacks[cmd.src].pop(0))
	stacks[cmd.dst] = temp + stacks[cmd.dst]

for cmd in commands:
	exec_move_command2(cmd)

print("".join(a[0] for a in stacks))