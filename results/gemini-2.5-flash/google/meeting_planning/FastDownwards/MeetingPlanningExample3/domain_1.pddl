(define (domain meeting-planning)
    (:requirements :typing :durative-actions :action-costs :fluents :negative-preconditions)
    (:types location)
    (:predicates
        (at ?p - location)
        (met_barbara)
    )
    (:fluents
        (current_time)
        (total_travel_time)
        (total-cost)
    )

    (:durative-action travel-bayview-to-ggp)
        :parameters ()
        :duration (= ?duration 22)
        :condition
            (and
                (at start (at bayview))
            )
        :effect
            (and
                (at start (not (at bayview)))
                (at end (at golden-gate-park))
                (at end (increase (current_time) 22))
                (at end (increase (total-cost) 22))
                (at end (increase (total_travel_time) 22))
            )

    (:durative-action travel-ggp-to-bayview)
        :parameters ()
        :duration (= ?duration 23)
        :condition
            (and
                (at start (at golden-gate-park))
            )
        :effect
            (and
                (at start (not (at golden-gate-park)))
                (at end (at bayview))
                (at end (increase (current_time) 23))
                (at end (increase (total-cost) 23))
                (at end (increase (total_travel_time) 23))
            )

    (:durative-action meet-barbara)
        :parameters ()
        :duration (= ?duration 90)
        :condition
            (and
                (at start (at golden-gate-park))
                (at start (not (met_barbara)))
                ; Barbara's availability: 8:00 AM (480 minutes from 00:00) to 11:30 AM (690 minutes)
                ; Meeting duration: 90 minutes
                ; Therefore, meeting must START by (690 - 90) = 600 minutes (10:00 AM) to end within her availability.
                ; Traveler arrives at Bayview at 9:00 AM (540 minutes).
                ; Travel Bayview to GGP takes 22 minutes.
                ; Earliest arrival at Golden Gate Park is 540 + 22 = 562 minutes (9:22 AM).
                (at start (>= (current_time) 562)) ; Earliest possible meeting start time
                (at start (<= (current_time) 600)) ; Latest possible meeting start time
            )
        :effect
            (and
                (at end (met_barbara))
                (at end (increase (current_time) 90))
            )
)