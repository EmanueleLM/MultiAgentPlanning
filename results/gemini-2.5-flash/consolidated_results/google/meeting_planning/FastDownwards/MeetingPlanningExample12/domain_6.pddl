(define (domain meeting-scheduling-optimal)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types location)
    (:predicates
        (at ?l - location)
        (traveled_to_as)
        (ready_to_meet)
        (met_barbara)
    )
    (:functions
        (current-time)
        (meeting-duration)
        (total-cost)
    )

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