from sys import argv as args

path = args[1] if len(args) >= 2 else "sample-input.txt"
with open(path) as f:
	lines = f.read().splitlines()

TABLE = {
	"2": 2,
	"1": 1,
	"0": 0,
	"-": -1,
	"=": -2,
}

def unsnafu(s):
	x   = 1
	acc = 0 
	for c in reversed(s):
		acc += TABLE[c] * x
		x *= 5
	return acc

def snafu(x, n):
	m  = 0
	c  = 'a'
	p1 = []
	p2 = []
	
	for _ in range(n):
		p1.append(f"5^{m}*(-2+{c})")
		p2.append(f"{c}>=0,{c}<5")
		m += 1
		c = chr(ord(c) + 1)
	
	c = chr(ord(c) - 1)
	s = "NSolve[{"
	s += "+".join(p1)
	s += f"=={x},"
	s += ",".join(p2)
	s += "},{"
	while c != 'a':
		s += c + ","
		c = chr(ord(c) - 1)
	s += "a},Integers]"
	return s

result = 0
for line in lines:
	result += unsnafu(line)

print(result)
s = snafu(result, 20)
print(s)
#{{t->2,s->2,r->2,q->2,p->2,o->2,n->2,m->2,l->2,k->2,j->2,i->2,h->2,g->2,f->4,e->0,d->1,c->3,b->0,a->2}}

s = input("Result from W|A? ")
s = s[2:-2]
parts = s.split(",")
digits = {}
for part in parts:
	digit, value = part.split("->")
	digits[digit] = int(value)

MAP2 = {
	4: "2",
	3: "1",
	2: "0",
	1: "-",
	0: "="
}

c = 'a'
s = ""
while c in digits:
	s = MAP2[digits[c]] + s
	c = chr(ord(c) + 1)

print(s)
print(unsnafu(s))