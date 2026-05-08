(define (domain meeting-planning)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        person location friend time-stage - object
    )
    (:predicates
        (at ?p - person ?l - location)
        (available ?f - friend ?l - location)
        (met ?f - friend)
        (current-stage ?s - time-stage)
    )
    (:functions
        (total-cost) ; Tracks total time elapsed in minutes
        (total-meetings) ; Optimization goal fluent
    )

    ;; --- Time Management Action ---
    ; Wait from 9:00 AM (T=0) until the latest possible departure time (T=694 min)
    (:action wait_for_departure
        :parameters (?p - person)
        :precondition (and 
            (at ?p md)
            (current-stage t0)
        )
        :effect (and
            (not (current-stage t0))
            (current-stage ready-to-depart) ; T = 694 min
            (increase (total-cost) 694)
        )
    )

    ;; --- Travel Actions ---
    ; Travel MD -> RD (Duration 11 min)
    ; Must occur immediately after waiting (T=694 -> T=705)
    (:action travel_md_rd
        :parameters (?p - person)
        :precondition (and 
            (at ?p md)
            (current-stage ready-to-depart)
        )
        :effect (and 
            (not (at ?p md)) 
            (at ?p rd)
            (not (current-stage ready-to-depart))
            (current-stage arrival-rd) ; T = 705 min (Latest start time for Betty)
            (increase (total-cost) 11)
        )
    )
    
    ; Travel RD -> MD (Duration 9 min) - General action, unused in the optimal path
    (:action travel_rd_md
        :parameters (?p - person)
        :precondition (and 
            (at ?p rd)
        )
        :effect (and 
            (not (at ?p rd)) 
            (at ?p md)
            (increase (total-cost) 9)
        )
    )

    ;; --- Meeting Action ---
    ; Meet Betty for the required 75 min duration (T=705 -> T=780, 10:00 PM)
    (:action meet_betty
        :parameters (?p - person ?f - friend)
        :precondition (and 
            (at ?p rd) 
            (available ?f rd)
            (current-stage arrival-rd) ; T = 705 min
            (not (met ?f))
        )
        :effect (and
            (met ?f)
            (increase (total-meetings) 1)
            (increase (total-cost) 75) ; T = 780 min (10:00 PM finish)
            (not (current-stage arrival-rd))
            (current-stage mission-complete)
        )
    )
)