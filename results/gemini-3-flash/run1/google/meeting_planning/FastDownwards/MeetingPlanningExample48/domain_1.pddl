(define (domain meeting_planning_example_48)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        location
        time
        person
    )
    (:predicates
        (at ?l - location ?t - time)
        (met ?p - person)
        (next ?t1 - time ?t2 - time)
        (person_at ?p - person ?l - location ?t1 - time ?t2 - time)
        (distance_ok ?l1 - location ?l2 - location ?t1 - time ?t2 - time)
    )

    ;; Move from one location to another if the time interval is sufficient
    (:action travel
        :parameters (?l1 - location ?l2 - location ?t1 - time ?t2 - time)
        :precondition (and 
            (at ?l1 ?t1) 
            (next ?t1 ?t2) 
            (distance_ok ?l1 ?l2 ?t1 ?t2)
        )
        :effect (and 
            (not (at ?l1 ?t1)) 
            (at ?l2 ?t2)
        )
    )

    ;; Stay at the current location for a time interval
    (:action wait
        :parameters (?l - location ?t1 - time ?t2 - time)
        :precondition (and 
            (at ?l ?t1) 
            (next ?t1 ?t2)
        )
        :effect (and 
            (not (at ?l ?t1)) 
            (at ?l ?t2)
        )
    )

    ;; Meet a person at the current location during a specific time interval
    (:action meet
        :parameters (?p - person ?l - location ?t1 - time ?t2 - time)
        :precondition (and 
            (at ?l ?t1) 
            (next ?t1 ?t2) 
            (person_at ?p ?l ?t1 ?t2)
        )
        :effect (and 
            (not (at ?l ?t1)) 
            (at ?l ?t2) 
            (met ?p)
        )
    )
)