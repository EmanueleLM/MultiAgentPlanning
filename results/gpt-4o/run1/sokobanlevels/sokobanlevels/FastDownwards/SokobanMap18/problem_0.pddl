(define (problem sokoban-instance)
  (:domain sokoban)
  (:objects
    player - entity
    box1 - entity
    cell_11 cell_12 cell_493 cell_495 - location
  )
  (:init
    (at player cell_493)
    (at box1 cell_495)
    (goal cell_12)
    (clear cell_12)
    (adjacent cell_493 cell_495)
    (adjacent cell_495 cell_12)
  )
  (:goal (at box1 cell_12))
)