(define (problem meeting-schedule-6-instance)
    (:domain meeting-planning-6)
    (:objects
        fw - location
        nh - location
    )
    (:init
        ; Traveler starts at FW at 9:00 AM (T=0)
        (at fw)
        (= (total-time) 0)
    )
    (:goal (and
        (met_kenneth_90min)
    ))
    ; Minimize the time needed to achieve the goal, which proves the schedule's efficiency.
    (:metric minimize (total-time))
)