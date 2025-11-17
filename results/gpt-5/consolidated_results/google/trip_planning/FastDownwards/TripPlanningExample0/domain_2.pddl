(define (domain tripplanningexample0-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)
  (:predicates
    (at ?c - city ?d - day)
    (next ?d1 - day ?d2 - day)
    (direct ?from - city ?to - city)
    (window ?d - day)
    (reached ?d - day)
    (visited ?c - city)
    (met)
    (meeting-city ?c - city)
  )

  (:action stay
    :parameters (?c - city ?d - day ?d2 - day)
    :precondition (and (at ?c ?d) (next ?d ?d2))
    :effect (and
      (not (at ?c ?d))
      (at ?c ?d2)
      (reached ?d2)
      (visited ?c)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d - day ?d2 - day)
    :precondition (and
      (at ?from ?d)
      (next ?d ?d2)
      (direct ?from ?to)
    )
    :effect (and
      (not (at ?from ?d))
      (at ?to ?d2)
      (reached ?d2)
      (visited ?to)
    )
  )

  (:action meet
    :parameters (?c - city ?d - day ?d2 - day)
    :precondition (and
      (at ?c ?d)
      (next ?d ?d2)
      (window ?d2)
      (meeting-city ?c)
      (not (met))
    )
    :effect (and
      (not (at ?c ?d))
      (at ?c ?d2)
      (reached ?d2)
      (visited ?c)
      (met)
    )
  )
)