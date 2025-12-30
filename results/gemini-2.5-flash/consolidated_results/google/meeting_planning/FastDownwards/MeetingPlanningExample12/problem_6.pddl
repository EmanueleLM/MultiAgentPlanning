(define (problem p_meeting_barbara)
    (:domain meeting-scheduling-optimal)
    (:objects
        north_beach alamo_square - location
    )
    (:init
        (at north_beach)
        (= (current-time) 0)
        (= (meeting-duration) 0)
        (= (total-cost) 0)
    )
    (:goal (and
        (met_barbara)
    ))
    (:metric minimize (total-cost))
)