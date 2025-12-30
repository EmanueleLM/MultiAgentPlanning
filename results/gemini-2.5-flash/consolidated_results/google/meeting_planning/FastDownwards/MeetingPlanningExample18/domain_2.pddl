(define (domain meeting-planning)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        person location friend - object
    )
    (:predicates
        (at ?p - person ?l - location)
        (available ?f - friend ?l - location)
        (met ?f - friend)
        ; Time state markers (representing elapsed minutes from 9:00 AM)
        (t-0) 
        (t-11-rd) 
        (t-20-md) 
        (t-690-rd) ; 8:30 PM (Earliest start time at RD)
        (t-694-md) ; 8:34 PM (Latest departure time from MD)
        (t-705-rd) ; 8:45 PM (Latest start time at RD)
    )
    
    (:constants
        me - person
        md - location
        rd - location
        betty - friend
    )

    ;; --- Travel Actions ---

    ; 1. Initial travel MD -> RD (11 min). T=0 -> T=11
    (:action travel_md_rd_early
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
        )
    )
    
    ; 2. Return travel RD -> MD (9 min). T=11 -> T=20
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
        )
    )

    ; 3. Final travel MD -> RD (11 min). T=694 -> T=705
    (:action travel_md_rd_late
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
        )
    )

    ;; --- Waiting/Time Alignment Actions ---
    
    ; A1. Wait at MD from T=0 to T=694. (Maximizes free time at MD)
    (:action wait_md_to_694_from_0
        :parameters (?p - person)
        :precondition (and 
            (at ?p md)
            (t-0)
        )
        :effect (and
            (not (t-0))
            (t-694-md)
        )
    )
    
    ; A2. Wait at RD from T=11 to T=690. (Arrive early, wait at RD)
    (:action wait_rd_to_690_from_11
        :parameters (?p - person)
        :precondition (and 
            (at ?p rd)
            (t-11-rd) 
        )
        :effect (and
            (not (t-11-rd))
            (t-690-rd)
        )
    )
    
    ; A3. Wait at MD from T=20 to T=694. (If initial loop was performed)
    (:action wait_md_to_694_from_20
        :parameters (?p - person)
        :precondition (and 
            (at ?p md)
            (t-20-md) 
        )
        :effect (and
            (not (t-20-md))
            (t-694-md)
        )
    )

    ;; --- Meeting Actions (75 minutes minimum duration) ---
    
    ; Meeting starting at T=690 (8:30 PM). Ensures 75 min duration (Ends T=765, 9:45 PM).
    (:action meet_betty_75m_early
        :parameters (?p - person ?f - friend ?l - location)
        :precondition (and 
            (at ?p ?l) 
            (available ?f ?l) 
            (t-690-rd)
            (= ?l rd)
            (= ?f betty)
            (not (met ?f))
        )
        :effect (and
            (met ?f) 
            (not (t-690-rd))
        )
    )

    ; Meeting starting at T=705 (8:45 PM). Ensures 75 min duration (Ends T=780, 10:00 PM).
    (:action meet_betty_75m_late
        :parameters (?p - person ?f - friend ?l - location)
        :precondition (and 
            (at ?p ?l) 
            (available ?f ?l) 
            (t-705-rd)
            (= ?l rd)
            (= ?f betty)
            (not (met ?f))
        )
        :effect (and
            (met ?f) 
            (not (t-705-rd))
        )
    )
)