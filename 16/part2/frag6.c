#define VALVE_COUNT 6

static const char * const names[] = { "BB", "CC", "DD", "EE", "HH", "JJ" };

static const uint8_t values[] = { 13, 2 , 20, 3 , 22, 21 };

static const uint8_t initial_costs[] = { 1, 2, 1, 2, 5, 2 };

static const uint8_t costs[][VALVE_COUNT] = {
  { 0 , 1 , 2 , 3 , 6 , 3  },
  { 1 , 0 , 1 , 2 , 5 , 4  },
  { 2 , 1 , 0 , 1 , 4 , 3  },
  { 3 , 2 , 1 , 0 , 3 , 4  },
  { 6 , 5 , 4 , 3 , 0 , 7  },
  { 3 , 4 , 3 , 4 , 7 , 0  }
};
