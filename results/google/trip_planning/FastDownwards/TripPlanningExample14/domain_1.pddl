(define (domain trip-itinerary)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)
  (:predicates
    (city ?c - city)
    (day ?d - day)
    (next ?d1 - day ?d2 - day)
    (edge ?from - city ?to - city)
    (at ?d - day ?c - city)
    (assigned ?d - day)
    (first ?d - day)
  )

  ; Choose the city for the first day
  (:action seed-first-day
    :parameters (?d - day ?c - city)
    :precondition (and
      (first ?d)
      (day ?d)
      (city ?c)
      (not (assigned ?d))
    )
    :effect (and
      (at ?d ?c)
      (assigned ?d)
    )
  )

  ; Stay in the same city from one day to the next
  (:action assign-stay
    :parameters (?d1 - day ?d2 - day ?c - city)
    :precondition (and
      (next ?d1 ?d2)
      (at ?d1 ?c)
      (not (assigned ?d2))
    )
    :effect (and
      (at ?d2 ?c)
      (assigned ?d2)
    )
  )

  ; Fly along a single direct edge from one day to the next
  (:action assign-fly
    :parameters (?d1 - day ?d2 - day ?c1 - city ?c2 - city)
    :precondition (and
      (next ?d1 ?d2)
      (at ?d1 ?c1)
      (edge ?c1 ?c2)
      (not (assigned ?d2))
    )
    :effect (and
      (at ?d2 ?c2)
      (assigned ?d2)
    )
  )
)