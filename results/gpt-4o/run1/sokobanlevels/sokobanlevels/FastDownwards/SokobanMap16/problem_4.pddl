(define (problem sokoban_problem)
    (:domain sokoban)
    (:objects
        player1 - player
        box1 - box
        goal1 - goal
        loc1 loc2 loc3 loc4 loc5 - location
    )
    (:init
        (at_player loc4)
        (at_box box1 loc3)
        (goal loc2)
        (adjacent loc1 loc2)
        (adjacent loc2 loc1)
        (adjacent loc2 loc3)
        (adjacent loc3 loc2)
        (adjacent loc3 loc4)
        (adjacent loc4 loc3)
        (adjacent loc4 loc5)
        (adjacent loc5 loc4)
    )
    (:goal (at_box box1 loc2))
)