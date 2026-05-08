(define (domain meeting-planning)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        person location friend - object
    )
    (:predicates
        (at ?p - person ?l - location)
        (available ?f - friend ?l - location)
        (met ?f - friend)
        ; Time gates (minutes elapsed from 9:00 AM)
        (T-0)       ; 9:00 AM (Start)
        (T-11)      ; 9:11 AM (Arrival RD early)
        (T-20)      ; 9:20 AM (Arrival MD after loop)
        (T-690)     ; 8:30 PM (Earliest Betty start time at RD)
        (T-694)     ; 8:34 PM (Latest MD departure time for T=705 arrival)
        (T-705)     ; 8:45 PM (Latest Betty start time at RD)
    )
    
    ;; --- Travel Actions ---

    ; 1. Initial travel MD -> RD (11 min). T=0 -> T=11
    (:action travel_md_rd_early
        :parameters (?p - person)
        :precondition (and 
            (at ?p md)
            (T-0)
        )
        :effect (and 
            (not (T-0))
            (not (at ?p md)) 
            (at ?p rd)
            (T-11)
        )
    )
    
    ; 2. Return travel RD -> MD (9 min). T=11 -> T=20
    (:action travel_rd_md_loop
        :parameters (?p - person)
        :precondition (and 
            (at ?p rd)
            (T-11) 
        )
        :effect (and 
            (not (T-11))
            (not (at ?p rd)) 
            (at ?p md)
            (T-20)
        )
    )

    ; 3. Final travel MD -> RD (11 min). T=694 -> T=705
    (:action travel_md_rd_late
        :parameters (?p - person)
        :precondition (and 
            (at ?p md)
            (T-694) 
        )
        :effect (and 
            (not (T-694))
            (not (at ?p md)) 
            (at ?p rd)
            (T-705)
        )
    )

    ;; --- Waiting/Time Alignment Actions ---
    
    ; A1. Wait at MD from T=0 to T=694 (Maximize free time at start location).
    (:action wait_md_to_694_from_0
        :parameters (?p - person)
        :precondition (and 
            (at ?p md)
            (T-0)
        )
        :effect (and
            (not (T-0))
            (T-694)
        )
    )
    
    ; A2. Wait at RD from T=11 to T=690.
    (:action wait_rd_to_690_from_11
        :parameters (?p - person)
        :precondition (and 
            (at ?p rd)
            (T-11) 
        )
        :effect (and
            (not (T-11))
            (T-690)
        )
    )
    
    ; A3. Wait at MD from T=20 to T=694.
    (:action wait_md_to_694_from_20
        :parameters (?p - person)
        :precondition (and 
            (at ?p md)
            (T-20) 
        )
        :effect (and
            (not (T-20))
            (T-694)
        )
    )

    ;; --- Meeting Actions (75 minutes minimum duration) ---
    
    ; Meeting starting at T=690 (8:30 PM). Ends T=765 (9:45 PM).
    (:action meet_betty_75m_early
        :parameters (?p - person ?f - friend ?l - location)
        :precondition (and 
            (at ?p ?l) 
            (available ?f ?l) 
            (T-690)
            (= ?l rd)
            (= ?f betty)
            (not (met ?f))
        )
        :effect (and
            (met ?f) 
            (not (T-690))
        )
    )

    ; Meeting starting at T=705 (8:45 PM). Ends T=780 (10:00 PM).
    (:action meet_betty_75m_late
        :parameters (?p - person ?f - friend ?l - location)
        :precondition (and 
            (at ?p ?l) 
            (available ?f ?l) 
            (T-705)
            (= ?l rd)
            (= ?f betty)
            (not (met ?f))
        )
        :effect (and
            (met ?f) 
            (not (T-705))
        )
    )
)