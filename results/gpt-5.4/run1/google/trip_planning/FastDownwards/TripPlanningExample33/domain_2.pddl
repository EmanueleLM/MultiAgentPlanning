(define (domain european_trip_13_days_instance)
  (:requirements :strips :typing)

  (:types
    city
    day
  )

  (:predicates
    (at ?c - city)
    (current_day ?d - day)
    (next ?d1 - day ?d2 - day)
    (direct ?from - city ?to - city)

    (spent ?d - day ?c - city)

    (friend_window ?d - day)
    (met_friend)
  )

  (:action stay
    :parameters (?c - city ?d - day ?d2 - day)
    :precondition (and
      (at ?c)
      (current_day ?d)
      (next ?d ?d2)
    )
    :effect (and
      (spent ?d ?c)
      (not (current_day ?d))
      (current_day ?d2)
    )
  )

  (:action stay_and_meet_friend
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (at krakow)
      (current_day ?d)
      (next ?d ?d2)
      (friend_window ?d)
    )
    :effect (and
      (spent ?d krakow)
      (met_friend)
      (not (current_day ?d))
      (current_day ?d2)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d - day ?d2 - day)
    :precondition (and
      (at ?from)
      (current_day ?d)
      (next ?d ?d2)
      (direct ?from ?to)
    )
    :effect (and
      (spent ?d ?to)
      (not (at ?from))
      (at ?to)
      (not (current_day ?d))
      (current_day ?d2)
    )
  )

  (:action fly_and_meet_friend
    :parameters (?from - city ?d - day ?d2 - day)
    :precondition (and
      (at ?from)
      (current_day ?d)
      (next ?d ?d2)
      (direct ?from krakow)
      (friend_window ?d)
    )
    :effect (and
      (spent ?d krakow)
      (met_friend)
      (not (at ?from))
      (at krakow)
      (not (current_day ?d))
      (current_day ?d2)
    )
  )
)