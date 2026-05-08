(define (domain travel-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types person city day)

  (:predicates
    (at ?p - person ?c - city ?d - day)        ; person p is in city c on day d
    (assigned ?d - day)                       ; a day has been assigned (the traveler's presence specified)
    (next ?d1 - day ?d2 - day)                ; temporal successor relation between days
    (direct ?c1 - city ?c2 - city)            ; a single-leg direct flight exists from c1 to c2
  )

  ; Traveler "agent" actions (kept distinct by prefix)
  (:action traveler_stay
    :parameters (?p - person ?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?p ?c ?d1)
      (next ?d1 ?d2)
      (not (assigned ?d2))
    )
    :effect (and
      (at ?p ?c ?d2)
      (assigned ?d2)
    )
  )

  (:action traveler_fly
    :parameters (?p - person ?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?p ?from ?d1)
      (next ?d1 ?d2)
      (direct ?from ?to)
      (not (assigned ?d2))
    )
    :effect (and
      (at ?p ?to ?d2)
      (assigned ?d2)
    )
  )
)