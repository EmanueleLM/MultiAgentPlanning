(define (domain meeting-planning-temporal)
    (:requirements :typing :durative-actions :action-costs)
    (:types
        person location friend - object
    )
    (:constants
        md rd - location
    )
    (:predicates
        (at ?p - person ?l - location)
        (available ?f - friend ?l - location)
        (met ?f - friend)
        (betty-ready-to-meet) ; Marker that travel to RD is complete and we are ready for the Betty meeting
    )
    (:functions
        (total-meetings)
        (time-elapsed) ; Absolute time in minutes from 9:00 AM (T=0)
    )

    ;; 1. Meeting Friend Alpha (Hypothetical friend at MD, maximizes use of early time)
    (:durative-action meet_alpha
        :parameters (?p - person ?f - friend)
        :duration (?d)
        :condition (and 
            (at start (at ?p md))
            (at start (available ?f md))
            (over all (not (met ?f))) ; Can only meet once
        )
        :effect (and
            (at end (met ?f))
            (at end (increase (total-meetings) 1))
            (at end (increase (time-elapsed) ?d))
        )
    )
    
    ;; 2. Waiting (used to consume time or bridge gaps at MD)
    ;; Ensures time consumption if meet_alpha ends early, necessary to reach T=694 for optimal departure.
    (:durative-action wait
        :parameters (?p - person ?l - location)
        :duration (?d)
        :condition (at start (at ?p ?l))
        :effect (and
            (at end (increase (time-elapsed) ?d))
        )
    )

    ;; 3. Travel MD -> RD (11 minutes)
    ;; Must start no later than T=694 (8:34 PM) to arrive by T=705 (8:45 PM), which is the latest legal start time for Betty's 75-minute meeting ending at 10:00 PM (T=780).
    (:durative-action travel_md_rd
        :parameters (?p - person)
        :duration (= ?d 11)
        :condition (and
            (at start (at ?p md))
            (at start (<= (time-elapsed) 694)) ; Hard limit on start time
        )
        :effect (and
            (at start (not (at ?p md)))
            (at end (at ?p rd))
            (at end (increase (time-elapsed) 11))
            (at end (betty-ready-to-meet)) 
        )
    )

    ;; 4. Meeting Betty (Fixed 75 minutes duration required)
    ;; Must start exactly when optimal travel ends (T=705).
    (:durative-action meet_betty
        :parameters (?p - person ?f - friend)
        :duration (= ?d 75)
        :condition (and
            (at start (at ?p rd))
            (at start (available ?f rd))
            (at start (betty-ready-to-meet))
            (at start (not (met ?f)))
            ; Enforce start time to maximize pre-meeting utility and meet the deadline (T=705 + 75 = T=780)
            (at start (= (time-elapsed) 705)) 
        )
        :effect (and
            (at end (met ?f))
            (at end (increase (total-meetings) 1))
            (at end (increase (time-elapsed) 75))
            (at start (not (betty-ready-to-meet))) ; Consume the readiness state
        )
    )
    
    ;; 5. Travel RD -> MD (9 minutes) - General action, optional finish
    (:durative-action travel_rd_md
        :parameters (?p - person)
        :duration (= ?d 9)
        :condition (at start (at ?p rd))
        :effect (and
            (at start (not (at ?p rd)))
            (at end (at ?p md))
            (at end (increase (time-elapsed) 9))
        )
    )
)