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
        
        ; Tracking mandatory temporal location (Venice D8-D11)
        (wedding-day-required ?d - day)
        (wedding-day-fulfilled ?d - day)
    )

    ;; 1. Commute on unconstrained days (D1-D7). Consumes 1 day, does not satisfy stay duration requirements.
    (:action commute-general
        :parameters (?p - traveler ?from - city ?to - city ?d1 - day ?d2 - day)
        :precondition (and
            (current-day ?d1)
            (next-day ?d1 ?d2)
            (at ?p ?from)
            (direct-flight ?from ?to)
            
            ; Must NOT be a required wedding day (D8-D11)
            (not (wedding-day-required ?d1))
        )
        :effect (and
            (not (at ?p ?from))
            (at ?p ?to)
            (not (current-day ?d1))
            (current-day ?d2)
        )
    )
    
    ;; 2. Stay on unconstrained days (D1-D7). Consumes 1 day and 1 duration slot.
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
    
    ;; 3. STAY in VENICE during wedding D8, D9, D10 (Mandatory location and duration consumption)
    (:action wedding-stay-transition
        :parameters (?p - traveler ?d1 - day ?d2 - day ?s - duration-slot)
        :precondition (and
            (current-day ?d1)
            (next-day ?d1 ?d2)
            (at ?p venice) ; Location constraint
            (wedding-day-required ?d1)
            
            (slot-available ?s)
            (slot-of ?s venice) ; Duration constraint
        )
        :effect (and
            (not (slot-available ?s)) 
            (not (current-day ?d1))
            (current-day ?d2)
            (not (wedding-day-required ?d1)) ; Mark temporal constraint fulfilled
            (wedding-day-fulfilled ?d1)
        )
    )
    
    ;; 4. Final Day D11 (Wedding constraint and trip termination)
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
)