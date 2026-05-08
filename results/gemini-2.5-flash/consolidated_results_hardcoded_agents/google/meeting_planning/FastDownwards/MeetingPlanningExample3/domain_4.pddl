(define (domain MeetingPlanning21)
    (:requirements :durative-actions :typing :fluents :negative-preconditions)
    (:types location)
    (:predicates
        (at ?l - location) ; Traveler location
        (met-barbara) ; Goal state achieved
    )
    (:functions
        (current-time) ; Time in minutes relative to 9:00 AM (T=0)
    )

    ;; Barbara is available until 11:30 AM. Since the meeting duration is 90 minutes, 
    ;; the meeting must start no later than T=150 - 90 = 60 minutes (10:00 AM).

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
            (at end (increase (current-time) ?duration))
        )
    )

    ;; 2. Meeting Action (Duration exactly 90 minutes)
    (:durative-action meet-barbara-90min
        :parameters ()
        :duration (= ?duration 90)
        :condition (and
            (at start (at ggp))
            (at start (not (met-barbara)))
            ;; Strict temporal constraint: Meeting must start by T=60 (10:00 AM) to end by 11:30 AM (T=150)
            (at start (<= (current-time) 60)) 
        )
        :effect (and
            (at end (increase (current-time) ?duration))
            (at end (met-barbara)) 
        )
    )
    
    ;; 3. Return Travel (GGP -> Bayview, 23 minutes) - Included for completeness, though not required for the goal.
    (:durative-action travel-ggp-to-b
        :parameters ()
        :duration (= ?duration 23)
        :condition (and
            (at start (at ggp))
        )
        :effect (and
            (at start (not (at ggp)))
            (at end (at bayview))
            (at end (increase (current-time) ?duration))
        )
    )
)