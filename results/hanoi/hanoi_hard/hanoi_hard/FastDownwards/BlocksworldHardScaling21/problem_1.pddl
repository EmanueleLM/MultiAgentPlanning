(define (problem BlocksworldHardScaling21)
    (:domain blocksworld)
    (:objects 
        red blue orange yellow - block
    )
    (:init
        (= (total-cost) 0)
        (hand-empty)
        (clear red)
        (on red blue)
        (on blue orange)
        (on orange yellow)
        (on-table yellow)
    )
    (:goal (and
        (on blue orange)
        (on orange yellow)
        (on yellow red)
        (on-table red)
    ))
    (:metric minimize (total-cost))
)