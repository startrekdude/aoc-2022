all : solve.exe solve.s

solve.exe : solve.c
	clang -o solve.exe -O2 -march=native -fno-asynchronous-unwind-tables solve.c

solve.s : solve.c
	clang -O2 -march=native -fno-asynchronous-unwind-tables -masm=intel -S solve.c

clean :
	del solve.s solve.exe