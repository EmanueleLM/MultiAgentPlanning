(define (domain tripplanningexample23)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (at ?c - city)
    (direct ?from - city ?to - city)
    (current ?d - day)
    (next ?d1 - day ?d2 - day)
    (visited_day ?d - day ?c - city)
    (required ?c - city ?d - day)
  )

  (:action stay
    :parameters (?c - city ?d - day ?dn - day)
    :precondition (and
      (at ?c)
      (current ?d)
      (next ?d ?dn)
      (required ?c ?d)
      (not (visited_day ?d ?c)))
    :effect (and
      (visited_day ?d ?c)
      (not (current ?d))
      (current ?dn))
  )

  (:action fly
    :parameters (?from - city ?to - city ?d - day ?dn - day)
    :precondition (and
      (at ?from)
      (current ?d)
      (next ?d ?dn)
      (direct ?from ?to)
      (required ?to ?d)
      (not (visited_day ?d ?to)))
    :effect (and
      (not (at ?from))
      (at ?to)
      (visited_day ?d ?to)
      (not (current ?d))
      (current ?dn))
  )
)