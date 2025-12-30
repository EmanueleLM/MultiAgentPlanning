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

    ; T0 (9:00 AM) -> T20 (9:20 AM). Travel time 20 min.
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

    ; T20 (9:20 AM) -> T90 (10:30 AM). Wait time 70 min. Stephanie becomes available.
    (:action wait-and-start-availability
        :parameters (?p - agent ?s - agent)
        :precondition (and 
            (at ?p mission) 
            (time-is T20)
        )
        :effect (and
            (not (time-is T20))
            (time-is T90)
            (available ?s mission) ; Stephanie becomes available at Mission at t=90
            (increase (total-cost) 70)
        )
    )

    ; T90 (10:30 AM) -> T210 (12:30 PM). Meeting duration 120 min.
    ; This action executes the entire minimum continuous meeting duration required.
    (:action execute-120min-meeting
        :parameters (?p - agent ?s - agent ?l - location)
        :precondition (and
            (at ?p ?l)
            (time-is T90)
            (available ?s ?l) ; Must be available throughout this abstract action block
        )
        :effect (and
            (not (time-is T90))
            (time-is T210)
            (met-for-120 ?s)
            (increase (total-cost) 120)
        )
    )
    
    ; Travel Mission -> Marina. Duration 19 min.
    (:action travel-mission-marina
        :parameters (?p - agent)
        :precondition (at ?p mission)
        :effect (and
            (not (at ?p mission))
            (at ?p marina)
            (increase (total-cost) 19)
        )
    )
)