(define (domain jack_of_all_trades_trip)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)
  (:predicates
    (city ?c - city)
    (day ?d - day)
    (flight ?from - city ?to - city)
    (next ?d - day ?dn - day)
    (at ?c - city ?d - day)
  )

  (:action stay
    :parameters (?c - city ?d - day ?dn - day)
    :precondition (and
      (at ?c ?d)
      (next ?d ?dn)
      (not (at paris ?dn))
      (not (at istanbul ?dn))
      (not (at salzburg ?dn))
    )
    :effect (and
      (at ?c ?dn)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d - day ?dn - day)
    :precondition (and
      (at ?from ?d)
      (flight ?from ?to)
      (next ?d ?dn)
      (not (at paris ?dn))
      (not (at istanbul ?dn))
      (not (at salzburg ?dn))
    )
    :effect (and
      (at ?to ?dn)
    )
  )
)