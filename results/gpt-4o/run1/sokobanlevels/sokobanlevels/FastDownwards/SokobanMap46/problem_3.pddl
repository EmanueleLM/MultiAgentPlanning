(define (problem sokoban-problem)
  (:domain sokoban)
  (:objects 
    l01 l02 l03 - location)
  (:init
    (at player1 l03)
    (at box1 l02)
    (goal l01)
    (adjacent l03 l02)
    (adjacent l02 l01)
    (clear l01))
  (:goal
    (and (at box1 l01)))
)