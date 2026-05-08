(define (problem sokoban-instance)
    (:domain sokoban)
    (:objects 
        p0 p1 p2 p3 p4 p5 - position
    )
    (:init 
        (player_at p5)
        (box_at p3)
        (goal_at p1)

        (wall_at p0)
        (wall_at p2)
        (wall_at p4)

        (adjacent p1 p3)
        (adjacent p3 p1)
        (adjacent p3 p5)
        (adjacent p5 p3)
    )
    (:goal (and (box_at p1)))
)