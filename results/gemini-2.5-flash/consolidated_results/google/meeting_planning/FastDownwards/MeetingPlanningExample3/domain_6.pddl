(define (domain MeetingPlanning2_1)
    (:requirements :durative-actions :typing :fluents :negative-preconditions)
    (:types location)
    
    (:predicates
        (at ?l - location) ; Traveler location
        (meeting-achieved) ; Goal state achieved: Barbara met for 90 minutes
    )
    
    (:functions
        (current-time) ; Time elapsed since 9:00 AM (T=0), in minutes
    )

    ;; 1. Travel from Bayview to Golden Gate Park (Duration 22 min)
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

    ;; 2. Meet Barbara for 90 minutes at GGP
    ;; T_start must be <= 60 minutes to ensure meeting ends by T=150 (11:30 AM).
    (:durative-action meet-barbara
        :parameters ()
        :duration (= ?duration 90)
        :condition (and
            (at start (at ggp))
            (at start (not (meeting-achieved)))
            
            ;; Hard temporal constraint: Must start before T=60 (10:00 AM)
            (at start (<= (current-time) 60)) 
            
            ;; Enforce contiguous occupancy at GGP during the meeting
            (over all (at ggp))
        )
        :effect (and
            (at end (increase (current-time) ?duration))
            (at end (meeting-achieved))
        )
    )
    
    ;; 3. Return Travel (GGP -> Bayview, 23 minutes)
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