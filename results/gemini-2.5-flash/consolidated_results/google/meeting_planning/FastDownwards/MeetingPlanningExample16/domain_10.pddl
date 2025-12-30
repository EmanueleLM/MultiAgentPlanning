(define (domain meeting-planning-temporal)
    (:requirements :durative-actions :typing :fluents :action-costs :negative-preconditions)

    (:types 
        location
    )

    (:predicates
        (at ?l - location)
        (ready_to_meet) ; True when time >= 375 minutes (3:15 PM) AND at RH
    )
    
    (:functions
        (current_time) ; Tracks time elapsed since 9:00 AM (T=0)
        (meeting_duration) ; The duration spent meeting Ronald
        (min_meeting_required) ; 105 minutes hard requirement
    )

    ; Travel time C -> RH = 7 minutes
    (:durative-action travel_c_rh
        :parameters ()
        :duration (= ?duration 7)
        :condition (and 
            (at start (at chinatown))
            (at start (= (current_time) 0))
        )
        :effect (and
            (at start (not (at chinatown)))
            (at end (at russian_hill))
            (at end (increase (current_time) 7))
        )
    )

    ; Wait until Ronald is available (T=375). Duration required: 368 minutes (375 - 7).
    (:durative-action wait_until_ready
        :parameters ()
        :duration (= ?duration 368)
        :condition (and
            (at start (at russian_hill))
            (at start (= (current_time) 7)) 
            (over all (not (ready_to_meet)))
        )
        :effect (and
            (at end (ready_to_meet))
            (at end (increase (current_time) 368)) ; current_time becomes 375
        )
    )

    ; Meet Ronald (Must be continuous, variable duration D > 0)
    ; Must start exactly at T=375. Must end <= T=750 (9:30 PM).
    (:durative-action meet_ronald
        :parameters ()
        :duration (> ?duration 0)
        :condition (and 
            (over all (at russian_hill))
            (over all (ready_to_meet))
            ; Must start exactly when ready
            (at start (= (current_time) 375)) 
            ; Hard deadline constraint: 750 minutes (9:30 PM)
            (at end (<= (current_time) 750))
        )
        :effect (and
            (at end (increase (meeting_duration) ?duration))
            (at end (increase (current_time) ?duration))
        )
    )

    ; Travel time RH -> C = 9 minutes
    (:durative-action travel_rh_c
        :parameters ()
        :duration (= ?duration 9)
        :condition (and 
            (at start (at russian_hill))
            ; Minimum duration must be met before starting travel back
            (at start (>= (meeting_duration) (min_meeting_required)))
            ; Travel must start immediately after the meeting phase
            (at start (>= (current_time) 375)) 
        )
        :effect (and
            (at start (not (at russian_hill)))
            (at end (at chinatown))
            (at end (increase (current_time) 9))
        )
    )
)