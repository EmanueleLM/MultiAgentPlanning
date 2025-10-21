(define (domain trip_planning_constraints)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent city day)

  (:predicates
    (direct ?from - city ?to - city)         ; direct flight from->to (directed)
    (next ?d1 - day ?d2 - day)               ; temporal successor relation between consecutive days
    (at ?a - agent ?c - city ?d - day)       ; agent a is located in city c on day d
    (unused ?d - day)                        ; day d has not yet been assigned a city
    (forbid ?d - day ?c - city)              ; being in city c on day d is forbidden by constraints
  )

  ;; Stay in same city from d1 to d2 (d2 is next of d1). Requires that being in target city on d2 is not forbidden.
  (:action stay
    :parameters (?a - agent ?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?a ?c ?d1)
      (next ?d1 ?d2)
      (unused ?d2)
      (not (forbid ?d2 ?c))
    )
    :effect (and
      (at ?a ?c ?d2)
      (not (unused ?d2))
    )
  )

  ;; Fly along a direct leg from 'from' to 'to' between consecutive days. Target city on d2 must not be forbidden.
  (:action fly
    :parameters (?a - agent ?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?a ?from ?d1)
      (direct ?from ?to)
      (next ?d1 ?d2)
      (unused ?d2)
      (not (forbid ?d2 ?to))
    )
    :effect (and
      (at ?a ?to ?d2)
      (not (unused ?d2))
    )
  )
)