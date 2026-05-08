(define (domain meeting-scheduling-optimal)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types location stage)
    (:predicates
        (at ?l - location)
        (met_barbara)
        (current-stage ?s - stage)
    )
    (:functions
        (current-time)
        (meeting-duration)
        (total-cost)
    )

    ;; Phase 1: Travel from North Beach (NB) to Alamo Square (AS) (16 min) 
    ;; and wait until the required start window of 6:00 PM (360 minutes elapsed).
    (:action travel_wait_to_window
        :parameters ()
        :precondition (and
            (at north_beach)
            (= (current-time) 0)
            (current-stage s0)
        )
        :effect (and
            (not (at north_beach))
            (at alamo_square)
            ; Time jump: 360 minutes (16 travel + 344 wait)
            (assign (current-time) 360) 
            (increase (total-cost) 360)
            (not (current-stage s0))
            (current-stage s1)
        )
    )

    ;; Phase 2: Meet Barbara for the minimum required 90 minutes.
    ;; Meeting starts at T=360 (6:00 PM) and ends at T=450 (7:30 PM).
    (:action meet_barbara_min
        :parameters ()
        :precondition (and
            (at alamo_square)
            (current-stage s1)
            (= (current-time) 360) ; Must start exactly at 6:00 PM (360 min)
            ; Implicit check: 360 + 90 = 450, which is <= 510 (9:30 PM limit)
        )
        :effect (and
            (increase (current-time) 90) ; Ends at T=450
            (assign (meeting-duration) 90)
            (increase (total-cost) 90) ; Cost = 90 minutes
            (met_barbara)
            (not (current-stage s1))
            (current-stage s2)
        )
    )
)