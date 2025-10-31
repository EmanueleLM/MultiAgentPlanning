(define (domain trip-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (at ?c - city)                      ; current location
    (direct ?from - city ?to - city)    ; direct flight exists (directional)
    (unallocated ?d - day)              ; day token not yet assigned
    (assigned ?d - day ?c - city)       ; day token assigned to a city
  )

  ;; Travel action allowed only when at the origin and a direct flight exists.
  (:action travel
    :parameters (?from - city ?to - city)
    :precondition (and (at ?from) (direct ?from ?to))
    :effect (and (not (at ?from)) (at ?to))
  )

  ;; Allocate a day to the city where the traveler currently is.
  ;; Each day can be allocated once (requires unallocated).
  (:action allocate-day
    :parameters (?d - day ?c - city)
    :precondition (and (unallocated ?d) (at ?c))
    :effect (and (not (unallocated ?d)) (assigned ?d ?c))
  )
)