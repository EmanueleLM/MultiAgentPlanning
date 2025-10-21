(define (domain trip-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (at ?c - city)
    (direct ?from - city ?to - city)
    (unallocated ?d - day)
    (assigned ?d - day ?c - city)
  )

  ;; Travel action: only allowed where a direct flight exists
  (:action travel
    :parameters (?from - city ?to - city)
    :precondition (and (at ?from) (direct ?from ?to))
    :effect (and (not (at ?from)) (at ?to))
  )

  ;; Allocate a specific day to the city where the traveler currently is.
  ;; Each day object can be allocated once; being at the city is required.
  (:action allocate-day
    :parameters (?d - day ?c - city)
    :precondition (and (unallocated ?d) (at ?c))
    :effect (and (not (unallocated ?d)) (assigned ?d ?c))
  )
)