(define (domain trip-planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types day city)

  (:predicates
    (at ?d - day ?c - city)              ; day ?d is assigned to city ?c
    (unassigned ?d - day)               ; day ?d has not yet been assigned
    (day-next ?d1 - day ?d2 - day)      ; ?d2 is the successor day of ?d1
    (connected ?c1 - city ?c2 - city)   ; direct flight (or staying) allowed between cities
  )

  ;; Assign the city for the successor day given the city on the previous day and connectivity.
  ;; This enforces contiguous, day-by-day construction: each day is assigned exactly once,
  ;; and transitions are only allowed along declared connections (including self-loops for stays).
  (:action assign-next
    :parameters (?d1 - day ?d2 - day ?c1 - city ?c2 - city)
    :precondition (and
      (day-next ?d1 ?d2)
      (at ?d1 ?c1)
      (connected ?c1 ?c2)
      (unassigned ?d2)
    )
    :effect (and
      (not (unassigned ?d2))
      (at ?d2 ?c2)
    )
  )
)