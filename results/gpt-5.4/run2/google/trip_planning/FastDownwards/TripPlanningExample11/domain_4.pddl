(define (domain tripplanningexample11)
  (:requirements :strips :typing)
  (:types city day)

  (:predicates
    (direct ?from - city ?to - city)
    (next_day ?d1 - day ?d2 - day)
    (at ?c - city ?d - day)
    (occupied ?d - day)
  )

  (:action start_trip
    :parameters (?c - city ?d - day)
    :precondition (and
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
      (at ?c ?d1)
      (next_day ?d1 ?d2)
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
      (at ?from ?d1)
      (next_day ?d1 ?d2)
      (direct ?from ?to)
      (not (occupied ?d2))
    )
    :effect (and
      (at ?to ?d2)
      (occupied ?d2)
    )
  )
)