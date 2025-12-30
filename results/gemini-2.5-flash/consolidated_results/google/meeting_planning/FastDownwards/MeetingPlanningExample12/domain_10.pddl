(define (domain meeting-scheduling-optimal)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types location)
    (:predicates
        (at ?l - location)
        (ready-to-meet)
        (met-barbara)
        (traveled-to-as)
    )
    (:functions
        (current-time)
        (meeting-duration)
        (total-cost)
    )

    (:action travel-nb-to-as
        :parameters ()
        :precondition (and
            (at north-beach)
            (not (traveled-to-as))
        )
        :effect (and
            (not (at north-beach))
            (at alamo-square)
            (traveled-to-as)
            (increase (current-time) 16)
            (increase (total-cost) 16)
        )
    )

    (:action travel-as-to-nb
        :parameters ()
        :precondition (and
            (at alamo-square)
            ;; Only allowed to travel back after meeting Barbara
            (met-barbara)
        )
        :effect (and
            (not (at alamo-square))
            (at north-beach)
            (increase (current-time) 15)
            (increase (total-cost) 15)
        )
    )

    (:action wait-for-meeting-window
        :parameters ()
        :precondition (and
            (at alamo-square)
            (traveled-to-as)
            (not (ready-to-meet))
        )
        :effect (and
            (ready-to-meet)
            ;; Wait from T=16 (arrival) to T=360 (6:00 PM start) = 344 minutes
            (increase (current-time) 344)
            (increase (total-cost) 344)
        )
    )

    (:action meet-barbara
        :parameters ()
        :precondition (and
            (at alamo-square)
            (ready-to-meet)
            (not (met-barbara))
        )
        :effect (and
            (met-barbara)
            ;; Satisfy minimum 90 minutes requirement
            (increase (meeting-duration) 90)
            (increase (current-time) 90)
            (increase (total-cost) 90)
        )
    )
)