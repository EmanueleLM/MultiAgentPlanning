(define (problem sokoban-instance)
  (:domain sokoban)
  (:objects
    l0 l1 l2 - location
  )
  (:init
    (player-at l0)
    (box-at l1)
    (goal-at l2)
    (adjacent l0 l1)
    (adjacent l1 l2)
    (clear l2)
    (clear l0)
    (adjacent l1 l0)
    (adjacent l2 l1)
  )
  (:goal
    (box-at l2)
  )
)