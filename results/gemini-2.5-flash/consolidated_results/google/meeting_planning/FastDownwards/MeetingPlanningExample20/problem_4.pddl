(define (problem meeting_scheduling_20)
    (:domain meeting_scheduler)
    (:objects
        me - person
        joseph - person
    )
    (:init
        ; Initial location (T=0, 9:00 AM)
        (at me CHINATOWN)

        ; Time and Duration Initialization
        (current-time-state T0)
        (current-duration D0)
        
        ; Status tracking
        (not (joseph-available)) 
        (not (meeting-active))
        (not (goal-met))

        (= (total-cost) 0)
    )
    (:goal (and
        (goal-met)
    ))
    (:metric minimize (total-cost))
)