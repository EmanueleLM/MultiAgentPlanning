(define (domain tripplanningexample42)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (at ?c - city)
    (direct ?from - city ?to - city)
    (current ?d - day)
    (next ?d - day ?dn - day)
    (day_city ?d - day ?c - city)
    (friends_window ?d - day)
    (met_friends)
  )

  (:action stay
    :parameters (?d - day ?dn - day ?c - city)
    :precondition (and
      (current ?d)
      (next ?d ?dn)
      (at ?c)
      (day_city ?d ?c)
    )
    :effect (and
      (not (current ?d))
      (current ?dn)
    )
  )

  (:action fly
    :parameters (?d - day ?dn - day ?from - city ?to - city)
    :precondition (and
      (current ?d)
      (next ?d ?dn)
      (at ?from)
      (day_city ?d ?from)
      (direct ?from ?to)
      (day_city ?dn ?to)
      (not (= ?from ?to))
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current ?d))
      (current ?dn)
    )
  )

  (:action meet_friends
    :parameters (?d - day)
    :precondition (and
      (current ?d)
      (friends_window ?d)
      (at paris)
      (day_city ?d paris)
      (not (met_friends))
    )
    :effect (met_friends)
  )
)