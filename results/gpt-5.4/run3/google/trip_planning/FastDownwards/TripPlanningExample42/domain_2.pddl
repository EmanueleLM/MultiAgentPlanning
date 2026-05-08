(define (domain tripplanningexample42)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (at ?c - city)
    (direct_flight ?from - city ?to - city)
    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (visited_on ?c - city ?d - day)
    (friend_window ?d - day)
    (met_friends)
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?c)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (not (visited_on ?c ?d1))
    )
    :effect (and
      (visited_on ?c ?d1)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?from)
      (not (at ?to))
      (direct_flight ?from ?to)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (not (visited_on ?from ?d1))
    )
    :effect (and
      (visited_on ?from ?d1)
      (not (at ?from))
      (at ?to)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action meet_friends
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (at paris)
      (friend_window ?d)
      (not (met_friends))
    )
    :effect (met_friends)
  )
)