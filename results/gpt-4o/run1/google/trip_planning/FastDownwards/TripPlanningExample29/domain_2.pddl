(define (domain travel)
  (:requirements :strips :typing :negative-preconditions)

  (:types city day)

  (:predicates
    (at ?c - city ?d - day)
    (visited ?c - city)
    (direct_flight ?from - city ?to - city)
    (next_day ?d1 - day ?d2 - day)
  )

  (:action fly
    :parameters (?from - city ?to - city ?d_from - day ?d_to - day)
    :precondition (and 
        (at ?from ?d_from) 
        (direct_flight ?from ?to) 
        (next_day ?d_from ?d_to))
    :effect (and 
        (not (at ?from ?d_from)) 
        (at ?to ?d_to) 
        (visited ?to))
  )

  (:action stay
    :parameters (?c - city ?d_from - day ?d_to - day)
    :precondition (and 
        (at ?c ?d_from) 
        (next_day ?d_from ?d_to))
    :effect (and 
        (not (at ?c ?d_from)) 
        (at ?c ?d_to))
  )
)