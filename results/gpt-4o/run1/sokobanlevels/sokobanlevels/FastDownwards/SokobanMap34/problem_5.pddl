(define (problem sokoban-problem)
  (:domain sokoban)
  (:objects
    player1 - player
    box1 - box
    cell_1 cell_2 cell_player cell_box_goal - cell
  )
  (:init
    (at player1 cell_player)
    (at box1 cell_box_goal)
    (clear cell_1)
    (clear cell_2)
    (adjacent cell_player cell_box_goal)
    (adjacent cell_box_goal cell_1)
    (adjacent cell_1 cell_2)
    (is_goal cell_2)
  )
  (:goal
    (at box1 cell_2)
  )
)