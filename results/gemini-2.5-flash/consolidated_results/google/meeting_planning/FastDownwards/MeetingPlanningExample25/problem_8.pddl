(define (problem meeting-schedule-25)
    (:domain meeting-planning-classical)
    (:objects)
    (:init
        ; Agent starts at GGP at 9:00 AM (T=540)
        (at GGP)
        (t-540) 
    )
    (:goal
        (and
            (met-minimum-duration)
            (t-1305) ; Ensure the meeting stage is completed (9:45 PM)
        )
    )
)