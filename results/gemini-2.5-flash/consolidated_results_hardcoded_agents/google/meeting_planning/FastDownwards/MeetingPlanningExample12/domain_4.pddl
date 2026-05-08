(define (domain meeting-scheduling-optimal)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types location)
    (:predicates
        (at ?l - location)
        (traveled_to_as)
        (ready_to_meet) ; True when T=360 (6:00 PM)
        (met_barbara)
    )
    (:functions
        (current-time)
        (meeting-duration)
        (total-cost)
    )

    ;; Action 1: Travel from North Beach (NB) to Alamo Square (AS). Duration 16 min. T=0 -> T=16.
    (:action travel_nb_to_as
        :parameters ()
        :precondition (and
            (at north_beach)
            (not (traveled_to_as))
        )
        :effect (and
            (not (at north_beach))
            (at alamo_square)
            (traveled_to_as)
            (increase (current-time) 16)
            (increase (total-cost) 16)
        )
    )

    ;; Action 2: Wait until the required start window (6:00 PM, T=360). 
    ;; Wait duration: 360 - 16 = 344 minutes. T=16 -> T=360.
    (:action wait_for_meeting_window
        :parameters ()
        :precondition (and
            (at alamo_square)
            (traveled_to_as)
            (not (ready_to_meet))
        )
        :effect (and
            (ready_to_meet)
            (increase (current-time) 344)
            (increase (total-cost) 344)
        )
    )

    ;; Action 3: Meet Barbara for the minimum required 90 minutes. T=360 -> T=450.
    (:action meet_barbara_for_90_minutes
        :parameters ()
        :precondition (and
            (at alamo_square)
            (ready_to_meet)
            (not (met_barbara))
        )
        :effect (and
            (met_barbara)
            (assign (meeting-duration) 90)
            (increase (current-time) 90)
            (increase (total-cost) 90)
        )
    )
)