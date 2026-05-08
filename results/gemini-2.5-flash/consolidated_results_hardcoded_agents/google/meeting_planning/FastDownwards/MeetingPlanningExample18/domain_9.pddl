(define (domain meeting-planning-temporal)
    (:requirements :strips :typing :negative-preconditions :action-costs)
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
        (at-md-pre-travel) ; State for early activities before T=694
        (ready-to-travel-rd) ; State reached exactly at T=694
        (at-rd-ready-to-meet) ; State reached exactly at T=705
        (meeting-complete) ; State reached exactly at T=780
    )
    (:functions
        (total-meetings)
        (total-cost) ; Tracks time elapsed in minutes (T=0 at 9:00 AM)
    )

    ;; 1. Meeting Alpha (Fixed 120 minutes duration)
    (:action meet_alpha
        :parameters (?p - person ?f - friend)
        :precondition (and 
            (at ?p md)
            (available ?f md)
            (not (met ?f))
            (at-md-pre-travel)
        )
        :effect (and
            (met ?f)
            (increase (total-meetings) 1)
            (increase (total-cost) 120)
        )
    )

    ;; 2a. Waiting Block (574 minutes) - Post-Alpha wait to hit T=694
    ;; Allows for optimal total time 120 + 574 = 694 minutes
    (:action wait_after_alpha
        :parameters (?p - person)
        :precondition (and 
            (at ?p md)
            (at-md-pre-travel)
            (met alpha) 
        )
        :effect (and
            (not (at-md-pre-travel))
            (ready-to-travel-rd)
            (increase (total-cost) 574) 
        )
    )

    ;; 2b. Waiting Block (694 minutes) - Full wait if Alpha is skipped, hits T=694
    (:action wait_full_block
        :parameters (?p - person)
        :precondition (and 
            (at ?p md)
            (at-md-pre-travel)
            (not (met alpha))
        )
        :effect (and
            (not (at-md-pre-travel))
            (ready-to-travel-rd)
            (increase (total-cost) 694) 
        )
    )

    ;; 3. Travel MD -> RD (11 minutes)
    ;; Starts at T=694, arrives at T=705
    (:action travel_md_rd
        :parameters (?p - person)
        :precondition (and
            (at ?p md)
            (ready-to-travel-rd) ; Ensures T=694 start
        )
        :effect (and
            (not (at ?p md))
            (not (ready-to-travel-rd))
            (at ?p rd)
            (at-rd-ready-to-meet) ; Arrival state at T=705
            (increase (total-cost) 11)
        )
    )

    ;; 4. Meeting Betty (Fixed 75 minutes duration required)
    ;; Must start at T=705, ends at T=780 (10:00 PM)
    (:action meet_betty
        :parameters (?p - person ?f - friend)
        :precondition (and
            (at ?p rd)
            (available ?f rd)
            (at-rd-ready-to-meet) 
            (not (met ?f))
        )
        :effect (and
            (met ?f)
            (not (at-rd-ready-to-meet))
            (meeting-complete)
            (increase (total-meetings) 1)
            (increase (total-cost) 75)
        )
    )
    
    ;; 5. Travel RD -> MD (9 minutes) - Optional finish
    (:action travel_rd_md
        :parameters (?p - person)
        :precondition (and 
            (at ?p rd)
            (meeting-complete)
        )
        :effect (and
            (not (at ?p rd))
            (at ?p md)
            (increase (total-cost) 9)
        )
    )