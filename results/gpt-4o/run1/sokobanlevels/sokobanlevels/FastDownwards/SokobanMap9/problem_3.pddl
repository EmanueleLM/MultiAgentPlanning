(define (problem sokoban-instance)
  (:domain sokoban)
  (:objects 
    player - agent
    box - item
    loc_1_2 loc_1_3 loc_2_1 loc_2_2 loc_2_3 loc_3_2 loc_3_3 loc_45_2 loc_46_2 loc_94_2 - location
  )
  
  (:init 
    (at player loc_2_2)
    (box_at box loc_45_2)
    (goal_at loc_94_2)
    
    (clear loc_1_2) (clear loc_1_3) (clear loc_2_1) (clear loc_2_3)
    (clear loc_3_2) (clear loc_3_3) (clear loc_46_2) (clear loc_94_2)
    
    (adjacent loc_2_2 loc_3_2) (adjacent loc_3_2 loc_2_2)
    (adjacent loc_3_2 loc_45_2) (adjacent loc_45_2 loc_3_2)
    (adjacent loc_45_2 loc_46_2) (adjacent loc_46_2 loc_45_2)
    (adjacent loc_45_2 loc_94_2) (adjacent loc_94_2 loc_45_2)
  )
  
  (:goal 
    (box_at box loc_94_2)
  )
)