(define (domain meeting-planning)
    (:requirements :typing :durative-actions :fluents :action-costs)
    (:types
        location
    )
    (:predicates
        (at ?p - location)
        (met_barbara)
        (at_barbara ?l - location)
    )
    (:functions
        (current_time) ; Absolute time in minutes from midnight (0:00 AM)
        (total-cost)   ; Accumulates durations for cost minimization
    )

    (:durative-action travel_bayview_to_golden_gate_park)
        :parameters ()
        :duration (= ?duration 22) ; Travel duration 22 minutes
        :condition
            (and
                (at start (at bayview))
                ; Traveler arrives at Bayview at 9:00 AM (540 minutes from midnight)
                (at start (>= (current_time) 540))
                (at start (not (at_barbara bayview))) ; Barbara is not at Bayview
            )
        :effect
            (and
                (at start (not (at bayview)))
                (at end (at golden_gate_park))
                ; Update current_time and total-cost by the duration of the travel
                (at end (increase (current_time) 22))
                (at end (increase (total-cost) 22))
            )

    (:durative-action meet_barbara)
        :parameters ()
        :duration (= ?duration 90) ; Meeting duration 90 minutes
        :condition
            (and
                (at start (at golden_gate_park))
                (at start (not (met_barbara)))
                (at start (at_barbara golden_gate_park)) ; Barbara must be at Golden Gate Park
                ; Barbara is available from 8:00 AM (480 min)
                (at start (>= (current_time) 480))
                ; Barbara is available until 11:30 AM (690 min).
                ; The meeting must end at or before this time.
                (at end (<= (current_time) 690))
            )
        :effect
            (and
                (at end (met_barbara))
                ; Update current_time and total-cost by the duration of the meeting
                (at end (increase (current_time) 90))
                (at end (increase (total-cost) 90))
            )
)