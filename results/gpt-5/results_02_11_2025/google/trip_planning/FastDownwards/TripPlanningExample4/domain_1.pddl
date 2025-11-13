(define (domain trip-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day token)
  (:predicates
    (at ?c - city ?d - day)        ; being in a city on a given day
    (next ?d1 - day ?d2 - day)     ; day successor relation
    (connected ?c1 - city ?c2 - city) ; direct flight connectivity (bidirectional provided in problem)
    (decided ?d - day)             ; day has been assigned
    (unused ?t - token)            ; remaining flight tokens (limit total flights)
  )

  (:action stay
    :parameters (?c - city ?d - day ?d2 - day)
    :precondition (and
      (at ?c ?d)
      (next ?d ?d2)
      (not (decided ?d2))
    )
    :effect (and
      (at ?c ?d2)
      (decided ?d2)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d - day ?d2 - day ?t - token)
    :precondition (and
      (at ?from ?d)
      (next ?d ?d2)
      (connected ?from ?to)
      (unused ?t)
      (not (decided ?d2))
    )
    :effect (and
      (at ?to ?d2)
      (decided ?d2)
      (not (unused ?t))
    )
  )
)