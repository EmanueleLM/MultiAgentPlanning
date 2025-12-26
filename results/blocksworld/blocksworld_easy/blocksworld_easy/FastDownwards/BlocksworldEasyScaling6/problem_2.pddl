(define (problem blocksworld-scaling6)
    (:domain blocksworld)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:objects
        Orange - block
        Yellow - block
        Blue - block
        Red - block
    )
    (:init
        (handempty)
        (clear Orange)
        (clear Yellow)
        (on Orange Blue)
        (on Blue Red)
        (ontable Red)
        (ontable Yellow)
        (= (total-cost) 0)
    )
    (:goal (on Orange Yellow))
    (:metric minimize (total-cost))
)