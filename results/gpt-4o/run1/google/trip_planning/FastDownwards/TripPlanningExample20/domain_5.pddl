(define (domain european_trip)
    (:requirements :strips :typing :negative-preconditions)
    (:types city day)
    (:predicates
        (current_city ?c - city)
        (available_flight ?from ?to - city)
        (visited ?c - city)
        (day ?d - day)
        (goal_reached)
    )
    (:action fly
        :parameters (?from ?to - city)
        :precondition (and 
            (current_city ?from) 
            (available_flight ?from ?to)
        )
        :effect (and 
            (not (current_city ?from)) 
            (current_city ?to)
        )
    )
    (:action stay
        :parameters (?c - city ?d - day)
        :precondition (and 
            (current_city ?c)
            (day ?d)
            (not (visited ?c))
        )
        :effect (visited ?c)
    )
    (:action next_day
        :parameters (?d1 ?d2 - day)
        :precondition (and 
            (day ?d1)
            (not (day ?d2))
        )
        :effect (and 
            (not (day ?d1))
            (day ?d2)
        )
    )
    (:action complete_trip
        :precondition (and
            (visited istanbul)
            (visited budapest)
            (visited dubrovnik)
        )
        :effect (goal_reached)
    )
)