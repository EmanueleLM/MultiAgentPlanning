(define (domain TripPlanningExample2)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        city
        day
        traveler
        duration-slot
    )
    (:predicates
        (at ?t - traveler ?c - city)
        (current-day ?d - day)
        (next-day ?d1 - day ?d2 - day)
        (direct-flight ?c1 - city ?c2 - city)
        
        (slot-available ?s - duration-slot)
        (slot-of ?s - duration-slot ?c - city)
        
        (wedding-day-required ?d - day)
        (wedding-day-fulfilled ?d - day)
    )

    (:action commute-general
        :parameters (?p - traveler ?from - city ?to - city ?d1 - day ?d2 - day)
        :precondition (and
            (current-day ?d1)
            (next-day ?d1 ?d2)
            (at ?p ?from)
            (direct-flight ?from ?to)
            (not (wedding-day-required ?d1))
        )
        :effect (and
            (not (at ?p ?from))
            (at ?p ?to)
            (not (current-day ?d1))
            (current-day ?d2)
        )
    )
    
    (:action stay-general
        :parameters (?p - traveler ?c - city ?d1 - day ?d2 - day ?s - duration-slot)
        :precondition (and
            (current-day ?d1)
            (next-day ?d1 ?d2)
            (at ?p ?c)
            (slot-available ?s)
            (slot-of ?s ?c)
            (not (wedding-day-required ?d1))
        )
        :effect (and
            (not (slot-available ?s)) 
            (not (current-day ?d1))
            (current-day ?d2)
        )
    )
    
    (:action wedding-stay-transition
        :parameters (?p - traveler ?d1 - day ?d2 - day ?s - duration-slot)
        :precondition (and
            (current-day ?d1)
            (next-day ?d1 ?d2)
            (at ?p venice) 
            (wedding-day-required ?d1)
            (slot-available ?s)
            (slot-of ?s venice)
        )
        :effect (and
            (not (slot-available ?s)) 
            (not (current-day ?d1))
            (current-day ?d2)
            (not (wedding-day-required ?d1)) 
            (wedding-day-fulfilled ?d1)
        )
    )
    
    (:action finish-wedding-day
        :parameters (?p - traveler ?d - day ?s - duration-slot)
        :precondition (and
            (current-day ?d)
            (at ?p venice)
            (slot-available ?s)
            (slot-of ?s venice)
            (wedding-day-required ?d)
        )
        :effect (and
            (not (slot-available ?s)) 
            (not (current-day ?d))
            (not (wedding-day-required ?d))
            (wedding-day-fulfilled ?d)
        )
    )