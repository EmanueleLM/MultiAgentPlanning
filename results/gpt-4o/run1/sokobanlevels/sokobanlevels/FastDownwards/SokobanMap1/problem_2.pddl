(define (problem sokoban-instance)
  (:domain sokoban)
  (:objects
    player - player_type
    box - box_type
    goal - goal_type
    ; Assuming grid has width 3 and height 100 for the given Sokoban level
    cell_1_1 cell_1_2 cell_1_3 cell_2_1 cell_2_2 cell_2_3 
    ...
    cell_99_1 cell_99_2 cell_99_3 cell_100_1 cell_100_2 cell_100_3 - cell_type
  )
  (:init
    (player_at player cell_2_2)
    (box_at box cell_99_2)
    (goal_at goal cell_100_2)
    ; Empty and adjacency assertions can be derived from wall-free and movement-allowed cells.
    (adjacent cell_1_1 cell_2_1) ... ; example adjacency predicates based on grid connectivity and emptiness
    (adjacent cell_2_1 cell_1_1)
    ; Define further adjacency relations ...
  )
  (:goal
    (box_at box cell_100_2)
  )
)