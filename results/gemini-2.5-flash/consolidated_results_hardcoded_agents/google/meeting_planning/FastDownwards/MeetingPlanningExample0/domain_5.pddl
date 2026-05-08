(define (domain meeting-planning)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        agent location time-phase - object
    )
    (:constants
        marina mission - location
        T0 T20 T90 T210 - time-phase ; Time stages: 0, 20, 90, 210 minutes
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

    ; Action 1: Travel Marina (T0) to Mission (T20). Duration 20 min.
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

    ; Action 2: Wait at Mission from T20 (9:20 AM) to T90 (10:30 AM). Duration 70 min.
    ; Sets availability for Stephanie (required minimum 10:30 AM start).
    (:action wait-and-start-availability
        :parameters (?p - agent ?s - agent)
        :precondition (and 
            (at ?p mission) 
            (time-is T20)
        )
        :effect (and
            (not (time-is T20))
            (time-is T90)
            (available ?s mission) ; Stephanie becomes available
            (increase (total-cost) 70)
        )
    )

    ; Action 3: Execute 120 min continuous meeting. T90 (10:30 AM) -> T210 (12:30 PM).
    ; Precondition requires availability to have been asserted at T90.
    (:action execute-120min-meeting
        :parameters (?p - agent ?s - agent)
        :precondition (and
            (at ?p mission)
            (time-is T90)
            (available ?s mission)
        )
        :effect (and
            (not (time-is T90))
            (time-is T210)
            (met-for-120 ?s)
            (increase (total-cost) 120)
        )
    )
)