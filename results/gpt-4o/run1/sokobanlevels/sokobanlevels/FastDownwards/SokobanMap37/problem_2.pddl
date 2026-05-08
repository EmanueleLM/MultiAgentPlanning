(define (problem sokoban_problem)
  (:domain sokoban)

  (:objects
    player - player_type
    box1 - box_type
    pos_start pos_box pos_goal pos1 pos2 pos3 - position
  )

  (:init
    (at player pos_start)
    (box_at box1 pos_box)
    (goal pos_goal)

    ; Explicitly define adjacency for accessibility
    (adjacent pos_start pos1)
    (adjacent pos1 pos_box)
    (adjacent pos_box pos_goal)
    
    (adjacent pos1 pos_start)
    (adjacent pos_box pos1)
    (adjacent pos_goal pos_box)

    ; Clear positions for movement
    (clear pos1)
    (clear pos_goal)
  )

  (:goal
    (box_at box1 pos_goal)
  )
)