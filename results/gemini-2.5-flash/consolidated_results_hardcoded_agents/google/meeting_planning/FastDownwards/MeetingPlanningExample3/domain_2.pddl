(define (domain MeetingPlanning21)
    (:requirements :durative-actions :typing :fluents :action-costs :negative-preconditions)
    (:types location)
    (:predicates
        (at ?l - location) ; Traveler location
        (met-barbara)
    )
    (:functions
        (total-time) ; Tracks elapsed time in minutes from T=0 (9:00 AM)
    )

    ;; 1. Travel Action (Bayview -> GGP, Duration 22 minutes)
    (:durative-action travel-b-to-ggp
        :parameters ()
        :duration (= ?duration 22)
        :condition (and
            (at start (at bayview))
        )
        :effect (and
            (at start (not (at bayview)))
            (at end (at ggp))
            (increase (total-time) 22)
        )
    )

    ;; 2. Meeting Action (Duration exactly 90 minutes)
    (:durative-action meet-barbara-90min
        :parameters ()
        :duration (= ?duration 90)
        :condition (and
            (at start (at ggp))
            ;; Must start after arrival (T >= 22)
            (at start (>= (total-time) 22))
            ;; Must end by 11:30 AM (T_end <= 150). This implicitly enforces T_start <= 60.
            (at end (<= (total-time) 150))
        )
        :effect (and
            (at end (met-barbara))
            (increase (total-time) 90)
        )
    )
)