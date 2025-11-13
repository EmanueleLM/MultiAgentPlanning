(define (domain trip_planning_example20)
  :requirements :strips :typing :negative-preconditions
  :types city day
  :predicates
    (at ?c - city)
    (current ?d - day)
    (next ?d1 - day ?d2 - day)
    (served ?c - city ?d - day)
    (allowed-fly ?from - city ?to - city ?d - day)
  (:action stay
    :parameters (?c - city ?d - day ?d2 - day)
    :precondition (and (current ?d) (at ?c) (next ?d ?d2))
    :effect (and (not (current ?d)) (current ?d2) (served ?c ?d))
  )
  (:action fly
    :parameters (?from - city ?to - city ?d - day)
    :precondition (and (current ?d) (at ?from) (allowed-fly ?from ?to ?d))
    :effect (and (not (at ?from)) (at ?to))
  )
)