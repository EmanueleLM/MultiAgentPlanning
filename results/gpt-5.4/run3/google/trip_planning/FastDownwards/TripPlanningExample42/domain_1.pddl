(define (domain tripplanningexample42)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (at ?c - city)
    (day_now ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (direct_flight ?from - city ?to - city)

    (in_paris ?d - day)
    (in_nice ?d - day)
    (in_mykonos ?d - day)

    (friend_window ?d - day)
    (met_friends)
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?c)
      (day_now ?d1)
      (next_day ?d1 ?d2)
    )
    :effect (and
      (not (day_now ?d1))
      (day_now ?d2)
      (in_paris ?d1)
    )
  )

  (:action stay_paris
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at paris)
      (day_now ?d1)
      (next_day ?d1 ?d2)
    )
    :effect (and
      (not (day_now ?d1))
      (day_now ?d2)
      (in_paris ?d1)
    )
  )

  (:action stay_nice
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at nice)
      (day_now ?d1)
      (next_day ?d1 ?d2)
    )
    :effect (and
      (not (day_now ?d1))
      (day_now ?d2)
      (in_nice ?d1)
    )
  )

  (:action stay_mykonos
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at mykonos)
      (day_now ?d1)
      (next_day ?d1 ?d2)
    )
    :effect (and
      (not (day_now ?d1))
      (day_now ?d2)
      (in_mykonos ?d1)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?from)
      (not (at ?to))
      (day_now ?d1)
      (next_day ?d1 ?d2)
      (direct_flight ?from ?to)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (day_now ?d1))
      (day_now ?d2)
    )
  )

  (:action meet_friends
    :parameters (?d - day)
    :precondition (and
      (day_now ?d)
      (at paris)
      (friend_window ?d)
      (not (met_friends))
    )
    :effect (met_friends)
  )
)