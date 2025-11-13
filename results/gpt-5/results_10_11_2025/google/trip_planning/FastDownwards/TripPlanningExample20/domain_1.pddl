(define (domain tripplanningexample20)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)
  (:predicates
    (at ?c - city)
    (edge ?from - city ?to - city)
    (order-next ?from - city ?to - city)
    (phase ?c - city)
    (currday ?d - day)
    (next ?d1 - day ?d2 - day)
    (dec ?d1 - day ?d2 - day)
    (rem ?c - city ?d - day)
  )

  (:action fly
    :parameters (?from - city ?to - city)
    :precondition (and
      (at ?from)
      (edge ?from ?to)
      (phase ?from)
      (order-next ?from ?to)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (phase ?from))
      (phase ?to)
    )
  )

  (:action stay-one-day
    :parameters (?c - city ?g1 - day ?g2 - day ?r1 - day ?r2 - day)
    :precondition (and
      (at ?c)
      (currday ?g1)
      (next ?g1 ?g2)
      (rem ?c ?r1)
      (dec ?r1 ?r2)
    )
    :effect (and
      (not (currday ?g1))
      (currday ?g2)
      (not (rem ?c ?r1))
      (rem ?c ?r2)
    )
  )
)