(define (problem sokoban-instance)
  (:domain sokoban)

  (:objects
    player-1 - player
    box-1 - box
    loc_1 loc_2 loc_3 loc_4 loc_5 loc_6 loc_7 loc_8 loc_9 loc_10
    loc_11 loc_12 loc_13 loc_14 loc_15 loc_16 loc_17 loc_18 loc_19 loc_20
    loc_21 loc_22 loc_23 loc_24 loc_25 loc_26 loc_27 loc_28 loc_29 loc_30
    loc_31 loc_32 loc_33 loc_34 loc_35 loc_36 loc_37 loc_38 loc_39 loc_40
    loc_41 loc_42 loc_43 loc_44 loc_45 loc_46 loc_47 loc_48 loc_49 loc_50 - grid_cell
  )

  (:init
    (at player-1 loc_1)
    (box-at box-1 loc_26)
    (goal-at loc_50)
    
    ;; Define adjacency based on the grid layout (simplified example)
    (adjacent loc_1 loc_2) (adjacent loc_2 loc_3) (adjacent loc_3 loc_4) 
    (adjacent loc_4 loc_5) (adjacent loc_5 loc_6) (adjacent loc_2 loc_7)
    ;; ... other adjacencies based on grid, omitting for brevity
    
    ;; Define free locations excluding walls
    (free loc_1) (free loc_2) (free loc_3)
    (free loc_4) (free loc_5) (free loc_6)
    ;; ... other free locations based on grid
    
  )

  (:goal
    (box-at box-1 loc_50)
  )
)