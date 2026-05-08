(define (problem sokoban-instance)
    (:domain sokoban)
    (:objects 
        c00 c10 c20 c01 c11 c21 c02 c12 c22 - cell
    )
    (:init 
        (player_at c22)
        (box_at c21)
        (goal_at c01)
        
        (wall_at c00)
        (wall_at c02)
        (wall_at c20)
        (wall_at c22)
        
        (adjacent c00 c10)
        (adjacent c10 c20)
        (adjacent c01 c11)
        (adjacent c11 c21)
        (adjacent c02 c12)
        (adjacent c12 c22)
        
        (adjacent c00 c01)
        (adjacent c01 c02)
        (adjacent c10 c11)
        (adjacent c11 c12)
        (adjacent c20 c21)
        (adjacent c21 c22)
    )
    (:goal (and (box_at c01)))
)