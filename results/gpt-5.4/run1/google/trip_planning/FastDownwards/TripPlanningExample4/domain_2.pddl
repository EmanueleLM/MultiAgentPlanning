(define (domain european_trip_12_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (at ?c - city)
    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (direct ?from - city ?to - city)

    (visited_on ?c - city ?d - day)
    (friend_window ?d - day)
    (met_friend)
  )

  (:action start_day_1
    :parameters (?c - city)
    :precondition (and
      (current_day day_1)
      (not (at seville))
      (not (at munich))
      (not (at tallinn))
    )
    :effect (and
      (at ?c)
      (visited_on ?c day_1)
    )
  )

  (:action stay_to_next_day
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

  (:action fly_to_next_day
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?from)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (direct ?from ?to)
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
      (not (met_friend))
    )
    :effect (and
      (met_friend)
    )
  )
)