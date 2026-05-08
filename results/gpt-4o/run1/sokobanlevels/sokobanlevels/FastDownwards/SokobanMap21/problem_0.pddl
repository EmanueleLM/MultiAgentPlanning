(define (problem sokoban_problem)
    (:domain sokoban)
    (:objects
        player_1 - player
        box_1 - box
        goal_1 - goal
        l_0_0 l_0_1 l_0_2 l_1_0 l_1_1 l_1_2 l_2_0 l_2_1 l_2_2 - location
    )
    (:init
        (at_player player_1 l_1_1)
        (at_box box_1 l_51_1)
        (goal_location goal_1 l_101_1)
        (clear l_0_1) (clear l_0_2) (clear l_1_0) (clear l_1_2) 
        (clear l_2_0) (clear l_2_1) (clear l_2_2)
        (adjacent l_0_1 l_1_1) (adjacent l_1_1 l_0_1)
        (adjacent l_1_1 l_1_2) (adjacent l_1_2 l_1_1)
        (adjacent l_1_1 l_2_1) (adjacent l_2_1 l_1_1)
        (adjacent l_1_0 l_1_1) (adjacent l_1_1 l_1_0)
    )
    (:goal
        (at_box box_1 l_101_1)
    )
)