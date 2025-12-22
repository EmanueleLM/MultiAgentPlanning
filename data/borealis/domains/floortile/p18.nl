You control two robots that can paint floor tiles with different colors. The robots can move in four directions: up, down, left, and right. They can paint with one color at a time and can change the color of their spray guns. Tiles can only be painted in the front (up) or behind (down) the robot, and once a tile is painted, no robot can stand on it.

Initially:
- There are 36 tiles arranged in a 6x6 grid (tile_0-1 to tile_5-5).
- Robot1 is at tile_5-3 and has a white spray gun.
- Robot2 is at tile_1-5 and has a black spray gun.
- The colors white and black are available for painting.
- All tiles except tile_5-3 and tile_1-5 are clear and unpainted.
- The tiles have directional relationships with each other, allowing the robots to move up, down, left, and right between adjacent tiles.

Your goal is to paint the following tiles with the specified colors in a checkerboard pattern:
- The odd-numbered tiles in row 1 should be painted white, and the even-numbered tiles should be painted black.
- The even-numbered tiles in row 2 should be painted white, and the odd-numbered tiles should be painted black.
- The odd-numbered tiles in row 3 should be painted white, and the even-numbered tiles should be painted black.
- The even-numbered tiles in row 4 should be painted white, and the odd-numbered tiles should be painted black.
- The odd-numbered tiles in row 5 should be painted white, and the even-numbered tiles should be painted black.

Additionally, you aim to minimize the total cost of the actions taken to achieve this goal.