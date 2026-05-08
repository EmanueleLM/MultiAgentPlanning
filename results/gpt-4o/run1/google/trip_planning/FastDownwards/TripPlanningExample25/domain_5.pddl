(define (domain city_visit)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    location time
  )

  (:predicates
    (at ?city - location ?day - time)
    (connected ?from - location ?to - location)
    (next ?d1 - time ?d2 - time)
    (attending_show ?day - time)
  )
  
  (:action fly
    :parameters (?from - location ?to - location ?day - time ?next_day - time)
    :precondition (and (at ?from ?day) (connected ?from ?to) (next ?day ?next_day))
    :effect (and (not (at ?from ?day)) (at ?to ?next_day))
  )

  (:action stay
    :parameters (?city - location ?day - time ?next_day - time)
    :precondition (and (at ?city ?day) (next ?day ?next_day))
    :effect (and (not (at ?city ?day)) (at ?city ?next_day))
  )
)