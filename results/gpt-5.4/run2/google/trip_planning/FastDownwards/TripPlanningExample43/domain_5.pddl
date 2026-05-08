(define (domain trip_planning_example43)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (at ?c - city)
    (direct_flight ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (current ?d - day)
    (visited_on ?c - city ?d - day)
    (friends_window ?d - day)
    (met_friends)
  )

  (:action start_at
    :parameters (?c - city)
    :precondition (and
      (current d1)
      (not (at dublin))
      (not (at porto))
      (not (at venice))
    )
    :effect (and
      (at ?c)
      (visited_on ?c d1)
    )
  )

  (:action stay
    :parameters (?from - day ?to - day ?c - city)
    :precondition (and
      (current ?from)
      (next ?from ?to)
      (at ?c)
    )
    :effect (and
      (not (current ?from))
      (current ?to)
      (visited_on ?c ?to)
    )
  )

  (:action fly
    :parameters (?from_day - day ?to_day - day ?from_city - city ?to_city - city)
    :precondition (and
      (current ?from_day)
      (next ?from_day ?to_day)
      (at ?from_city)
      (direct_flight ?from_city ?to_city)
      (not (= ?from_city ?to_city))
    )
    :effect (and
      (not (current ?from_day))
      (current ?to_day)
      (not (at ?from_city))
      (at ?to_city)
      (visited_on ?to_city ?to_day)
    )
  )

  (:action meet_friends
    :parameters (?d - day)
    :precondition (and
      (current ?d)
      (at venice)
      (friends_window ?d)
      (not (met_friends))
    )
    :effect (met_friends)
  )
)