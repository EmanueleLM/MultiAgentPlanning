(define (problem sokoban-instance)
  (:domain sokoban)
  (:objects 
    player - agent
    box1 - box
    goal1 - goal
    floor_1_1 - location
    floor_1_2 - location
    floor_1_46 - location
    floor_1_89 - location
  )

  (:init 
    (player_at floor_1_89)
    (box_at box1 floor_1_46)
    (goal_at goal1 floor_1_1)
    (adjacent floor_1_1 floor_1_2)
    (adjacent floor_1_2 floor_1_46)
    (adjacent floor_1_46 floor_1_89)
    (clear floor_1_1)
    (clear floor_1_2)
    (clear floor_1_46)
    (clear floor_1_89)
  )

  (:goal 
    (and (box_on_goal box1 goal1))
  )
)