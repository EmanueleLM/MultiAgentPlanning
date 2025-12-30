(define (problem MeetingPlanningExample29)
    (:domain MeetingPlanningExample29)
    (:objects
        sunset haight - location
        T540 T555 T1170 T1245 T1305 - time_point
    )
    (:init
        (at sunset)
        (ready_at T540) 
        (= (total-meeting-time) 0)
    )
    (:goal (and 
        (meeting_duration_satisfied) ; Hard requirement: Meet for at least 75 minutes
    ))
    (:metric maximize (total-meeting-time))
)