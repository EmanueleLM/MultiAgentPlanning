(define (problem sokoban_instance)
  (:domain sokoban_domain)
  (:objects
    player1 - agent
    box1 - crate
    left_wall goal f1 f2 box_cell f3 player_cell right_wall - cell
  )
  (:init
    ;; walls
    (wall left_wall)
    (wall right_wall)

    ;; passable floor and goal cells
    (passable goal)
    (passable f1)
    (passable f2)
    (passable box_cell)
    (passable f3)
    (passable player_cell)

    ;; goal marker
    (is_goal goal)

    ;; adjacency (bidirectional)
    (adj left_wall goal) (adj goal left_wall)
    (adj goal f1) (adj f1 goal)
    (adj f1 f2) (adj f2 f1)
    (adj f2 box_cell) (adj box_cell f2)
    (adj box_cell f3) (adj f3 box_cell)
    (adj f3 player_cell) (adj player_cell f3)
    (adj player_cell right_wall) (adj right_wall player_cell)

    ;; initial agent and box positions and occupancy bookkeeping
    (player_at player1 player_cell)
    (occupied_by_player player_cell)

    (box_at box1 box_cell)
    (occupied_by_box box_cell)
  )

  (:goal (and
    (box_at box1 goal)
  ))
)