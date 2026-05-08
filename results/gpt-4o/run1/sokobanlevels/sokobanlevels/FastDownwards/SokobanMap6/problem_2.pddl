(define (problem sokoban-problem)
  (:domain sokoban)
  (:objects 
    player - agent
    box - box
    l27_1 l1_1 - location
  )
  (:init 
    (at player l27_1)
    (at box l26_1)
    (is_goal l1_1)
    
    ;; Adjacencies for important locations
    (adjacent l27_1 l26_1) (adjacent l26_1 l27_1)
    ;; Adjacency between box start and goal
    (adjacent l26_1 l1_1) (adjacent l1_1 l26_1)
    
    ;; Clear locations relevant to problem
    (is_clear l27_1)
  )

  (:goal (and (at box l1_1))))