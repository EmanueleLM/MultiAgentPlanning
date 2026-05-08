(define (problem sokoban-instance)
  (:domain sokoban)
  (:objects 
    player - agent
    box1 - box
    goal1 - goal
    wall_0_0 - wall
    wall_0_1 - wall
    wall_0_2 - wall
    wall_0_3 - wall
    wall_0_4 - wall
    wall_0_5 - wall
    ...
    wall_2_89 - wall
    wall_2_90 - wall
    floor_1_1 - location
    floor_1_2 - location
    ...
    floor_1_88 - location
    floor_1_89 - location
  )

  (:init 
    (player_at floor_1_89)
    (box_at box1 floor_1_46)
    (goal_at goal1 floor_1_1)
    (wall_at wall_0_0)
    ...
    (wall_at wall_2_90)
    (adjacent floor_1_1 floor_1_2)
    (adjacent floor_1_2 floor_1_3)
    ...
    (adjacent floor_1_88 floor_1_89)
    (clear floor_1_1)
    ...
    (clear floor_1_88)
    (clear floor_1_89)
  )

  (:goal 
    (and (box_on_goal box1 goal1))
  )
)