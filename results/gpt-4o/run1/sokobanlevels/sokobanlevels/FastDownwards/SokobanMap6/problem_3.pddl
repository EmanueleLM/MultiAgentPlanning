(define (problem sokoban-problem)
  (:domain sokoban)
  (:objects 
    player - agent
    box - box
    l1 l2 l3 - location 
  )
  
  (:init 
    ;; Player and Box locations initialized
    (at player l3 l2)
    (at box l2 l2)
    
    ;; Goal location
    (is_goal l1 l2)

    ;; Adjacencies for important locations
    (adjacent l3 l2 l2 l2) (adjacent l2 l2 l1 l2)
    
    ;; Clear locations relevant to problem
    (is_clear l3 l2)
  )

  (:goal (and (at box l1 l2))))