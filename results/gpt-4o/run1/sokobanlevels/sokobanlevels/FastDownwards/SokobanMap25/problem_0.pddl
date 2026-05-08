(define (problem sokoban-instance)
  (:domain sokoban)
  (:objects
    player1 - player
    box1 - box
    loc_1_1 loc_1_2 loc_1_3 loc_51_3 loc_52_3 loc_53_3 - location
  )

  (:init
    (at_player player1 loc_1_2)
    (at_box box1 loc_52_3)
    (goal_location loc_51_3)
    
    (adjacent loc_1_1 loc_1_2) (adjacent loc_1_2 loc_1_1)
    (adjacent loc_1_2 loc_1_3) (adjacent loc_1_3 loc_1_2)
    (adjacent loc_1_3 loc_51_3) (adjacent loc_51_3 loc_1_3)
    (adjacent loc_51_3 loc_52_3) (adjacent loc_52_3 loc_51_3)
    (adjacent loc_52_3 loc_53_3) (adjacent loc_53_3 loc_52_3)

    (clear loc_1_1) (clear loc_1_3)
    (clear loc_51_3) (clear loc_53_3)
  )

  (:goal
    (at_box box1 loc_51_3)
  )
)