(define (problem sokoban-problem)
  (:domain sokoban)
  (:objects 
    l01 - location
    l02 - location
    l03 - location
    ...
    l99 - location)
  (:init
    (at player1 l99)
    (at box1 l50)
    (goal l01)
    ; Adjacency based on grid structure and walls
    (adjacent l99 l98)
    (adjacent l98 l97)
    ; continue defining adjacency for all locations considering walls
    (clear l01) ; and all other clear locations, excluding walls
    )
  (:goal
    (and (at box1 l01))))