(define (domain travel-days)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (edge ?from - city ?to - city)     ; direct flight connectivity (directed; both directions can be declared)
    (succ ?d1 - day ?d2 - day)         ; successor relation between consecutive days
    (at ?c - city ?d - day)            ; traveler is at city ?c on day ?d
    (occupied ?d - day)                ; day ?d has been assigned/occupied (prevents multiple assignments for same day)
  )

  ;; Travel along a direct flight edge from ?from on day ?d1 to arrive in ?to on day ?d2 (which must be the successor of ?d1).
  ;; Requires that the arrival day is not yet occupied.
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

  ;; Stay in the same city from day ?d1 to day ?d2 (the next day).
  ;; Requires that the arrival day is not yet occupied.
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