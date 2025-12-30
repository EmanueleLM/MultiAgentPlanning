(define (problem meeting-schedule-6-instance)
    (:domain meeting-planning-6)
    (:objects
        fw - location ; Fisherman's Wharf
        nh - location ; Nob Hill
    )
    (:init
        ; Traveler starts at FW at 9:00 AM (T=0)
        (at fw)
        (= (total-time) 0)
    )
    (:goal (and
        (met_kenneth_90min)
    ))
    ; Minimize the time needed to achieve the goal, proving efficiency.
    (:metric minimize (total-time))
)