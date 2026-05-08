(define (domain european_trip_11_days)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (direct ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (in ?c - city ?d - day)
    (current_day ?d - day)
    (visited ?c - city)
    (friend_window ?d - day)
    (met_friends)
  )

  (:action start_in_city
    :parameters (?c - city)
    :precondition (and
      (current_day day1)
      (not (in amsterdam day1))
      (not (in vilnius day1))
      (not (in bucharest day1))
    )
    :effect (and
      (in ?c day1)
      (visited ?c)
    )
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (in ?c ?d1)
      (not (in amsterdam ?d2))
      (not (in vilnius ?d2))
      (not (in bucharest ?d2))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (in ?c ?d2)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (in ?from ?d1)
      (direct ?from ?to)
      (not (in amsterdam ?d2))
      (not (in vilnius ?d2))
      (not (in bucharest ?d2))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (in ?to ?d2)
      (visited ?to)
    )
  )

  (:action meet_friends
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (friend_window ?d)
      (in bucharest ?d)
      (not (met_friends))
    )
    :effect (met_friends)
  )
)