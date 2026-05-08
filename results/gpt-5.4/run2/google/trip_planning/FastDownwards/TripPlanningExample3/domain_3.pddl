(define (domain european_trip_6_days)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (at ?c - city)
    (direct_flight ?from - city ?to - city)
    (current_day ?d - day)
    (next ?d1 - day ?d2 - day)
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
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?from)
      (direct_flight ?from ?to)
      (current_day ?d1)
      (next ?d1 ?d2)
      (not (visited ?d1 ?to))
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (visited ?d1 ?to)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action meet_friend
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at bucharest)
      (current_day ?d1)
      (next ?d1 ?d2)
      (friend_window ?d1)
      (not (met_friend))
      (not (visited ?d1 bucharest))
    )
    :effect (and
      (visited ?d1 bucharest)
      (met_friend)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )
)