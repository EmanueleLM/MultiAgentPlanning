(define (domain meeting-scheduling)
    (:requirements :strips :typing :durative-actions :action-costs :negative-preconditions)
    (:types location)
    (:predicates
        (at ?l - location)
        (met_barbara)
    )
    (:functions
        (current-time)
        (meeting-duration)
        (total-cost)
    )
    
    ;; Travel North Beach (NB) to Alamo Square (AS) (16 minutes)
    (:durative-action travel_NB_AS
        :parameters ()
        :duration (= ?duration 16)
        :condition (at start (at north_beach))
        :effect (and
            (at start (not (at north_beach)))
            (at end (at alamo_square))
            (at end (increase (current-time) 16))
            (at end (increase (total-cost) 16))
        )
    )

    ;; Travel Alamo Square (AS) to North Beach (NB) (15 minutes)
    (:durative-action travel_AS_NB
        :parameters ()
        :duration (= ?duration 15)
        :condition (at start (at alamo_square))
        :effect (and
            (at start (not (at alamo_square)))
            (at end (at north_beach))
            (at end (increase (current-time) 15))
            (at end (increase (total-cost) 15))
        )
    )
    
    ;; Meet Barbara (Minimum 90 minutes, Window: 360 to 510 minutes)
    (:durative-action meet_barbara
        :parameters ()
        :duration (>= ?duration 90)
        :condition (and
            (at start (at alamo_square))
            (at start (>= (current-time) 360)) ; Must start at or after 6:00 PM
            (at end (<= (current-time) 510))   ; Must finish at or before 9:30 PM
        )
        :effect (and
            (at end (increase (current-time) ?duration))
            (at end (increase (meeting-duration) ?duration))
            (at end (increase (total-cost) ?duration))
            (at end (met_barbara))
        )
    )

    ;; Wait action at North Beach
    (:durative-action wait_at_NB
        :parameters ()
        :duration (>= ?duration 1)
        :condition (at start (at north_beach))
        :effect (and
            (at end (increase (current-time) ?duration))
            (at end (increase (total-cost) ?duration))
        )
    )

    ;; Wait action at Alamo Square
    (:durative-action wait_at_AS
        :parameters ()
        :duration (>= ?duration 1)
        :condition (at start (at alamo_square))
        :effect (and
            (at end (increase (current-time) ?duration))
            (at end (increase (total-cost) ?duration))
        )
    )
)