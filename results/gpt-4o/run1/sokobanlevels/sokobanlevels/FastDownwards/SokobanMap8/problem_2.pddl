(define (problem sokoban-instance)
  (:domain sokoban)
  (:objects
    player - player
    box0 - box
    cell_0_0 cell_0_1 cell_1_0 cell_1_1 cell_98_1 cell_99_1 - cell
    ; Add the grid continuously covering all necessary cells from initial player and box positions to goal
    cell_97_1 cell_96_1 cell_95_1 cell_94_1 cell_93_1 ; ... extend all necessary cells
  )
  
  (:init
    (at player cell_99_1)
    (at box0 cell_98_1)
    (goal cell_1_1)
    
    ; Clear cells leading up from player to box to goal
    (adjacent cell_99_1 cell_98_1)
    (adjacent cell_98_1 cell_99_1)
    (adjacent cell_98_1 cell_97_1) ; Connect continuously...
    (adjacent cell_97_1 cell_98_1)
    (adjacent cell_97_1 cell_96_1)
    (adjacent cell_96_1 cell_97_1)
    (adjacent cell_1_0 cell_1_1)
    (adjacent cell_1_1 cell_1_0)
    
    (clear cell_0_0)
    (clear cell_1_0)
    (clear cell_1_1)
    ; Make sure all cells on the way to the goal are clear except the player's and box's current position
  )
  
  (:goal
    (at box0 cell_1_1)
  )
)