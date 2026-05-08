(define (problem sokoban-example)
  (:domain sokoban)
  (:objects 
    player1 - agent
    box1 - box
    goal1 - goal
    loc_0_1 loc_0_48 loc_0_89 - location
  )
  (:init 
    (at player1 loc_0_1)
    (at box1 loc_0_48)
    (is-goal loc_0_89)
    (adjacent loc_0_1 loc_0_48) (adjacent loc_0_48 loc_0_1)
    (adjacent loc_0_48 loc_0_89) (adjacent loc_0_89 loc_0_48)
    (is-empty loc_0_1) (is-empty loc_0_89)
  )
  (:goal 
    (at box1 loc_0_89)
  )
)