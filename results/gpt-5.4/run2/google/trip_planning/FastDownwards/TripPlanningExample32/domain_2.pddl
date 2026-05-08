(define (domain tripplanningexample32)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (direct ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (at ?c - city ?d - day)
    (current ?d - day)
    (visited ?c - city)
  )

  (:action start
    :parameters (?c - city)
    :precondition (and
      (current day1)
      (not (visited ?c))
    )
    :effect (and
      (at ?c day1)
      (visited ?c)
    )
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (current ?d1)
      (next ?d1 ?d2)
      (at ?c ?d1)
    )
    :effect (and
      (not (current ?d1))
      (current ?d2)
      (at ?c ?d2)
      (visited ?c)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (current ?d1)
      (next ?d1 ?d2)
      (at ?from ?d1)
      (direct ?from ?to)
      (not (at ?to ?d1))
    )
    :effect (and
      (not (current ?d1))
      (current ?d2)
      (at ?to ?d2)
      (visited ?to)
    )
  )
)