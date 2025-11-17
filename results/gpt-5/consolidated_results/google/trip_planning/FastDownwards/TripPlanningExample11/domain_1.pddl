(define (domain travel-days)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    city day
  )
  (:predicates
    (at ?c - city)
    (current_day ?d - day)
    (next ?d1 - day ?d2 - day)
    (direct ?c1 - city ?c2 - city)
    (need ?d - day ?c - city)
    (satisfied ?d - day)
  )

  (:action stay
    :parameters (?c - city ?d - day ?d2 - day)
    :precondition (and
      (at ?c)
      (current_day ?d)
      (next ?d ?d2)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d - day ?d2 - day)
    :precondition (and
      (at ?from)
      (current_day ?d)
      (next ?d ?d2)
      (direct ?from ?to)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_day ?d))
      (current_day ?d2)
    )
  )

  (:action mark
    :parameters (?c - city ?d - day)
    :precondition (and
      (at ?c)
      (current_day ?d)
      (need ?d ?c)
      (not (satisfied ?d))
    )
    :effect (and
      (satisfied ?d)
    )
  )
)