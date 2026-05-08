(define (problem sokoban-instance)
  (:domain sokoban)
  (:objects
    player_pos box_pos goal_pos - location
  )
  (:init
    (player-at player_pos)
    (box-at box_pos)
    (goal-at goal_pos)
    (adjacent player_pos box_pos)
    (adjacent box_pos player_pos)
    (adjacent box_pos goal_pos)
    (adjacent goal_pos box_pos)
    (clear goal_pos)
  )
  (:goal
    (box-at goal_pos)
  )
  (:objects
    l0 l1 l2 l3 l4 - location
  )
  (:init
    (player-at l0)
    (box-at l1)
    (goal-at l4)
    (clear l0) 
    (clear l2) 
    (adjacent l0 l1) (adjacent l1 l0)
    (adjacent l1 l2) (adjacent l2 l1)
    (adjacent l2 l3) (adjacent l3 l2)
    (adjacent l3 l4) (adjacent l4 l3)
  )
  (:goal
    (and (box-at l4))
  )
)