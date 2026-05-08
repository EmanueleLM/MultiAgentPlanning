(define (domain trip_planning)
  (:requirements :strips :typing)
  (:types agent day city)

  (:predicates
    (next ?d1 - day ?d2 - day)
    (direct ?from - city ?to - city)
    (at ?a - agent ?c - city ?d - day)
    (day_free ?d - day)
  )

  (:action stay_assign
    :parameters (?a - agent ?c - city ?d1 - day ?d2 - day)
    :precondition (and (at ?a ?c ?d1) (next ?d1 ?d2) (day_free ?d2))
    :effect (and
      (at ?a ?c ?d2)
      (not (day_free ?d2))
    )
  )

  (:action fly_assign
    :parameters (?a - agent ?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and (at ?a ?from ?d1) (direct ?from ?to) (next ?d1 ?d2) (day_free ?d2))
    :effect (and
      (at ?a ?to ?d2)
      (not (day_free ?d2))
    )
  )
)