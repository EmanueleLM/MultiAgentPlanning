(define (problem MeetingPlanningExample9-P-STRIPS)
    (:domain meeting-planning)
    (:objects
        union-square nob-hill - location
    )
    (:init
        (at union-square) ; Start at 9:00 AM (T=540).
        (= (total-cost) 0) ; Time elapsed since T=540.
    )

    (:goal (and
        (meeting-done) ; Must meet Mary for at least 75 minutes
    ))

    ; Metric: Minimize the total time elapsed (total-cost), which corresponds to minimizing the absolute end time.
    (:metric minimize (total-cost))
)