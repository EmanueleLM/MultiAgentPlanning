(define (problem meeting-schedule-25)
    (:domain meeting-planning-classical)
    (:objects)
    (:init
        ; Agent starts at GGP at 9:00 AM (T=540)
        (at GGP)
        (t-540) 

        ; Initial cost fluent for metric
        (= (meeting-cost) 0)
    )
    (:goal
        (and
            (met-minimum-duration)
            (t-1305) ; Ensure the meeting stage is completed
        )
    )
    (:metric minimize (meeting-cost))
)