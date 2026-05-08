(define (domain european_trip_11_days)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (direct ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (at ?c - city ?d - day)
    (current_day ?d - day)
    (need_stay ?c - city ?d - day)
    (friend_window ?d - day)
    (met_friends)
  )

  (:action start
    :parameters (?c - city)
    :precondition (current_day day_1)
    :effect (at ?c day_1)
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at ?c ?d1)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at ?c ?d2)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at ?from ?d1)
      (direct ?from ?to)
      (not (at ?from ?d2))
      (not (at ?to ?d2))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at ?to ?d2)
    )
  )

  (:action meet_friends
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (friend_window ?d)
      (at bucharest ?d)
      (not (met_friends))
    )
    :effect (met_friends)
  )
)