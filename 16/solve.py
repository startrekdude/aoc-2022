from copy import deepcopy
from dataclasses import dataclass
from sys import argv as args

import subprocess

path = args[1] if len(args) >= 2 else "sample-input.txt"
with open(path) as f:
	lines = f.read().splitlines()

@dataclass(frozen=True)
class Edge:
	destination : str
	cost        : int

@dataclass(frozen=True)
class Valve:
	name      : str
	flow_rate : int
	edges     : list
	
	def cost_to(self, other):
		for edge in edges:
			if edge.destination == other.name:
				return edge.cost
		return -1

valves = {}

for line in lines:
	name = line.split(" ")[1]
	flow_rate = int(line.split("=")[1].split(";")[0])
	if "valves " in line:
		edges = line.split("valves ")[1].split(", ")
	else:
		edges = [line[-2:]]
	edges = [Edge(e, 1) for e in edges]
	valve = Valve(name, flow_rate, edges)
	valves[name] = valve

def viz_graph(valves):
	print("digraph G {")
	for valve in valves.values():
		print(f'  {valve.name} [label="{valve.name} {valve.flow_rate}"]')
		for edge in valve.edges:
			print(f"  {valve.name} -> {edge.destination} [label={edge.cost}]")
	print("}")

def reduce_graph(valves):
	valves = deepcopy(valves)
	chosen = False
	
	while True:
		for valve in valves.values():
			if valve.flow_rate == 0 and len(valve.edges) == 2 and valve.name != "AA":
				chosen_valve = valve
				chosen = True
				break
		
		if not chosen:
			break
		else:
			chosen = False
			v = valves[chosen_valve.edges[0].destination]
			u = valves[chosen_valve.edges[1].destination]
			
			for i in range(len(v.edges) - 1, -1, -1):
				if v.edges[i].destination == chosen_valve.name:
					del v.edges[i]
			for i in range(len(u.edges) -1, -1, -1):
				if u.edges[i].destination == chosen_valve.name:
					del u.edges[i]
			
			cost = sum(e.cost for e in chosen_valve.edges)
			ve = Edge(u.name, cost)
			ue = Edge(v.name, cost)
			
			v.edges.append(ve)
			u.edges.append(ue)
			
			del valves[chosen_valve.name]
	
	return valves

valves = reduce_graph(valves)

viz_graph(valves)

def dijkstras(valves, start):
	costs = {start: 0}
	to_visit = {start}
	
	while to_visit:
		next_to_visit = set()
		
		for name in to_visit:
			valve = valves[name]
			for edge in valve.edges:
				shorter = edge.destination not in costs or costs[edge.destination] > costs[name] + edge.cost
				if shorter:
					costs[edge.destination] = costs[name] + edge.cost
					next_to_visit.add(edge.destination)
		to_visit = next_to_visit
	
	return costs

names = sorted(valves.keys())[1:]
namesl = "static const char * const names[] = { " + ", ".join('"' + name + '"' for name in names) + " };"

initial_costs_map = dijkstras(valves, "AA")
initial_costs = []
for name in names:
	initial_costs.append(initial_costs_map[name])
initial_costsl = "static const uint8_t initial_costs[] = { " + ", ".join(str(x) for x in initial_costs) + " };"

values = []
for name in names:
	values.append(valves[name].flow_rate)
valuesl = "static const uint8_t values[] = { " + ", ".join(f"{x:<2}" for x in values) + " };"

costs_lines = []
for name in names:
	costs_map = dijkstras(valves, name)
	costs = []
	for name in names:
		costs.append(costs_map[name])
	costs_lines.append("{ " + ", ".join(f"{x:<2}" for x in costs) + " },")
costs_lines[-1] = costs_lines[-1][:-1]

with open("frag.c", "w") as f:
	f.write("#define VALVE_COUNT " + str(len(valves) - 1) + "\n\n")
	f.write(namesl + "\n\n")
	f.write(valuesl + "\n\n")
	f.write(initial_costsl + "\n\n")
	f.write("static const uint8_t costs[][VALVE_COUNT] = {\n")
	for line in costs_lines:
		f.write("  " + line + "\n")
	f.write("};\n")

subprocess.call(["gcc", "-o", "csolve.exe", "-O2", "solve.c"])
#subprocess.call(["csolve"])