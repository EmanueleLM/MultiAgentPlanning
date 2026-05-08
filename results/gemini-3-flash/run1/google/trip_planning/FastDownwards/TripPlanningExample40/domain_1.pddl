(define (domain trip_planning)
    (:requirements :strips :typing)
    (:types city day)
    (:predicates
        (at ?c - city ?d - day)
        (visited ?c - city ?d - day)
        (next ?d1 ?d2 - day)
        (can_fly ?c1 ?c2 - city)
    )

    ;; Stay in the current city until the next day.
    (:action stay
        :parameters (?c - city ?d_now ?d_next - day)
        :precondition (and 
            (at ?c ?d_now) 
            (next ?d_now ?d_next)
        )
        :effect (and 
            (not (at ?c ?d_now)) 
            (at ?c ?d_next) 
            (visited ?c ?d_next)
        )
    )

    ;; Fly from one city to another, taking one day.
    ;; A flight during day N means you were in the origin city at the start of day N,
    ;; and you are in the destination city during day N and at the start of day N+1.
    ;; This allows a single day to count for both cities in terms of stay duration.
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
            (visited ?to ?d_now)
            (visited ?to ?d_next)
        )
    )
)