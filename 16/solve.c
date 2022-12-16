#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#include "frag.c"

int evalpath(uint8_t *path) {
	int time = initial_costs[path[0]] + 1;
	int value = 0;
	int tick = values[path[0]];
	for (int i = 1; i < VALVE_COUNT; ++i) {
		uint8_t prev = path[i - 1];
		uint8_t curr = path[i];
		int cost = costs[prev][curr] + 1;
		if (time + cost > 30) break;
		value += tick * cost;
		tick += values[curr];
		time += cost;
	}
	
	value += tick * (30 - time);
	return value;
}

void bruteforce6() {
	uint8_t path[6];
	int max = 0;
	
	for (uint8_t x1 = 0; x1 < 6; ++x1) {
	path[0] = x1;
	
	for (uint8_t x2 = 0; x2 < 6; ++x2) {
	if (x2 == x1) continue;
	path[1] = x2;
	
	for (uint8_t x3 = 0; x3 < 6; ++x3) {
	if (x3 == x2 || x3 == x1) continue;
	path[2] = x3;
	
	for (uint8_t x4 = 0; x4 < 6; ++x4) {
	if (x4 == x3 || x4 == x2 || x4 == x1) continue;
	path[3] = x4;
	
	for (uint8_t x5 = 0; x5 < 6; ++x5) {
	if (x5 == x4 || x5 == x3 || x5 == x2 || x5 == x1) continue;
	path[4] = x5;
	
	for (uint8_t x6 = 0; x6 < 6; ++x6) {
	if (x6 == x5 || x6 == x4 || x6 == x3 || x6 == x2 || x6 == x1) continue;
	path[5] = x6;
	
		int result = evalpath(path);
		if (result > max) {
			printf("%d\n", result);
			max = result;
		}
	
	}
	}
	}
	}
	}
	}
	
	printf("%d\n", max);
}

void bruteforce15(uint8_t x1) {
	int max = 0;
	unsigned long long i = 0;
	time_t start = time(0);
	uint8_t path[15];
	
	path[0] = x1;
	
	for (uint8_t x2 = 0; x2 < 15; ++x2) {
	if (x2 == x1) continue;
	path[1] = x2;
	
	for (uint8_t x3 = 0; x3 < 15; ++x3) {
	if (x3 == x2 || x3 == x1) continue;
	path[2] = x3;
	
	for (uint8_t x4 = 0; x4 < 15; ++x4) {
	if (x4 == x3 || x4 == x2 || x4 == x1) continue;
	path[3] = x4;
	
	for (uint8_t x5 = 0; x5 < 15; ++x5) {
	if (x5 == x4 || x5 == x3 || x5 == x2 || x5 == x1) continue;
	path[4] = x5;
	
	for (uint8_t x6 = 0; x6 < 15; ++x6) {
	if (x6 == x5 || x6 == x4 || x6 == x3 || x6 == x2 || x6 == x1) continue;
	path[5] = x6;
	
	for (uint8_t x7 = 0; x7 < 15; ++x7) {
	if (x7 == x6 || x7 == x5 || x7 == x4 || x7 == x3 || x7 == x2 || x7 == x1) continue;
	path[6] = x7;
	
	for (uint8_t x8 = 0; x8 < 15; ++x8) {
	if (x8 == x7 || x8 == x6 || x8 == x5 || x8 == x4 || x8 == x3 || x8 == x2 || x8 == x1) continue;
	path[7] = x8;
	
	for (uint8_t x9 = 0; x9 < 15; ++x9) {
	if (x9 == x8 || x9 == x7 || x9 == x6 || x9 == x5 || x9 == x4 || x9 == x3 || x9 == x2 || x9 == x1) continue;
	path[8] = x9;
	
	for (uint8_t x10 = 0; x10 < 15; ++x10) {
	if (x10 == x9 || x10 == x8 || x10 == x7 || x10 == x6 || x10 == x5 || x10 == x4 || x10 == x3 || x10 == x2 || x10 == x1) continue;
	path[9] = x10;
	
	for (uint8_t x11 = 0; x11 < 15; ++x11) {
	if (x11 == x10 || x11 == x9 || x11 == x8 || x11 == x7 || x11 == x6 || x11 == x5 || x11 == x4 || x11 == x3 || x11 == x2 || x11 == x1) continue;
	path[10] = x11;
	
	for (uint8_t x12 = 0; x12 < 15; ++x12) {
	if (x12 == x11 || x12 == x10 || x12 == x9 || x12 == x8 || x12 == x7 || x12 == x6 || x12 == x5 || x12 == x4 || x12 == x3 || x12 == x2 || x12 == x1) continue;
	path[11] = x12;
	
	for (uint8_t x13 = 0; x13 < 15; ++x13) {
	if (x13 == x12 || x13 == x11 || x13 == x10 || x13 == x9 || x13 == x8 || x13 == x7 || x13 == x6 || x13 == x5 || x13 == x4 || x13 == x3 || x13 == x2 || x13 == x1) continue;
	path[12] = x13;
	
	for (uint8_t x14 = 0; x14 < 15; ++x14) {
	if (x14 == x13 || x14 == x12 || x14 == x11 || x14 == x10 || x14 == x9 || x14 == x8 || x14 == x7 || x14 == x6 || x14 == x5 || x14 == x4 || x14 == x3 || x14 == x2 || x14 == x1) continue;
	path[13] = x14;
	
	for (uint8_t x15 = 0; x15 < 15; ++x15) {
	if (x15 == x14 || x15 == x13 || x15 == x12 || x15 == x11 || x15 == x10 || x15 == x9 || x15 == x8 || x15 == x7 || x15 == x6 || x15 == x5 || x15 == x4 || x15 == x3 || x15 == x2 || x15 == x1) continue;
	path[14] = x15;
	
		int result = evalpath(path);
		if (result > max) {
			printf("New max: %d -> %d\n", max, result);
			max = result;
		}
		
		i += 1;
		if (i % 100000000 == 0) {
			printf("Iterations: %lu/87178291200\n", i);
			double pct = ((double) i) / 87178291200.0;
			pct *= 100;
			printf("Percent complete: %lf\n", pct);
			time_t now = time(0);
			printf("Seconds elapsed: %d\n", now - start);
		}
	}
	}
	}
	}
	}
	}
	}
	}
	}
	}
	}
	}
	}
	}
	
	printf("FINAL MAX: %d\n", max);
}

int main(int argc, char **argv) {
#if VALVE_COUNT == 6
	bruteforce6();
#else
	int start = atoi(argv[1]);
	printf("Start: %d\n", start);
	bruteforce15(start);
#endif
	
	return 0;
}