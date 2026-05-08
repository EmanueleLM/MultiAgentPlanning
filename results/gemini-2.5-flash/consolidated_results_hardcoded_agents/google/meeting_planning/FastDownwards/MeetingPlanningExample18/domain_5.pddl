(define (domain meeting-planning)
    (:requirements :strips :typing :negative-preconditions :durative-actions :fluents :action-costs)
    (:types
        person location friend - object
    )
    (:predicates
        (at ?p - person ?l - location)
        (available ?f - friend ?l - location)
        (met ?f - friend)
    )
    (:functions
        (time-elapsed) ; Tracks time in minutes from 9:00 AM (0)
        (total-cost) ; Cost fluent, tracks elapsed time (minutes)
        (total-meetings) ; Optimization goal fluent
    )

    ;; --- Travel Actions ---

    ; Travel MD -> RD (Duration 11 min)
    (:durative-action travel_md_rd
        :parameters (?p - person)
        :duration (= ?duration 11)
        :condition (and 
            (at start (at ?p md))
        )
        :effect (and 
            (at start (not (at ?p md))) 
            (at end (at ?p rd))
            (at end (increase (time-elapsed) ?duration))
            (at end (increase (total-cost) ?duration))
        )
    )
    
    ; Travel RD -> MD (Duration 9 min)
    (:durative-action travel_rd_md
        :parameters (?p - person)
        :duration (= ?duration 9)
        :condition (and 
            (at start (at ?p rd))
        )
        :effect (and 
            (at start (not (at ?p rd))) 
            (at end (at ?p md))
            (at end (increase (time-elapsed) ?duration))
            (at end (increase (total-cost) ?duration))
        )
    )

    ;; --- Waiting Action (To pass time before constraint window) ---
    ; This allows flexible time passage anywhere.
    (:durative-action wait
        :parameters (?p - person ?l - location)
        :duration (and (>= ?duration 1))
        :condition (and 
            (at start (at ?p ?l))
        )
        :effect (and
            (at end (increase (time-elapsed) ?duration))
            (at end (increase (total-cost) ?duration))
        )
    )

    ;; --- Meeting Action ---
    ; Betty: Min 75 min duration. Available 8:30 PM (690 min) to 10:00 PM (780 min).
    (:durative-action meet_betty
        :parameters (?p - person ?f - friend ?l - location)
        :duration (and (>= ?duration 75)) ; Minimum 75 minutes
        :condition (and 
            (at start (at ?p ?l)) 
            (at start (available ?f ?l))
            
            ; Friend and location constraints
            (over all (= ?l rd))
            (over all (= ?f betty))
            (over all (not (met ?f))) 
            
            ; Temporal constraints (8:30 PM = 690 min, 10:00 PM = 780 min)
            (at start (>= (time-elapsed) 690)) ; Must start at or after 8:30 PM
            (at end (<= (time-elapsed) 780))   ; Must finish by 10:00 PM
        )
        :effect (and
            (at end (met ?f))
            (at end (increase (total-meetings) 1))
            (at end (increase (total-cost) ?duration)) 
        )
    )
)