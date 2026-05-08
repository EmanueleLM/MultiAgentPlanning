(define (problem sokoban_instance)
  (:domain sokoban_corridor)
  (:objects
    player1 - player
    box1 - box
    cell_r2 cell_r3 cell_r4 cell_r5 cell_r6 - cell
  )
  (:init
    ;; initial occupancy
    (player_at player1 cell_r2)
    (box_at box1 cell_r4)

    ;; clear cells (empty traversable cells)
    (clear cell_r3)
    (clear cell_r5)
    (clear cell_r6)

    ;; adjacency down (top -> bottom)
    (adj_down cell_r2 cell_r3)
    (adj_down cell_r3 cell_r4)
    (adj_down cell_r4 cell_r5)
    (adj_down cell_r5 cell_r6)

    ;; adjacency up (bottom -> top)
    (adj_up cell_r3 cell_r2)
    (adj_up cell_r4 cell_r3)
    (adj_up cell_r5 cell_r4)
    (adj_up cell_r6 cell_r5)
  )
  (:goal (box_at box1 cell_r6))
)