import re

from dataclasses import dataclass
from enum import Enum
from sys import argv as args

path = args[1] if len(args) >= 2 else "sample-input.txt"
with open(path) as f:
	lines = f.read().splitlines()

class Resource(Enum):
	ORE      = 1
	CLAY     = 2
	OBSIDIAN = 3
	GEODE    = 4

@dataclass(frozen=True)
class Recipe:
	result         : Resource
	ore_count      : int
	clay_count     : int
	obsidian_count : int

class State:
	def __init__(self, robots, resources):
		self.robots    = robots
		self.resources = resources
	def __repr__(self):
		return f"State(robots={self.robots!r}, resources={self.resources!r})"
	def __eq__(self, other):
		if not isinstance(other, State):
			return NotImplemented
		return self.robots == other.robots and self.resources == other.resources
	def __hash__(self):
		return hash((
			self.robots[Resource.ORE],
			self.robots[Resource.CLAY],
			self.robots[Resource.OBSIDIAN],
			self.robots[Resource.GEODE],
			self.resources[Resource.ORE],
			self.resources[Resource.CLAY],
			self.resources[Resource.OBSIDIAN],
			self.resources[Resource.GEODE],
		))
	def step(self, blueprint):
		for recipe in blueprint:
			if self.resources[Resource.ORE]      >= recipe.ore_count and \
			   self.resources[Resource.CLAY]     >= recipe.clay_count and \
			   self.resources[Resource.OBSIDIAN] >= recipe.obsidian_count:
				
				new_robots = self.robots.copy()
				new_robots[recipe.result] += 1
				yield State(new_robots, self.incr({
					Resource.ORE     : self.resources[Resource.ORE] - recipe.ore_count,
					Resource.CLAY    : self.resources[Resource.CLAY] - recipe.clay_count,
					Resource.OBSIDIAN: self.resources[Resource.OBSIDIAN] - recipe.obsidian_count,
					Resource.GEODE   : self.resources[Resource.GEODE],
				}))
		yield State(self.robots, self.incr(self.resources))
	def incr(self, resources):
		return {
			Resource.ORE     : resources[Resource.ORE]      + self.robots[Resource.ORE],
			Resource.CLAY    : resources[Resource.CLAY]     + self.robots[Resource.CLAY],
			Resource.OBSIDIAN: resources[Resource.OBSIDIAN] + self.robots[Resource.OBSIDIAN],
			Resource.GEODE   : resources[Resource.GEODE]    + self.robots[Resource.GEODE],
		}
	def geode_count(self):
		return self.resources[Resource.GEODE]

blueprints = []

for line in lines:
	blueprint = []
	nums = [int(x) for x in re.findall("\d+", line)[1:]]
	blueprint.append(Recipe(Resource.ORE, nums[0], 0, 0))
	blueprint.append(Recipe(Resource.CLAY, nums[1], 0, 0))
	blueprint.append(Recipe(Resource.OBSIDIAN, nums[2], nums[3], 0))
	blueprint.append(Recipe(Resource.GEODE, nums[4], 0, nums[5]))
	blueprints.append(blueprint)

def evaluate_blueprint(blueprint, step_count):
	initial_state = State(
		{Resource.ORE: 1, Resource.CLAY: 0, Resource.OBSIDIAN: 0, Resource.GEODE: 0},
		{Resource.ORE: 0, Resource.CLAY: 0, Resource.OBSIDIAN: 0, Resource.GEODE: 0},
	)
	states      = [initial_state]
	seen_states = set((initial_state,))
	
	for i in range(1, step_count+1):
		new_states  = []
		most_geodes = 0
		for state in states:
			for new_state in state.step(blueprint):
				if new_state not in seen_states:
					seen_states.add(new_state)
					new_states.append(new_state)
					
					if new_state.geode_count() > most_geodes:
						most_geodes = new_state.geode_count()
		
		states = [state for state in new_states if state.geode_count() >= most_geodes]
		print(f"After minute {i}: {len(states):,} state(s) to consider. Most geodes: {most_geodes}.")
	return most_geodes

DO_PART_ONE = True

if DO_PART_ONE:
	result = 0
	for i, blueprint in enumerate(blueprints, start=1):
		print(f"Considering Blueprint #{i}...")
		most_geodes = evaluate_blueprint(blueprint, 24)
		print()
		result += i * most_geodes
	print(result)
	print()

blueprints = blueprints[:3]
print("=== PART 2")
result = 1
for i, blueprint in enumerate(blueprints, start=1):
	print(f"Considering Blueprint #{i}...")
	most_geodes = evaluate_blueprint(blueprint, 32)
	print()
	result *= most_geodes
print(result)