(define (domain european_trip_12_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (at ?c - city)
    (current_day ?d - day)
    (next ?d1 - day ?d2 - day)
    (direct ?from - city ?to - city)

    (visited ?c - city ?d - day)

    (friend_window ?d - day)
    (met_friend)

    (start_chosen)
  )

  (:action choose_start_city
    :parameters (?c - city)
    :precondition (and
      (current_day day1)
      (not (start_chosen))
    )
    :effect (and
      (start_chosen)
      (at ?c)
      (visited ?c day1)
    )
  )

  (:action stay_next_day
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?c)
      (current_day ?d1)
      (next ?d1 ?d2)
      (not (visited seville ?d2))
      (not (visited munich ?d2))
      (not (visited tallinn ?d2))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (visited ?c ?d2)
    )
  )

  (:action fly_next_day
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?from)
      (current_day ?d1)
      (next ?d1 ?d2)
      (direct ?from ?to)
      (not (visited seville ?d2))
      (not (visited munich ?d2))
      (not (visited tallinn ?d2))
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_day ?d1))
      (current_day ?d2)
      (visited ?to ?d2)
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
    :effect (met_friend)
  )
)