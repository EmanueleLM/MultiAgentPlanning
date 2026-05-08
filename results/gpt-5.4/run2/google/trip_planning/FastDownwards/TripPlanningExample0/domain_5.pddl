(define (domain european_trip_14_days)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:constants
    florence - city
  )

  (:predicates
    (at ?c - city)
    (direct_flight ?from - city ?to - city)
    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (in_friend_window ?d - day)
    (visited ?c - city ?d - day)
    (friend_met)
  )

  (:action fly
    :parameters (?from - city ?to - city)
    :precondition (and
      (at ?from)
      (direct_flight ?from ?to)
      (not (at ?to))
    )
    :effect (and
      (not (at ?from))
      (at ?to)
    )
  )

  (:action spend_day
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?c)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (not (visited ?c ?d1))
    )
    :effect (and
      (visited ?c ?d1)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action spend_day_meet_friend
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at florence)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (in_friend_window ?d1)
      (not (visited florence ?d1))
      (not (friend_met))
    )
    :effect (and
      (visited florence ?d1)
      (friend_met)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )
)