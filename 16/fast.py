from dataclasses     import dataclass
from functools       import partial
from multiprocessing import cpu_count, Process, Queue
from random          import random, sample
from sys             import argv as args
from time            import time
from queue           import Empty

@dataclass(frozen=True, slots=True)
class World:
	size          : int
	values        : dict
	costs         : dict
	initial_costs : dict

def read_graph(lines):
	adj    = {}
	values = {}
	for line in lines:
		name  = line[6:8]
		value = int(line.split("=")[1].split(";")[0])
		if   "valve " in line:
			neighbours = (line.split("valve ")[1],)
		elif "valves " in line:
			neighbours = tuple(line.split("valves ")[1].split(", "))
		values[name] = value
		adj   [name] = neighbours
	return adj, values

def make_world(adj, values):
	nonzero_nodes = tuple(u for u, value in values.items() if value)
	initial_costs = {u: cost + 1 for u, cost in distances("AA", adj).items() if u in nonzero_nodes}
	values        = {u: value for u, value in values.items() if u in nonzero_nodes}
	costs         = {}
	for u in nonzero_nodes:
		costs[u]  = {v: cost + 1 for v, cost in distances(u, adj).items() if u in nonzero_nodes}
	return World(len(values), values, costs, initial_costs)

def distances(start, adj):
	distances = {start: 0}
	distance  = 0
	visited   = {start}
	to_visit  = {start}
	while to_visit:
		distance += 1
		next_to_visit = set()
		for u in to_visit:
			for v in adj[u]:
				if v not in visited:
					distances[v] = distance
					visited      .add(v)
					next_to_visit.add(v)
		to_visit = next_to_visit
	return distances

def evaluate(limit, world, sol):
	time  = world.initial_costs[sol[0]]
	tick  = world.values[sol[0]]
	value = 0
	for i in range(1, len(sol)):
		curr = sol[i]
		prev = sol[i - 1]
		cost = world.costs[prev][curr]
		if time + cost > limit: break
		value += tick * cost
		tick  += world.values[curr]
		time  += cost
	value += tick * (limit - time)
	return value

def swap(sol, i, j):
	if i > j:
		temp = i
		i    = j
		j    = temp
	return sol[:i] + (sol[j],) + sol[i+1:j] + (sol[i],) + sol[j+1:]

def random_neighbour(indices, sol):
	i, j = sample(indices, 2)
	return swap(sol, i, j)

def evaluate_pair(cut, limit, world, sol):
	if cut == 0:
		return evaluate(limit, world, sol)
	return evaluate(limit, world, sol[:cut]) + evaluate(limit, world, sol[cut:])

def format_cut_sol(cut, sol):
	me_sol       = "-".join(sol[:cut])
	elephant_sol = "-".join(sol[cut:])
	return f"cut={cut}; me={me_sol}; elephant={elephant_sol}"

def anneal(world, n, initial_sol, random_neighbour, evaluate):
	sol        = initial_sol
	value      = evaluate(world, sol)
	best_sol   = sol
	best_value = value
	
	for k in range(n):
		neighbour_sol   = random_neighbour(sol)
		neighbour_value = evaluate(world, neighbour_sol)
		if neighbour_value > value or random() < (k / n)**3:
			sol   = neighbour_sol
			value = neighbour_value
			if value > best_value:
				best_sol   = sol
				best_value = value
		if random() < (k / n)**3:
			sol   = best_sol
			value = best_value
	return best_value, best_sol

def par_anneal_worker(queue, *args):
	queue.put(anneal(*args))

def par_anneal(*args):
	queue = Queue()
	procs = []
	
	for _ in range(cpu_count()):
		proc = Process(target=par_anneal_worker, args=(queue,) + args)
		proc .start()
		procs.append(proc)
	
	for proc in procs:
		proc.join()
	
	best_value, best_sol = queue.get_nowait()
	while True:
		try:
			value, sol = queue.get_nowait()
			if value > best_value:
				best_value = value
				best_sol   = sol
		except Empty:
			break
	return best_value, best_sol

def main():
	start = time()
	
	path = args[1] if len(args) >= 2 else "sample-input.txt"
	with open(path) as f:
		lines = f.read().splitlines()
	adj, values = read_graph(lines)
	world       = make_world(adj, values)
	
	# Part 1
	value, sol = par_anneal(
		world,
		30_000,
		tuple(world.values.keys()),
		partial(random_neighbour, tuple(range(world.size))),
		partial(evaluate, 30)
	)
	print(f"Path '{'-'.join(sol)}' has value {value}.")

	# Part 2
	cut = world.size // 2
	value, sol = anneal(
		world,
		100_000,
		tuple(world.values.keys()),
		partial(random_neighbour, tuple(range(world.size))),
		partial(evaluate_pair, cut, 26)
	)
	print(f"Path '{format_cut_sol(cut, sol)}' has value {value}.")

	time_taken = time() - start
	print(f"Solution found in {time_taken:.2f}s.\n")
	
	print("Suboptimal solutions for part 2:")
	while cut > 0:
		cut -= 1
		value, sol = anneal(
			world,
			100_000,
			tuple(world.values.keys()),
			partial(random_neighbour, tuple(range(world.size))),
			partial(evaluate_pair, cut, 26)
		)
		print(f"Path '{format_cut_sol(cut, sol)}' has value {value}.")

if __name__ == "__main__":
	main()