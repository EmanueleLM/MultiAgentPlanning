(define (problem p_meeting_barbara)
    (:domain meeting-scheduling-optimal)
    (:objects
        north_beach alamo_square - location
        s0 s1 s2 - stage ; s0: Initial, s1: Arrived/Waiting, s2: Meeting Done
    )
    (:init
        (at north_beach)
        (current-stage s0)
        (= (current-time) 0) ; Starting at 9:00 AM
        (= (meeting-duration) 0)
        (= (total-cost) 0)
    )
    (:goal (and
        (met_barbara)
    ))
    (:metric minimize (total-cost))
)