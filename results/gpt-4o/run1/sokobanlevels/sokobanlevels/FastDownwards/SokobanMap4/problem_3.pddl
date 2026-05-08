(define (problem sokoban-instance)
    (:domain sokoban)
    (:objects 
        c0 c1 c2 - cell
    )
    (:init 
        (player_at c2)
        (box_at c1)
        (goal_at c0)
        
        (wall_at c0)
        (wall_at c2)
        
        (adjacent c1 c0)
        (adjacent c1 c2)
        (adjacent c0 c1)
        (adjacent c2 c1)
    )
    (:goal (and (box_at c0)))
)