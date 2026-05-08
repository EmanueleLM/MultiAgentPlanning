(define (problem sokoban-instance)
  (:domain sokoban)
  (:objects 
    player - agent
    box1 - box
    goal1 - goal
    floor_1_1 - location
    floor_1_90 - location
    floor_1_47 - location
    floor_1_46 - location
  )

  (:init 
    (player_at floor_1_90)
    (box_at box1 floor_1_47)
    (goal_at goal1 floor_1_1)
    (adjacent floor_1_90 floor_1_47)
    (adjacent floor_1_47 floor_1_46)
    (adjacent floor_1_46 floor_1_1)
    (clear floor_1_90)
    (clear floor_1_46)
    (clear floor_1_1)
  )

  (:goal 
    (and (box_on_goal box1 goal1))
  )
)