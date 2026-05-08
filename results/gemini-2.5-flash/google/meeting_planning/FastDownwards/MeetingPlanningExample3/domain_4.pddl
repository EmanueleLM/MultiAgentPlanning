(define (domain meeting-planning)
    (:requirements :typing :negative-preconditions :action-costs)
    (:types
        location
        time-point
    )
    (:predicates
        (at ?p - location)
        (current-time ?t - time-point)
        (met-barbara)
        (has-travelled-b-ggp)
        (is-available-for-meeting ?t - time-point)
        (meeting-ends-by-barbara-limit ?t_start ?t_end - time-point)
    )
    (:functions
        (total-cost)
    )

    (:action travel-bayview-to-golden-gate-park)
        :parameters ()
        :precondition
            (and
                (at bayview)
                (current-time t-9-00am)
                (not (has-travelled-b-ggp))
            )
        :effect
            (and
                (not (at bayview))
                (at golden-gate-park)
                (not (current-time t-9-00am))
                (current-time t-9-22am)
                (has-travelled-b-ggp)
                (increase (total-cost) 22) ; Travel duration 22 minutes
            )

    (:action wait-for-latest-meeting-start)
        :parameters ()
        :precondition
            (and
                (at golden-gate-park)
                (current-time t-9-22am)
                (not (met-barbara))
            )
        :effect
            (and
                (not (current-time t-9-22am))
                (current-time t-10-00am)
                (increase (total-cost) 38) ; Waiting duration from 9:22 AM to 10:00 AM (38 minutes)
            )

    (:action start-and-end-meeting-at-earliest-time)
        :parameters ()
        :precondition
            (and
                (at golden-gate-park)
                (current-time t-9-22am)
                (not (met-barbara))
                (is-available-for-meeting t-9-22am)
                (meeting-ends-by-barbara-limit t-9-22am t-10-52am)
            )
        :effect
            (and
                (met-barbara)
                (not (current-time t-9-22am))
                (current-time t-10-52am)
                (increase (total-cost) 90) ; Meeting duration 90 minutes
            )

    (:action start-and-end-meeting-at-latest-time)
        :parameters ()
        :precondition
            (and
                (at golden-gate-park)
                (current-time t-10-00am)
                (not (met-barbara))
                (is-available-for-meeting t-10-00am)
                (meeting-ends-by-barbara-limit t-10-00am t-11-30am)
            )
        :effect
            (and
                (met-barbara)
                (not (current-time t-10-00am))
                (current-time t-11-30am)
                (increase (total-cost) 90) ; Meeting duration 90 minutes
            )
)