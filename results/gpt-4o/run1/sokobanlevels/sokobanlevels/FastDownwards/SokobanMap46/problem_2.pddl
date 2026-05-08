(define (problem sokoban-problem)
  (:domain sokoban)
  (:objects 
    l01 l50 l99 - location)
  (:init
    (at player1 l99)
    (at box1 l50)
    (goal l01)
    (adjacent l99 l50)
    (adjacent l50 l01)
    (clear l01))
  (:goal
    (and (at box1 l01)))
)