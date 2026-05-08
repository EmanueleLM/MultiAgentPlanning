(define (domain meeting-planning)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        agent location time-phase - object
    )
    (:predicates
        (at ?a - agent ?l - location) 
        (available ?s - agent ?l - location) 
        (met-for-120 ?s - agent)
        (time-is ?tp - time-phase) 
    )

    (:functions
        (total-cost) - number
    )

    ; Travel Marina (T0) to Mission (T20). Duration 20 min.
    (:action travel-marina-mission
        :parameters (?p - agent)
        :precondition (and 
            (at ?p marina) 
            (time-is T0)
        )
        :effect (and
            (not (at ?p marina))
            (at ?p mission)
            (not (time-is T0))
            (time-is T20)
            (increase (total-cost) 20)
        )
    )

    ; Wait at Mission from T20 (9:20 AM) to T90 (10:30 AM). Duration 70 min.
    ; Stephanie becomes available at T90.
    (:action wait-and-start-availability
        :parameters (?p - agent ?s - agent)
        :precondition (and 
            (at ?p mission) 
            (time-is T20)
        )
        :effect (and
            (not (time-is T20))
            (time-is T90)
            (available ?s mission) 
            (increase (total-cost) 70)
        )
    )

    ; Execute 120 min continuous meeting. T90 (10:30 AM) -> T210 (12:30 PM).
    ; This is valid as the end time T210 is before Stephanie's availability ends at T270 (1:30 PM).
    (:action execute-120min-meeting
        :parameters (?p - agent ?s - agent ?l - location)
        :precondition (and
            (at ?p ?l)
            (time-is T90)
            (available ?s ?l)
        )
        :effect (and
            (not (time-is T90))
            (time-is T210)
            (met-for-120 ?s)
            (increase (total-cost) 120)
        )
    )
    
    ; Travel Mission (T210) to Marina (T229). Duration 19 min. Included for completeness.
    (:action travel-mission-marina
        :parameters (?p - agent)
        :precondition (and 
            (at ?p mission)
            (time-is T210) 
        )
        :effect (and
            (not (at ?p mission))
            (at ?p marina)
            (not (time-is T210))
            (time-is T229)
            (increase (total-cost) 19)
        )
    )
)