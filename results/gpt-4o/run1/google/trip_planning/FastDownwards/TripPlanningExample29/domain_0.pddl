(define (domain travel)

  (:requirements :strips :typing :negative-preconditions)

  (:types city day)

  (:predicates
     (at_day ?c - city ?d - day)
     (visited ?c - city)
     (direct_flight ?from - city ?to - city)
     (next_day ?d1 - day ?d2 - day)
  )

  (:action fly
    :parameters (?from - city ?to - city ?d_from - day ?d_to - day)
    :precondition (and 
        (at_day ?from ?d_from) 
        (direct_flight ?from ?to) 
        (not (visited ?to))
        (next_day ?d_from ?d_to))
    :effect (and 
        (not (at_day ?from ?d_from)) 
        (at_day ?to ?d_to) 
        (visited ?to))
  )

  (:action stay
    :parameters (?c - city ?d_from - day ?d_to - day)
    :precondition (and 
        (at_day ?c ?d_from) 
        (next_day ?d_from ?d_to))
    :effect (and 
        (not (at_day ?c ?d_from)) 
        (at_day ?c ?d_to))
  )
)