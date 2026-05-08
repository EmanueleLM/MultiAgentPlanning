(define (domain european_trip_12_days)
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
    (met_friend)
  )

  (:action choose_start
    :parameters (?c - city ?d - day)
    :precondition (and
      (current_day ?d)
      (not (at seville))
      (not (at munich))
      (not (at tallinn))
      (not (visited_on seville ?d))
      (not (visited_on munich ?d))
      (not (visited_on tallinn ?d))
    )
    :effect (and
      (at ?c)
      (visited_on ?c ?d)
    )
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?c)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (not (visited_on seville ?d2))
      (not (visited_on munich ?d2))
      (not (visited_on tallinn ?d2))
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
      (not (at ?to))
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (direct_flight ?from ?to)
      (not (visited_on seville ?d2))
      (not (visited_on munich ?d2))
      (not (visited_on tallinn ?d2))
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
      (visited_on tallinn ?d)
      (not (met_friend))
    )
    :effect (and
      (met_friend)
    )
  )
)