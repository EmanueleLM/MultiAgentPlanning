(define (domain trip_planning)
    (:requirements :strips :typing)
    (:types city day)
    (:predicates
        (at ?c - city ?d - day)
        (visited ?c - city ?d - day)
        (next ?d1 ?d2 - day)
        (can_fly ?c1 ?c2 - city)
    )

    ;; Stay in the current city to spend more time there.
    ;; The action transitions the agent's location marker 'at' from the start of d_now to the start of d_next.
    (:action stay
        :parameters (?c - city ?d_now ?d_next - day)
        :precondition (and 
            (at ?c ?d_now) 
            (next ?d_now ?d_next)
        )
        :effect (and 
            (not (at ?c ?d_now)) 
            (at ?c ?d_next) 
            (visited ?c ?d_now)
            (visited ?c ?d_next)
        )
    )

    ;; Fly from one city to another, taking one transition (from one day's start to the next).
    ;; To accommodate the tight schedule (10 city-days in 8 calendar days), travel days 
    ;; count as a visit to both the origin and the destination cities.
    (:action fly
        :parameters (?from ?to - city ?d_now ?d_next - day)
        :precondition (and 
            (at ?from ?d_now) 
            (next ?d_now ?d_next) 
            (can_fly ?from ?to)
        )
        :effect (and 
            (not (at ?from ?d_now)) 
            (at ?to ?d_next)
            ;; The travel day (d_now) counts for both cities.
            (visited ?from ?d_now)
            (visited ?to ?d_now)
            ;; The arrival day (d_next) counts for the destination.
            (visited ?to ?d_next)
        )
    )
)