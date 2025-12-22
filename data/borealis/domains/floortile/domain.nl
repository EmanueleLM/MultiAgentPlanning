The floor-tile domain is designed for planning the actions of robots to paint floor tiles with two colors. Each robot can move in four directions (up, down, right, left), change the color of paint it is carrying, and paint adjacent tiles. The domain also tracks the total cost of actions performed.

The actions defined in this domain include:

1. change-color: This action allows a robot to change the color it has. The preconditions are that the robot currently has a color and the new color is available. The effect is that the robot no longer has the old color and now has the new color. This action increases the total cost by 5.

2. paint-up: This action allows a robot to paint the tile above its current position. The preconditions are that the robot has a color, is at a certain tile, the tile above is clear, and the robot can move up. The effect is that the tile above is no longer clear and is now painted with the robot's color. This action increases the total cost by 2.

3. paint-down: This action allows a robot to paint the tile below its current position. The preconditions are that the robot has a color, is at a certain tile, the tile below is clear, and the robot can move down. The effect is that the tile below is no longer clear and is now painted with the robot's color. This action increases the total cost by 2.

4. up: This action allows a robot to move up to the tile above its current position. The preconditions are that the robot is at a certain tile, the tile above is clear, and the robot can move up. The effect is that the robot is now at the tile above, the tile it was previously at is now clear, and the tile it moved to is no longer clear. This action increases the total cost by 3.

5. down: This action allows a robot to move down to the tile below its current position. The preconditions are that the robot is at a certain tile, the tile below is clear, and the robot can move down. The effect is that the robot is now at the tile below, the tile it was previously at is now clear, and the tile it moved to is no longer clear. This action increases the total cost by 1.

6. right: This action allows a robot to move to the right to the tile adjacent to its current position. The preconditions are that the robot is at a certain tile, the tile to the right is clear, and the robot can move right. The effect is that the robot is now at the tile to the right, the tile it was previously at is now clear, and the tile it moved to is no longer clear. This action increases the total cost by 1.

7. left: This action allows a robot to move to the left to the tile adjacent to its current position. The preconditions are that the robot is at a certain tile, the tile to the left is clear, and the robot can move left. The effect is that the robot is now at the tile to the left, the tile it was previously at is now clear, and the tile it moved to is no longer clear. This action increases the total cost by 1.
