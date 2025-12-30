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
            ; Cannot commute if the current day is required for a wedding stay
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
            ; Cannot use general stay action if a wedding stay is required
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
)