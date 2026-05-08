(define (domain meeting-planning)
    (:requirements :typing :durative-actions :fluents :negative-preconditions)
    (:types location)
    (:predicates
        (at ?p - location)
        (met_barbara)
    )
    (:functions
        (current_time) ; Represents time in minutes past midnight
    )

    (:durative-action travel-bayview-to-golden-gate-park)
        :parameters ()
        :duration (= ?duration 22)
        :condition
            (at start (at bayview))
        :effect
            (at start (not (at bayview)))
            (at end (at golden-gate-park))
            (at end (increase (current_time) 22))

    (:durative-action travel-golden-gate-park-to-bayview)
        :parameters ()
        :duration (= ?duration 23)
        :condition
            (at start (at golden-gate-park))
        :effect
            (at start (not (at golden-gate-park)))
            (at end (at bayview))
            (at end (increase (current_time) 23))

    (:durative-action meet-barbara)
        :parameters ()
        :duration (= ?duration 90) ; Minimum meeting duration is 90 minutes
        :condition
            (and
                (at start (at golden-gate-park))
                (at start (not (met_barbara)))
                ; Barbara is available from 8:00 AM (480 min)
                (at start (>= (current_time) 480))
                ; Meeting must end by 11:30 AM (690 min)
                ; FastDownwards evaluates (current_time) at 'at end' after 'increase' has applied,
                ; so this effectively checks (+ (current_time at start) ?duration <= 690)
                (at end (<= (current_time) 690))
            )
        :effect
            (and
                (at end (met_barbara))
                (at end (increase (current_time) 90))
            )
)