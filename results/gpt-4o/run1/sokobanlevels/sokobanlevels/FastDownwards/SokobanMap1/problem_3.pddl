(define (problem sokoban-instance)
  (:domain sokoban)
  (:objects
    player - player_type
    box - box_type
    goal - goal_type
    ; Declare only the relevant cells for player, box, and goal
    cell_2_2 cell_50_2 cell_51_2 - cell_type
  )
  (:init
    (player_at player cell_2_2)
    (box_at box cell_50_2)
    (goal_at goal cell_51_2)
    (adjacent cell_2_2 cell_50_2)
    (adjacent cell_50_2 cell_51_2)
    (empty cell_51_2) ; Mark the goal cell as empty for the box to move
  )
  (:goal
    (box_at box cell_51_2)
  )
)