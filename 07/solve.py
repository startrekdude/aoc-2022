from dataclasses import dataclass
from operator import attrgetter
from sys import argv as args

path = args[1] if len(args) >= 2 else "sample-input.txt"
with open(path) as f:
	lines = f.read().splitlines()

@dataclass
class File:
	name : str
	size : int

@dataclass
class Directory:
	name       : str
	parent     : "Directory"
	children   : list
	total_size : int = 0

root = Directory("/", None, [])
pwd  = root

i = 0
while i < len(lines):
	line = lines[i]
	if line.startswith("$ cd "):
		new_place = line[5:]
		if new_place == "/":
			pwd = root
		elif new_place == "..":
			pwd = pwd.parent
			assert pwd
		else:
			for child in pwd.children:
				if isinstance(child, Directory) and child.name == new_place:
					pwd = child
					break
			else: assert False
		i += 1
	elif line.startswith("$ ls"):
		i += 1
		while i < len(lines) and not lines[i].startswith("$"):
			line = lines[i]
			code, name = line.split(" ")
			if code == "dir":
				pwd.children.append(Directory(name, pwd, []))
			else:
				assert code.isdigit()
				pwd.children.append(File(name, int(code)))
			i += 1

def calc_size(node):
	if isinstance(node, File):
		return node.size
	node.total_size = sum(calc_size(c) for c in node.children)
	return node.total_size

calc_size(root)

def directories(node):
	if isinstance(node, Directory):
		yield node
		for child in node.children:
			yield from directories(child)

count = 0
for d in directories(root):
	if d.total_size <= 100000:
		count += d.total_size
print(count)

unused_space = 70000000 - root.total_size
must_delete = 30000000 - unused_space
big_enough = (d for d in directories(root) if d.total_size >= must_delete)

print(min(big_enough, key=attrgetter("total_size")).total_size)