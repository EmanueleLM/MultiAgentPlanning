(define (domain meeting_planning)
    (:requirements :strips :typing)
    (:types
        person location timepoint
    )
    (:predicates
        (at ?p - person ?l - location)
        (at_time ?t - timepoint)
        (met ?p - person)
        (next ?t1 - timepoint ?t2 - timepoint)
        (can_travel ?l1 - location ?l2 - location ?t1 - timepoint ?t2 - timepoint)
        (can_meet ?p1 - person ?p2 - person ?l - location ?t1 - timepoint ?t2 - timepoint)
    )

    (:action travel
        :parameters (?p - person ?from - location ?to - location ?t1 - timepoint ?t2 - timepoint)
        :precondition (and 
            (at ?p ?from) 
            (at_time ?t1) 
            (can_travel ?from ?to ?t1 ?t2)
        )
        :effect (and 
            (not (at ?p ?from)) 
            (at ?p ?to) 
            (not (at_time ?t1)) 
            (at_time ?t2)
        )
    )

    (:action wait
        :parameters (?p - person ?l - location ?t1 - timepoint ?t2 - timepoint)
        :precondition (and 
            (at ?p ?l) 
            (at_time ?t1) 
            (next ?t1 ?t2)
        )
        :effect (and 
            (not (at_time ?t1)) 
            (at_time ?t2)
        )
    )

    (:action meet
        :parameters (?p1 - person ?p2 - person ?l - location ?t1 - timepoint ?t2 - timepoint)
        :precondition (and 
            (at ?p1 ?l) 
            (at_time ?t1) 
            (can_meet ?p1 ?p2 ?l ?t1 ?t2)
        )
        :effect (and 
            (not (at_time ?t1)) 
            (at_time ?t2) 
            (met ?p2)
        )
    )
)