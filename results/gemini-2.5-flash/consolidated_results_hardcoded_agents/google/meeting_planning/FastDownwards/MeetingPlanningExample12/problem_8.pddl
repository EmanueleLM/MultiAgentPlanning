(define (problem p-meeting-barbara)
    (:domain meeting-scheduling-optimal)
    (:objects
        north-beach alamo-square - location
    )
    (:init
        (at north-beach)
        (= (current-time) 0)
        (= (meeting-duration) 0)
        (= (total-cost) 0)
    )
    (:goal (and
        (met-barbara)
    ))
    (:metric minimize (total-cost))
)