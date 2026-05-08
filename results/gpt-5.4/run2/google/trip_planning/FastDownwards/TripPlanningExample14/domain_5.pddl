(define (domain european_trip_10_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types city day)

  (:predicates
    (direct ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (at ?c - city ?d - day)
    (occupied ?d - day)
    (day_1_marker)
  )

  (:action start
    :parameters (?c - city ?d - day)
    :precondition (and
      (day_1_marker)
      (not (occupied ?d))
    )
    :effect (and
      (at ?c ?d)
      (occupied ?d)
    )
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (next ?d1 ?d2)
      (at ?c ?d1)
      (occupied ?d1)
      (not (occupied ?d2))
    )
    :effect (and
      (at ?c ?d2)
      (occupied ?d2)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (next ?d1 ?d2)
      (at ?from ?d1)
      (occupied ?d1)
      (direct ?from ?to)
      (not (occupied ?d2))
      (not (at ?from ?d2))
    )
    :effect (and
      (at ?to ?d2)
      (occupied ?d2)
    )
  )
)