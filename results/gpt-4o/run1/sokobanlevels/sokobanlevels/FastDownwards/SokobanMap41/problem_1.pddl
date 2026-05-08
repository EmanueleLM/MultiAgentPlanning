(define (problem sokoban-instance)
  (:domain sokoban)

  (:objects
    player-1 - player
    box-1 - box
    loc_start loc_box loc_goal - grid_cell
  )

  (:init
    (at player-1 loc_start)
    (box-at box-1 loc_box)
    (goal-at loc_goal)
    
    (adjacent loc_start loc_box)
    (adjacent loc_box loc_goal)
    
    (free loc_start)
    (free loc_goal)
  )

  (:goal
    (box-at box-1 loc_goal)
  )
)