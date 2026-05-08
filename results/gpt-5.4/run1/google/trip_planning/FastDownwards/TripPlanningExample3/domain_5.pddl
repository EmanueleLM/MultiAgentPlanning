(define (domain trip_planning_example3)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (at ?c - city)
    (direct ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (current_day ?d - day)
    (visited ?d - day ?c - city)
    (friend_window ?d - day)
    (met_friend)
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?c)
      (current_day ?d1)
      (next ?d1 ?d2)
      (not (visited ?d1 ?c))
    )
    :effect (and
      (visited ?d1 ?c)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city)
    :precondition (and
      (at ?from)
      (direct ?from ?to)
      (not (at ?to))
    )
    :effect (and
      (not (at ?from))
      (at ?to)
    )
  )

  (:action meet_friend
    :parameters (?d - day)
    :precondition (and
      (at bucharest)
      (friend_window ?d)
      (visited ?d bucharest)
      (not (met_friend))
    )
    :effect (and
      (met_friend)
    )
  )
)