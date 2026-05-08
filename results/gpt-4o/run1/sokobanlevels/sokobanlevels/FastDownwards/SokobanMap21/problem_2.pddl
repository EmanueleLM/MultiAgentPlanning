(define (problem sokoban_problem)
    (:domain sokoban)
    (:objects
        player_1 - player
        box_1 - box
        l_0_0 l_0_1 l_0_2
        l_1_0 l_1_1 l_1_2
        l_2_0 l_2_1 l_2_2
        l_3_0 l_3_1 l_3_2
    )
    (:init
        (at player_1 l_1_1)
        (box_at box_1 l_4_1)
        (goal l_5_1)
        (adjacent l_1_1 l_0_1) (adjacent l_0_1 l_1_1)
        (adjacent l_1_1 l_1_2) (adjacent l_1_2 l_1_1)
        (adjacent l_1_1 l_2_1) (adjacent l_2_1 l_1_1)
        (adjacent l_1_0 l_1_1) (adjacent l_1_1 l_1_0)
        (clear l_0_2) (clear l_1_0) (clear l_1_2)
        (clear l_2_0) (clear l_2_1) (clear l_2_2)
        (clear l_3_0) (clear l_3_2) (clear l_4_0)
        (clear l_4_2) (clear l_5_0) (clear l_5_2)
        (clear l_6_0) (clear l_6_1) (clear l_6_2)
    )
    (:goal (box_at box_1 l_5_1))
)