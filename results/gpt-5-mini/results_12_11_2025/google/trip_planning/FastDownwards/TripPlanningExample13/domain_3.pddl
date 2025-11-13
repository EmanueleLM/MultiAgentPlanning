(define (domain travel-days)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (edge ?from - city ?to - city)     ; direct flight connectivity (bidirectional facts in problem)
    (succ ?d1 - day ?d2 - day)         ; successor relation between consecutive days
    (at ?c - city ?d - day)            ; traveler is at city ?c on day ?d
    (occupied ?d - day)                ; day ?d has been assigned/occupied
    (relatives-window ?d - day)        ; explicit marker for days that must be in Lyon
  )

  ;; Travel along a direct flight edge from ?from on day ?d1 to arrive in ?to on day ?d2 (successor day).
  ;; Arrival day must be unoccupied to prevent multiple assignments for the same day.
  (:action travel
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?from ?d1)
      (edge ?from ?to)
      (succ ?d1 ?d2)
      (not (occupied ?d2))
    )
    :effect (and
      (at ?to ?d2)
      (occupied ?d2)
    )
  )

  ;; Stay in the same city from day ?d1 to the next day ?d2.
  ;; Next day must be unoccupied to ensure contiguous assignment is built stepwise.
  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?c ?d1)
      (succ ?d1 ?d2)
      (not (occupied ?d2))
    )
    :effect (and
      (at ?c ?d2)
      (occupied ?d2)
    )
  )
)