(define (domain travel-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types person city day)

  (:predicates
    (at ?p - person ?c - city ?d - day)        ; person is in city on a given day
    (assigned ?d - day)                       ; this day has been assigned (traveler's presence fixed)
    (next ?d1 - day ?d2 - day)                ; temporal successor relation between days
    (direct ?c1 - city ?c2 - city)            ; a direct single-leg flight exists from c1 to c2
  )

  ;; Stay in the same city from one day to the next
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

  ;; Fly from one city to another using a direct flight
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