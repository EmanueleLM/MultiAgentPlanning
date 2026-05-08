(define (domain european_trip_13_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (direct ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (today ?d - day)
    (in ?c - city ?d - day)
    (occupied ?d - day)
    (friend_window ?d - day)
    (met_friend)
  )

  (:action start_in_city
    :parameters (?c - city)
    :precondition (and
      (today day1)
      (not (occupied day1))
    )
    :effect (and
      (in ?c day1)
      (occupied day1)
    )
  )

  (:action stay_next_day
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (today ?d1)
      (next ?d1 ?d2)
      (in ?c ?d1)
      (occupied ?d1)
      (not (occupied ?d2))
    )
    :effect (and
      (not (today ?d1))
      (today ?d2)
      (in ?c ?d2)
      (occupied ?d2)
    )
  )

  (:action fly_next_day
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (today ?d1)
      (next ?d1 ?d2)
      (in ?from ?d1)
      (occupied ?d1)
      (direct ?from ?to)
      (not (occupied ?d2))
      (not (= ?from ?to))
    )
    :effect (and
      (not (today ?d1))
      (today ?d2)
      (in ?to ?d2)
      (occupied ?d2)
    )
  )

  (:action meet_friend
    :parameters (?d - day)
    :precondition (and
      (today ?d)
      (in krakow ?d)
      (friend_window ?d)
      (not (met_friend))
    )
    :effect (met_friend)
  )
)