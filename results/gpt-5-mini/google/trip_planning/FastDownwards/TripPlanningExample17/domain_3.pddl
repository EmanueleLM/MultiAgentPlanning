(define (domain travel-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types person city day)

  (:predicates
    (at ?p - person ?c - city ?d - day)    ; person ?p is in city ?c on day ?d
    (assigned ?d - day)                   ; day ?d has been assigned (traveler's presence fixed)
    (next ?d1 - day ?d2 - day)            ; immediate successor relation between days
    (direct ?c1 - city ?c2 - city)        ; direct flight exists from ?c1 to ?c2
  )

  ;; Stay in the same city from one day to the next (traveler remains in same city)
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

  ;; Take a direct flight from one city to another between consecutive days
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