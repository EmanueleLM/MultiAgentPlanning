(define (domain european_trip_12_days)
  (:requirements :strips :typing)

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
    (met_friend)
  )

  (:action choose_start
    :parameters (?c - city)
    :precondition (current_day day_1)
    :effect (and
      (at ?c)
      (visited_on ?c day_1)
    )
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?c)
      (current_day ?d1)
      (next_day ?d1 ?d2)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (visited_on ?c ?d2)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?from)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (direct_flight ?from ?to)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_day ?d1))
      (current_day ?d2)
      (visited_on ?to ?d2)
    )
  )

  (:action meet_friend
    :parameters (?d - day)
    :precondition (and
      (at tallinn)
      (current_day ?d)
      (friend_window ?d)
    )
    :effect (met_friend)
  )
)