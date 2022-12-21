from dataclasses import dataclass
from enum import Enum
from operator import add, floordiv, mul, sub, truediv
from sys import argv as args
from types import FunctionType

path = args[1] if len(args) >= 2 else "sample-input.txt"
with open(path) as f:
	lines = f.read().splitlines()

@dataclass(frozen=True)
class Op:
	left  : str
	op    : FunctionType
	right : str

monkeys = {}

for line in lines:
	name, job = line.split(": ")
	if job.isdigit():
		monkeys[name] = int(job)
	else:
		left, op, right = job.split(" ")
		op = {
			"+": add,
			"-": sub,
			"*": mul,
			"/": floordiv,
		}[op]
		monkeys[name] = Op(left, op, right)

initial_monkeys = monkeys.copy()

while not isinstance(monkeys["root"], int):
	for name, job in monkeys.items():
		if isinstance(job, int): continue
		if not isinstance(monkeys[job.left], int): continue
		if not isinstance(monkeys[job.right], int): continue
		
		monkeys[name] = job.op(monkeys[job.left], monkeys[job.right])

print(monkeys["root"])

monkeys = initial_monkeys.copy()

while True:
	evaluated = False
	to_delete = set()
	
	for name, job in monkeys.items():
		if isinstance(job, int): continue
		if job.left == "humn" or job.right == "humn": continue
		if not isinstance(monkeys[job.left], int): continue
		if not isinstance(monkeys[job.right], int): continue
		
		monkeys[name] = job.op(monkeys[job.left], monkeys[job.right])
		to_delete.add(job.left)
		to_delete.add(job.right)
		evaluated = True
	
	for key in to_delete:
		del monkeys[key]
	
	if not evaluated:
		break

desired_vals = []
root = monkeys["root"]
if isinstance(monkeys[root.left], int):
	desired_vals.append((root.right, monkeys[root.left]))
else:
	desired_vals.append((root.left, monkeys[root.right]))

def get_desired_value_right(x, op, z):
	# Find y such that x op y = z
	if   op == add:
		return z - x
	elif op == sub:
		return x - z
	elif op == mul:
		assert z / x == z // x, f"{z} {x}"
		return z // x
	elif op == floordiv:
		assert x / z == x // z, f"{x} {z}"
		return x // z
	else: assert False

def get_desired_value_left(op, y, z):
	# Find x such that x op y = z
	if   op == add:
		return z - y
	elif op == sub:
		return y + z
	elif op == mul:
		assert z / y == z // y, f"{z} {y}"
		return z // y
	elif op == floordiv:
		return y * z
	else: assert False

monkeys["humn"] = Op("plac", print, "hold")

while True:
	name, val = desired_vals[-1]
	if name == "humn":
		print(val)
		break
	job       = monkeys[name]
	if isinstance(monkeys[job.left], int):
		target_name = job.right
		target_val  = get_desired_value_right(monkeys[job.left], job.op, val)
		desired_vals.append((target_name, target_val))
	else:
		target_name = job.left
		target_val  = get_desired_value_left(job.op, monkeys[job.right], val)
		desired_vals.append((target_name, target_val))