(define (problem sokoban-instance)
  (:domain sokoban)
  (:objects
    player - movable
    box - movable
    loc-0-0 loc-0-1 loc-0-2 loc-1-0 loc-1-1 loc-1-2 loc-2-0 loc-2-1 loc-2-2 - location
  )
  (:init
    (at player loc-0-1)
    (at box loc-1-2)
    (goal_at loc-1-1)
    (is_wall loc-0-0) (is_wall loc-0-2) (is_wall loc-1-0) (is_wall loc-2-0) (is_wall loc-2-1) (is_wall loc-2-2)
    (adjacent loc-0-1 loc-1-1) (adjacent loc-1-1 loc-1-2)
    (adjacent loc-1-1 loc-0-1) (adjacent loc-1-2 loc-1-1)
  )
  (:goal
    (box_at_goal loc-1-1)
  )
)