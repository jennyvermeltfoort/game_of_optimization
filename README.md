An optimized Game of Life generation. 
Data structures are optimized to fit into the L1 cache and the `generate_iteration` routine makes use of AVX2 to calculate 8 lines of segments at a time.
Other tricks are used to reduce code branching making the loop more efficient. 
The `generate_iteration` routine could even run threaded because segments are independently calculated.
I realize that this routine does not necessarily need this much optimization -- the code prints the world to the screen faster than what the eye can see --
it was however a fun and insightful exercise.

The code is capable of generating 1000 generations per second for a {64 * segment_size} by {64 * chunk_size} world.
One segment consists of 32 bits and one chunk is 8 lines. 
Thus one line is 64 * 32 = 2048 cells, the world consists of 64 * 8 = 512 lines, making the world 2048 * 512 = 1.048.576 cells big.
This translates to 1.048.576 * 1000 = 1.048.576.000 cells, i.e. 1 billion cells, generated per second.

Most execution time is spend printing the cells to the terminal. Above result is with a 128 cells x 48 lines = 6144 cells sized screen.

CPU requires at least AVX2 support.
