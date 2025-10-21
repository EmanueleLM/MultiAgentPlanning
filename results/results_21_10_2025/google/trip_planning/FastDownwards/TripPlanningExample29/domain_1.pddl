(define (domain travel-planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent city day)

  (:predicates
    (at ?a - agent ?c - city ?d - day)    ; agent is in city on a given day
    (next ?d1 - day ?d2 - day)           ; successor relation between days
    (occupied ?d - day)                  ; a day's location has been assigned
    (leg ?c1 - city ?c2 - city)          ; direct flight leg available between cities
  )

  ;; Stay in the same city for the next day
  (:action stay
    :parameters (?a - agent ?c - city ?d - day ?d2 - day)
    :precondition (and
      (at ?a ?c ?d)
      (next ?d ?d2)
      (not (occupied ?d2))
    )
    :effect (and
      (at ?a ?c ?d2)
      (occupied ?d2)
    )
  )

  ;; Fly along an available direct leg (one-day travel)
  (:action fly
    :parameters (?a - agent ?from - city ?to - city ?d - day ?d2 - day)
    :precondition (and
      (at ?a ?from ?d)
      (leg ?from ?to)
      (next ?d ?d2)
      (not (occupied ?d2))
    )
    :effect (and
      (at ?a ?to ?d2)
      (occupied ?d2)
    )
  )
)