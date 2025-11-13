(define (domain travel-days)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (edge ?from - city ?to - city)     ; direct flight connectivity (declared both directions when appropriate)
    (succ ?d1 - day ?d2 - day)         ; successor relation between consecutive days
    (at ?c - city ?d - day)            ; traveler is at city ?c on day ?d
    (occupied ?d - day)                ; day ?d has been assigned/occupied
  )

  ;; Travel along a direct flight edge from ?from on day ?d1 to arrive in ?to on day ?d2 (successor day).
  ;; Requires that arrival day is not yet occupied.
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
  ;; Requires that the next day is not yet occupied.
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