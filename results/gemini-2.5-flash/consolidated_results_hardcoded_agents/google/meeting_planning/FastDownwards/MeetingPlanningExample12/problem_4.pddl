(define (problem p_meeting_barbara)
    (:domain meeting-scheduling-optimal)
    (:objects
        north_beach alamo_square - location
    )
    (:init
        (at north_beach)
        (= (current-time) 0) ; Starting at 9:00 AM
        (= (meeting-duration) 0)
        (= (total-cost) 0)
        (not (traveled_to_as))
        (not (ready_to_meet))
        (not (met_barbara))
    )
    (:goal (and
        (met_barbara)
    ))
    (:metric minimize (total-cost))
)