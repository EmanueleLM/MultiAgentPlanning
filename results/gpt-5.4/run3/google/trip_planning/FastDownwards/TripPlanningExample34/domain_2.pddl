(define (domain tripplanningexample34)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (direct ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (current ?d - day)
    (at ?c - city)
    (occupied ?d - day ?c - city)
    (final_day ?d - day)
  )

  (:action stay
    :parameters (?d - day ?d2 - day ?c - city)
    :precondition (and
      (current ?d)
      (next ?d ?d2)
      (at ?c)
      (not (occupied ?d frankfurt))
      (not (occupied ?d florence))
      (not (occupied ?d valencia))
    )
    :effect (and
      (occupied ?d ?c)
      (not (current ?d))
      (current ?d2)
    )
  )

  (:action fly
    :parameters (?d - day ?d2 - day ?from - city ?to - city)
    :precondition (and
      (current ?d)
      (next ?d ?d2)
      (at ?from)
      (direct ?from ?to)
      (not (occupied ?d frankfurt))
      (not (occupied ?d florence))
      (not (occupied ?d valencia))
    )
    :effect (and
      (occupied ?d ?from)
      (not (at ?from))
      (at ?to)
      (not (current ?d))
      (current ?d2)
    )
  )

  (:action stay_last_day
    :parameters (?d - day ?c - city)
    :precondition (and
      (current ?d)
      (final_day ?d)
      (at ?c)
      (not (occupied ?d frankfurt))
      (not (occupied ?d florence))
      (not (occupied ?d valencia))
    )
    :effect (and
      (occupied ?d ?c)
      (not (current ?d))
    )
  )
)