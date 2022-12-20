from sys import argv as args

path = args[1] if len(args) >= 2 else "sample-input.txt"
with open(path) as f:
	lines = f.read().splitlines()

data = [int(line) for line in lines]
N    = len(data)

def answer(a):
	i0 = a.index(0)
	return (
		a[(i0 + 1000) % N] +
		a[(i0 + 2000) % N] +
		a[(i0 + 3000) % N]
	)

def mix(a, repeat=1):
	b = list(range(N))
	for _ in range(repeat):
		for k in range(N):
			i = b.index(k)
			x = a[i]
			j = (x + i) % (N - 1)
			
			del a[i]
			del b[i]
			a.insert(j, x)
			b.insert(j, k)
	return a

print(answer(mix(data.copy())))
print(answer(mix([x * 811589153 for x in data], repeat=10)))