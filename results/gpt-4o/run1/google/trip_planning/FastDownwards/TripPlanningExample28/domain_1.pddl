(define (domain travel_plan)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)
  
  (:predicates
    (at ?c - city ?d - day)
    (connected ?from - city ?to - city)
    (visited ?c - city)
    (next ?d1 - day ?d2 - day)
  )

  (:action fly_venice_zurich
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (at venice ?d1) (connected venice zurich) (next ?d1 ?d2))
    :effect (and (not (at venice ?d1)) (at zurich ?d2))
  )

  (:action fly_zurich_florence
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (at zurich ?d1) (connected zurich florence) (next ?d1 ?d2))
    :effect (and (not (at zurich ?d1)) (at florence ?d2))
  )

  (:action fly_zurich_venice
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (at zurich ?d1) (connected zurich venice) (next ?d1 ?d2))
    :effect (and (not (at zurich ?d1)) (at venice ?d2))
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and (at ?c ?d1) (next ?d1 ?d2))
    :effect (and (not (at ?c ?d1)) (at ?c ?d2))
  )
)