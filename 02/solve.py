from sys import argv as args

from collections import namedtuple
from enum import Enum

path = args[1] if len(args) >= 2 else "sample-input.txt"
with open(path) as f:
	lines = f.read().splitlines()

class Throw(Enum):
	ROCK = 1
	PAPER = 2
	SCISSORS = 3

Round = namedtuple("Round", ("me", "them"))

rounds = []

THEM_MAP = {
	"A": Throw.ROCK,
	"B": Throw.PAPER,
	"C": Throw.SCISSORS,
}

ME_MAP = {
	"X": Throw.ROCK,
	"Y": Throw.PAPER,
	"Z": Throw.SCISSORS,
}

for line in lines:
	them, me = line.split(" ")
	assert me in ('X', 'Y', 'Z') and them in ('A', 'B', 'C')
	me = ME_MAP[me]
	them = THEM_MAP[them]
	rounds.append(Round(me, them))

def score_round(r):
	score = 0
	score += r.me.value
	if r.me == r.them:
		score += 3
	elif r.me == Throw.ROCK and r.them == Throw.SCISSORS:
		score += 6
	elif r.me == Throw.PAPER and r.them == Throw.ROCK:
		score += 6
	elif r.me == Throw.SCISSORS and r.them == Throw.PAPER:
		score += 6
	return score

#assert len(rounds) == 2500

print(sum(score_round(r) for r in rounds))

rounds = []
for line in lines:
	them, me = line.split(" ")
	assert me in ('X', 'Y', 'Z') and them in ('A', 'B', 'C')
	them = THEM_MAP[them]
	if me == "Y":
		me = them
	elif me == "X":
		# need to lose
		me = min((Round(t, them) for t in Throw), key=score_round).me
	else:
		me = max((Round(t, them) for t in Throw), key=score_round).me
	rounds.append(Round(me, them))

print(sum(score_round(r) for r in rounds))