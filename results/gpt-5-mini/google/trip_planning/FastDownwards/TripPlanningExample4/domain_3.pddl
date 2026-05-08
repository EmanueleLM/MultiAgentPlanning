(define (domain direct_flight_itinerary)
  (:requirements :typing :negative-preconditions :strips)
  (:types day city)

  (:predicates
    (at ?d - day ?c - city)        ; traveler is in city on day
    (suc ?d1 - day ?d2 - day)      ; successor relation between consecutive days
    (edge ?c1 - city ?c2 - city)   ; direct flight exists between cities
  )

  ; Stay in the same city from day ?d to successor day ?d2.
  ; For this specific instance we enumerate the known cities in the negative preconditions
  ; to enforce that each day gets assigned exactly one city.
  (:action stay
    :parameters (?d - day ?d2 - day ?c - city)
    :precondition (and
      (at ?d ?c)
      (suc ?d ?d2)
      (not (at ?d2 seville))
      (not (at ?d2 munich))
      (not (at ?d2 tallinn))
    )
    :effect (and
      (at ?d2 ?c)
    )
  )

  ; Fly along a direct edge from ?from to ?to between consecutive days.
  (:action fly
    :parameters (?d - day ?d2 - day ?from - city ?to - city)
    :precondition (and
      (at ?d ?from)
      (suc ?d ?d2)
      (edge ?from ?to)
      (not (at ?d2 seville))
      (not (at ?d2 munich))
      (not (at ?d2 tallinn))
    )
    :effect (and
      (at ?d2 ?to)
    )
  )
)