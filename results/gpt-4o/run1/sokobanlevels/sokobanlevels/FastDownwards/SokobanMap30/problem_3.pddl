(define (problem sokoban-instance)
  (:domain sokoban)
  (:objects
    cell_1 cell_2 cell_3 cell_4 cell_5
    cell_6 cell_7 cell_8 cell_9 cell_10
    cell_11 cell_12 cell_13 cell_14 cell_15
    cell_16 cell_17 cell_18 cell_19 cell_20
    cell_21 cell_22 cell_23 cell_24 cell_25
    - wall
    player - player
    box - box
  )
  (:init
    (at-player cell_11)
    (at-box cell_6)
    (goal cell_1)
    (free cell_2) (free cell_3) (free cell_4) (free cell_5)
    (free cell_7) (free cell_8) (free cell_9) (free cell_10)
    (free cell_12) (free cell_13) (free cell_14) (free cell_15)
    (free cell_16) (free cell_17) (free cell_18) (free cell_19)
    (free cell_20) (free cell_21) (free cell_22) (free cell_23) 
    (free cell_24) (free cell_25)
    (adjacent cell_11 cell_6) (adjacent cell_6 cell_11)
    (adjacent cell_6 cell_1) (adjacent cell_1 cell_6)
  )
  (:goal
    (at-box cell_1)
  )
)