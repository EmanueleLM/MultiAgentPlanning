(define (domain orchestrator-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types day city)
  (:predicates
    (next ?d1 - day ?d2 - day)         ; successor relation between days
    (assigned ?d - day)               ; day has been assigned a city
    (at ?c - city ?d - day)           ; traveler is in city ?c on day ?d
    (can-fly ?from - city ?to - city) ; allowed direct flight leg
  )

  ; Stay in the same city from one day to its successor day.
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

  ; Fly on a direct leg: depart on ?d1 and arrive on successor day ?d2.
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