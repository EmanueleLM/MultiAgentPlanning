(define (domain travel-days-classical)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types agent city day)
  (:predicates
    (at ?ag - agent ?c - city)
    (direct-flight ?from - city ?to - city)
    (visited ?c - city)
    (current ?d - day)
    (next ?d1 - day ?d2 - day)
  )

  (:action fly
    :parameters (?ag - agent ?from - city ?to - city ?d - day ?d2 - day)
    :precondition (and (at ?ag ?from) (direct-flight ?from ?to) (current ?d) (next ?d ?d2))
    :effect (and (not (at ?ag ?from)) (at ?ag ?to) (visited ?to) (not (current ?d)) (current ?d2))
    :cost 1
  )

  (:action stay
    :parameters (?ag - agent ?c - city ?d - day ?d2 - day)
    :precondition (and (at ?ag ?c) (current ?d) (next ?d ?d2))
    :effect (and (visited ?c) (not (current ?d)) (current ?d2))
    :cost 1
  )
)