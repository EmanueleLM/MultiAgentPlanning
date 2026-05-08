(define (domain orchestrator-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types day city)
  (:predicates
    (next ?d1 - day ?d2 - day)        ; successor relation between days
    (assigned ?d - day)              ; this day has been assigned a city for the traveler
    (at ?c - city ?d - day)          ; traveler is in city ?c on day ?d
    (can-fly ?from - city ?to - city) ; allowed direct flight leg (network connectivity)
  )

  ; Stay in the same city from one day to the next (counts the next day as being in the same city).
  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (assigned ?d1)
      (at ?c ?d1)
      (next ?d1 ?d2)
      (not (assigned ?d2))
    )
    :effect (and
      (assigned ?d2)
      (at ?c ?d2)
    )
  )

  ; Fly in the morning from ?from to ?to and arrive in ?to on the successor day.
  ; Use only allowed direct legs (can-fly facts define allowed direct flights).
  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (assigned ?d1)
      (at ?from ?d1)
      (next ?d1 ?d2)
      (can-fly ?from ?to)
      (not (assigned ?d2))
    )
    :effect (and
      (assigned ?d2)
      (at ?to ?d2)
    )
  )
)