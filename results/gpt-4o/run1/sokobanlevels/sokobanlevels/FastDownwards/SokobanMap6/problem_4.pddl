(define (problem sokoban-problem)
  (:domain sokoban)
  (:objects 
    player - agent
    box - box
    l1 l2 l3 - location 
  )
  
  (:init 
    ;; Player and Box location initialized
    (at player l3)
    (at box l2)
    
    ;; Goal location
    (is_goal l1)

    ;; Adjacencies
    (adjacent l3 l2) (adjacent l2 l1)

    ;; Clear locations
    (is_clear l3) (is_clear l1)
  )

  (:goal (and (at box l1)))
)