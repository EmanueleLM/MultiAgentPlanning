(define (problem sokoban-instance)
  (:domain sokoban)
  (:objects
    player - movable
    box - movable
    loc-a loc-b loc-c loc-d loc-e loc-f loc-g loc-h - location
  )
  (:init
    (at player loc-g)
    (at box loc-d)
    (goal_at loc-e)
    
    (is_wall loc-a) (is_wall loc-c)
  
    (adjacent loc-b loc-d) (adjacent loc-d loc-b)
    (adjacent loc-d loc-e) (adjacent loc-e loc-d)
    (adjacent loc-b loc-f) (adjacent loc-f loc-b)
    (adjacent loc-f loc-g) (adjacent loc-g loc-f)

    (is_player player)
    (is_box box)
  )
  (:goal
    (box_at_goal loc-e)
  )
)