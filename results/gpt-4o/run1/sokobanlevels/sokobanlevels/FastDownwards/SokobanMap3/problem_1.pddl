(define (problem sokoban-problem)
    (:domain sokoban)
    (:objects
        player - entity
        box1 - entity
        pos_r1_c1 pos_r2_c1 pos_r49_c1 pos_r50_c1 pos_r50_c2 pos_r50_c3 pos_r51_c2 pos_r51_c3 pos_r52_c2 - cell
    )
    (:init
        (is-player player)
        (is-box box1)
        (at player pos_r2_c1)
        (at box1 pos_r50_c3)
        (is-goal pos_r50_c2)
        (adjacent pos_r1_c1 pos_r2_c1)
        (adjacent pos_r2_c1 pos_r49_c1)
        (adjacent pos_r49_c1 pos_r50_c1)
        (adjacent pos_r50_c1 pos_r50_c2)
        (adjacent pos_r50_c2 pos_r50_c3)
        (adjacent pos_r51_c2 pos_r50_c3)
        (adjacent pos_r51_c3 pos_r51_c2)
        (adjacent pos_r52_c2 pos_r51_c2)
        (clear pos_r1_c1)
        (clear pos_r49_c1)
        (clear pos_r50_c1)
        (clear pos_r50_c2)
        (clear pos_r51_c2)
        (clear pos_r51_c3)
        (clear pos_r52_c2)
    )
    (:goal
        (on-goal box1)
    )
)