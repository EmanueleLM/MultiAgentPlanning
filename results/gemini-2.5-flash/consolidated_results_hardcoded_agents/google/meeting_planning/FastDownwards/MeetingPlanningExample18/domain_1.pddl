(define (domain meeting-planning)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        person location friend - object
    )
    (:predicates
        (at ?p - person ?l - location)
        (available ?f - friend ?l - location)
        (met ?f - friend)
        ; Time window markers (representing elapsed minutes from 9:00 AM)
        (t-0) 
        (t-11-rd) 
        (t-20-md) 
        (t-694-md) 
        (t-690-rd) 
        (t-705-rd) 
    )
    
    (:constants
        me - person
        md rd - location
        betty - friend
    )

    ;; --- Phase 1: Initial Travel (Optional Loop, maximizing free time at MD) ---

    ; 1. Initial travel MD -> RD (11 min). T=11
    (:action initial_travel_md_rd
        :parameters (?p - person)
        :precondition (and 
            (at ?p md)
            (t-0)
        )
        :effect (and 
            (not (t-0))
            (not (at ?p md)) 
            (at ?p rd)
            (t-11-rd)
            (increase (total-cost) 11)
        )
    )
    
    ; 2. Return travel RD -> MD (9 min). T=20
    (:action travel_rd_md_loop
        :parameters (?p - person)
        :precondition (and 
            (at ?p rd)
            (t-11-rd) 
        )
        :effect (and 
            (not (t-11-rd))
            (not (at ?p rd)) 
            (at ?p md)
            (t-20-md)
            (increase (total-cost) 9)
        )
    )

    ;; --- Phase 2: Waiting/Time Alignment ---
    
    ; Path A: Wait immediately at RD until 8:30 PM (T=690). (11 + 679 = 690 min)
    (:action wait_rd_to_690
        :parameters (?p - person)
        :precondition (and 
            (at ?p rd)
            (t-11-rd) 
        )
        :effect (and
            (not (t-11-rd))
            (t-690-rd)
            (increase (total-cost) 679) 
        )
    )
    
    ; Path B (Optimized for free time): Wait at MD until critical departure time (T=694). (20 + 674 = 694 min)
    (:action wait_md_to_694
        :parameters (?p - person)
        :precondition (and 
            (at ?p md)
            (t-20-md) 
        )
        :effect (and
            (not (t-20-md))
            (t-694-md)
            (increase (total-cost) 674) 
        )
    )
    
    ; 3. Final travel MD -> RD (11 min). T=705 (694 + 11 = 705 min)
    (:action final_travel_md_rd_late
        :parameters (?p - person)
        :precondition (and 
            (at ?p md)
            (t-694-md) 
        )
        :effect (and 
            (not (t-694-md))
            (not (at ?p md)) 
            (at ?p rd)
            (t-705-rd)
            (increase (total-cost) 11)
        )
    )

    ;; --- Phase 3: Meeting (75 minutes minimum duration) ---

    ; Meeting starting at T=690 (Ends 765, 9:45 PM)
    (:action meet_betty_75m_early
        :parameters (?p - person ?f - friend ?l - location)
        :precondition (and 
            (at ?p ?l) 
            (available ?f ?l) 
            (t-690-rd)
            (not (met ?f))
        )
        :effect (and
            (met ?f) 
            (increase (total-cost) 75) 
        )
    )

    ; Meeting starting at T=705 (Ends 780, 10:00 PM exactly)
    (:action meet_betty_75m_late
        :parameters (?p - person ?f - friend ?l - location)
        :precondition (and 
            (at ?p ?l) 
            (available ?f ?l) 
            (t-705-rd)
            (not (met ?f))
        )
        :effect (and
            (met ?f) 
            (increase (total-cost) 75) 
        )
    )
)