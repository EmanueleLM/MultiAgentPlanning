You control a set of robots that can paint floor tiles with different colors. The robots can move in four directions: up, down, left, and right. They can paint with one color at a time and can change the color of their spray guns. Tiles can only be painted in the front (up) or behind (down) the robot, and once a tile is painted, no robot can stand on it.

Initially:
- There are thirty-five tiles arranged in a 7x5 grid (tile_0-1 to tile_6-5).
- Robot1 is at tile_3-5 and has a white spray gun.
- Robot2 is at tile_6-3 and has a black spray gun.
- The colors white and black are available for painting.
- All tiles are clear and unpainted.
- The tiles have directional relationships with each other, allowing the robots to move up, down, left, and right between adjacent tiles.

Your goal is to paint the following tiles with the specified colors in a checkerboard pattern:
- Tiles in row 1: tile_1-1 white, tile_1-2 black, tile_1-3 white, tile_1-4 black, tile_1-5 white.
- Tiles in row 2: tile_2-1 black, tile_2-2 white, tile_2-3 black, tile_2-4 white, tile_2-5 black.
- Tiles in row 3: tile_3-1 white, tile_3-2 black, tile_3-3 white, tile_3-4 black, tile_3-5 white.
- Tiles in row 4: tile_4-1 black, tile_4-2 white, tile_4-3 black, tile_4-4 white, tile_4-5 black.
- Tiles in row 5: tile_5-1 white, tile_5-2 black, tile_5-3 white, tile_5-4 black, tile_5-5 white.
- Tiles in row 6: tile_6-1 black, tile_6-2 white, tile_6-3 black, tile_6-4 white, tile_6-5 black.

Additionally, you aim to minimize the total cost of the actions taken to achieve this goal.