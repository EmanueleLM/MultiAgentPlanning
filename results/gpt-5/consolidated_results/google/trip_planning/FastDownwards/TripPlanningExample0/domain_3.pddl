(define (domain tripplanningexample0-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)
  (:predicates
    (at ?c - city ?d - day)
    (next ?d1 - day ?d2 - day)
    (direct ?from - city ?to - city)

    (seg1-city ?c - city)
    (seg2-city ?c - city)
    (seg3-city ?c - city)

    (seg1-step ?d1 - day ?d2 - day)
    (seg1-to-seg2 ?d1 - day ?d2 - day)
    (seg2-step ?d1 - day ?d2 - day)
    (seg2-to-seg3 ?d1 - day ?d2 - day)
    (seg3-step ?d1 - day ?d2 - day)

    (window ?d - day)
    (meeting-city ?c - city)
    (reached ?d - day)
    (met)
  )

  (:action stay-seg1
    :parameters (?c - city ?d - day ?d2 - day)
    :precondition (and
      (seg1-city ?c)
      (at ?c ?d)
      (seg1-step ?d ?d2)
      (next ?d ?d2)
    )
    :effect (and
      (not (at ?c ?d))
      (at ?c ?d2)
      (reached ?d2)
    )
  )

  (:action fly-seg1-to-seg2
    :parameters (?from - city ?to - city ?d - day ?d2 - day)
    :precondition (and
      (seg1-city ?from)
      (seg2-city ?to)
      (at ?from ?d)
      (seg1-to-seg2 ?d ?d2)
      (next ?d ?d2)
      (direct ?from ?to)
    )
    :effect (and
      (not (at ?from ?d))
      (at ?to ?d2)
      (reached ?d2)
    )
  )

  (:action stay-seg2
    :parameters (?c - city ?d - day ?d2 - day)
    :precondition (and
      (seg2-city ?c)
      (at ?c ?d)
      (seg2-step ?d ?d2)
      (next ?d ?d2)
    )
    :effect (and
      (not (at ?c ?d))
      (at ?c ?d2)
      (reached ?d2)
    )
  )

  (:action fly-seg2-to-seg3
    :parameters (?from - city ?to - city ?d - day ?d2 - day)
    :precondition (and
      (seg2-city ?from)
      (seg3-city ?to)
      (at ?from ?d)
      (seg2-to-seg3 ?d ?d2)
      (next ?d ?d2)
      (direct ?from ?to)
    )
    :effect (and
      (not (at ?from ?d))
      (at ?to ?d2)
      (reached ?d2)
    )
  )

  (:action stay-seg3
    :parameters (?c - city ?d - day ?d2 - day)
    :precondition (and
      (seg3-city ?c)
      (at ?c ?d)
      (seg3-step ?d ?d2)
      (next ?d ?d2)
    )
    :effect (and
      (not (at ?c ?d))
      (at ?c ?d2)
      (reached ?d2)
    )
  )

  (:action meet-in-city
    :parameters (?c - city ?d - day ?d2 - day)
    :precondition (and
      (seg3-city ?c)
      (meeting-city ?c)
      (at ?c ?d)
      (seg3-step ?d ?d2)
      (next ?d ?d2)
      (window ?d2)
      (not (met))
    )
    :effect (and
      (not (at ?c ?d))
      (at ?c ?d2)
      (reached ?d2)
      (met)
    )
  )
)