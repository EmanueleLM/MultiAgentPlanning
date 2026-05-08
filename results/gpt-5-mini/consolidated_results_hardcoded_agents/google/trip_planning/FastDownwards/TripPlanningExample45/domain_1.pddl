(define (domain trip_scheduling)
  (:requirements :typing :negative-preconditions)
  (:types day city)
  (:predicates
    (next ?d1 - day ?d2 - day)
    (flight ?from - city ?to - city)
    (at ?d - day ?c - city)
    (assigned ?d - day)
  )
  (:action assign-next-day
    :parameters (?dprev - day ?d - day ?from - city ?to - city)
    :precondition (and
      (next ?dprev ?d)
      (at ?dprev ?from)
      (flight ?from ?to)
      (not (assigned ?d))
    )
    :effect (and
      (assigned ?d)
      (at ?d ?to)
    )
  )
)