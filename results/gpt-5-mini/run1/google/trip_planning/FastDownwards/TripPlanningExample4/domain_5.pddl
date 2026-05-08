(define (domain direct_flight_itinerary)
  (:requirements :typing :strips)
  (:types day city)

  (:predicates
    (at ?d - day ?c - city)        ; traveler is in city on day
    (suc ?d1 - day ?d2 - day)      ; successor relation between consecutive days
    (edge ?c1 - city ?c2 - city)   ; direct flight exists between cities (bidirectional edges listed)
    (free ?d - day)                ; day not yet assigned a city (available)
  )

  ;; Stay in the same city from day ?d to its successor day ?d2.
  (:action stay
    :parameters (?d - day ?d2 - day ?c - city)
    :precondition (and
      (at ?d ?c)
      (suc ?d ?d2)
      (free ?d2)
    )
    :effect (and
      (at ?d2 ?c)
      (not (free ?d2))
    )
  )

  ;; Fly along a direct edge from ?from to ?to between consecutive days.
  (:action fly
    :parameters (?d - day ?d2 - day ?from - city ?to - city)
    :precondition (and
      (at ?d ?from)
      (suc ?d ?d2)
      (edge ?from ?to)
      (free ?d2)
    )
    :effect (and
      (at ?d2 ?to)
      (not (free ?d2))
    )
  )
)