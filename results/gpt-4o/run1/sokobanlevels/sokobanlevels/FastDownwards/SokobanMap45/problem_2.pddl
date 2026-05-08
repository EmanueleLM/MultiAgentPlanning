(define (problem sokoban-instance)
  (:domain sokoban)
  (:objects
    l0 l1 l2 l3 - location)
  (:init
    (player-at l0) 
    (box-at l1)
    (goal-at l3)
    (empty l2) 
    (adjacent l0 l1) (adjacent l1 l0)
    (adjacent l1 l2) (adjacent l2 l1)
    (adjacent l2 l3) (adjacent l3 l2)
  )
  (:goal
    (and (box-at l3)))
)