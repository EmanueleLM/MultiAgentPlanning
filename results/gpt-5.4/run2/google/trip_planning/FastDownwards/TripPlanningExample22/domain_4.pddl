(define (domain tripplanningexample22)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (at ?c - city)
    (direct_flight ?from - city ?to - city)
    (next ?d ?nd - day)
    (today ?d - day)
    (visited_on ?c - city ?d - day)
  )

  (:action stay
    :parameters (?c - city ?d ?nd - day)
    :precondition (and
      (at ?c)
      (today ?d)
      (next ?d ?nd)
    )
    :effect (and
      (not (today ?d))
      (today ?nd)
      (visited_on ?c ?nd)
    )
  )

  (:action fly
    :parameters (?from ?to - city ?d ?nd - day)
    :precondition (and
      (at ?from)
      (not (at ?to))
      (today ?d)
      (next ?d ?nd)
      (direct_flight ?from ?to)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (today ?d))
      (today ?nd)
      (visited_on ?to ?nd)
    )
  )
)