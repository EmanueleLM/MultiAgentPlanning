(define (domain tripplanningexample32)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (direct ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (today ?d - day)
    (at ?c - city)
    (occupied ?c - city ?d - day)
    (final_day ?d - day)
  )

  (:action choose_start
    :parameters (?c - city)
    :precondition (and
      (today d1)
      (not (at paris))
      (not (at reykjavik))
      (not (at riga))
    )
    :effect (and
      (at ?c)
      (occupied ?c d1)
    )
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (today ?d1)
      (next ?d1 ?d2)
      (at ?c)
      (occupied ?c ?d1)
      (not (occupied paris ?d2))
      (not (occupied reykjavik ?d2))
      (not (occupied riga ?d2))
    )
    :effect (and
      (not (today ?d1))
      (today ?d2)
      (occupied ?c ?d2)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (today ?d1)
      (next ?d1 ?d2)
      (at ?from)
      (occupied ?from ?d1)
      (direct ?from ?to)
      (not (occupied paris ?d2))
      (not (occupied reykjavik ?d2))
      (not (occupied riga ?d2))
    )
    :effect (and
      (not (today ?d1))
      (today ?d2)
      (not (at ?from))
      (at ?to)
      (occupied ?to ?d2)
    )
  )
)