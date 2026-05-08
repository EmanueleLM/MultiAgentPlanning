(define (problem sokoban-instance)
    (:domain sokoban)
    (:objects 
        c0 c1 c2 c3 - cell
    )
    (:init 
        (player_at c3)
        (box_at c2)
        (goal_at c1)
        
        (wall_at c0)
        (wall_at c3)
        
        (adjacent c1 c2)
        (adjacent c2 c1)
        (adjacent c2 c3)
        (adjacent c3 c2)
    )
    (:goal (and (box_at c1)))
)