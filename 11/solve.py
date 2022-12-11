from copy import deepcopy
from dataclasses import dataclass
from functools import reduce
from operator import mul
from sys import argv as args

path = args[1] if len(args) >= 2 else "sample-input.txt"
with open(path) as f:
	data = f.read()

@dataclass(frozen=True)
class MonkeyRule:
	expr                 : str
	test                 : int
	destination_if_true  : int
	destination_if_false : int

@dataclass
class MonkeyState:
	items            : list
	inspection_count : int = 0

rules         = []
initial_state = []

def parse_monkey(spec):
	global rules, initial_state
	
	lines = spec.split("\n")
	
	items = [int(x) for x in lines[1].split(": ")[1].split(", ")]
	initial_state.append(MonkeyState(items))
	
	expr = lines[2].split(": new = ")[1]
	test = int(lines[3].split("by ")[1])
	destination_if_true = int(lines[4].split("monkey ")[1])
	destination_if_false = int(lines[5].split("monkey ")[1])
	
	rule = MonkeyRule(expr, test, destination_if_true, destination_if_false)
	rules.append(rule)

specs = data.split("\n\n")
for spec in specs:
	parse_monkey(spec)

states = deepcopy(initial_state)

def do_turn(i, should_divide, magic):
	global rules, state
	
	rule = rules[i]
	state = states[i]
	
	while state.items:
		state.inspection_count += 1
		old = state.items.pop(0)
		new = eval(rule.expr)
		if should_divide:
			new //= 3
		else:
			new %= magic
		if new % rule.test == 0:
			states[rule.destination_if_true].items.append(new)
		else:
			states[rule.destination_if_false].items.append(new)

def viz_states():
	for i in range(len(rules)):
		print(f"Monkey {i}: ", end="")
		print(", ".join(str(x) for x in states[i].items))

def do_round(should_divide=True, magic=-1):
	global rules, state
	
	for i in range(len(rules)):
		do_turn(i, should_divide, magic)

for _ in range(20):
	do_round()

counts = sorted((state.inspection_count for state in states), reverse=True)
print(counts[0] * counts[1])

states = deepcopy(initial_state)

magic = reduce(mul, (rule.test for rule in rules))

for _ in range(10000):
	do_round(should_divide=False, magic=magic)

counts = sorted((state.inspection_count for state in states), reverse=True)
print(counts[0] * counts[1])