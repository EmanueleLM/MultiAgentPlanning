(define (domain trip_plan)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates 
    (at ?c - city ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (visited ?c - city)
  )

  (:action fly_dubrovnik_istanbul
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (at dubrovnik ?d1) (next_day ?d1 ?d2) (not (at istanbul ?d2)))
    :effect (and (at istanbul ?d2) (not (at dubrovnik ?d2)))
  )

  (:action fly_dubrovnik_venice
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (at dubrovnik ?d1) (next_day ?d1 ?d2) (not (at venice ?d2)))
    :effect (and (at venice ?d2) (not (at dubrovnik ?d2)))
  )

  (:action fly_istanbul_dubrovnik
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (at istanbul ?d1) (next_day ?d1 ?d2) (not (at dubrovnik ?d2)))
    :effect (and (at dubrovnik ?d2) (not (at istanbul ?d2)))
  )

  (:action fly_venice_dubrovnik
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (at venice ?d1) (next_day ?d1 ?d2) (not (at dubrovnik ?d2)))
    :effect (and (at dubrovnik ?d2) (not (at venice ?d2)))
  )
)