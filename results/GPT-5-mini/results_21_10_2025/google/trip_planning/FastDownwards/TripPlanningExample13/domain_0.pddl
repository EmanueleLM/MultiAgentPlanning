(define (domain trip_planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent city day)

  (:predicates
    (direct ?from - city ?to - city)        ; direct flight leg available from->to (directed)
    (next ?d1 - day ?d2 - day)              ; temporal successor relation between days
    (at ?a - agent ?c - city ?d - day)      ; agent a is located in city c on day d
    (unused ?d - day)                       ; day d has not yet been assigned a city (except initial day)
  )

  ;; Stay in same city from day d1 to d2 (d2 must be next of d1). Consumes unused(d2) and assigns location.
  (:action stay
    :parameters (?a - agent ?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?a ?c ?d1)
      (next ?d1 ?d2)
      (unused ?d2)
    )
    :effect (and
      (at ?a ?c ?d2)
      (not (unused ?d2))
    )
  )

  ;; Fly along a direct leg from 'from' to 'to' between consecutive days. Consumes unused(d2) and assigns location.
  (:action fly
    :parameters (?a - agent ?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?a ?from ?d1)
      (direct ?from ?to)
      (next ?d1 ?d2)
      (unused ?d2)
    )
    :effect (and
      (at ?a ?to ?d2)
      (not (unused ?d2))
    )
  )
)