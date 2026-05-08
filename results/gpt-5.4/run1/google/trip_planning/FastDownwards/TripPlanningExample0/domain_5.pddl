(define (domain european_trip_14_days)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (at ?c - city)
    (direct_flight ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (current_day ?d - day)
    (visited_on ?c - city ?d - day)
    (friend_window ?d - day)
    (met_friend)
    (started)
  )

  (:action start_trip
    :parameters (?c - city)
    :precondition (and
      (current_day day_1)
      (not (started))
      (not (at barcelona))
      (not (at florence))
      (not (at helsinki))
    )
    :effect (and
      (started)
      (at ?c)
      (visited_on ?c day_1)
    )
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at ?c)
      (started)
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
      (current_day ?d1)
      (next ?d1 ?d2)
      (at ?from)
      (direct_flight ?from ?to)
      (started)
      (not (= ?from ?to))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (at ?from))
      (at ?to)
      (visited_on ?to ?d2)
    )
  )

  (:action meet_friend
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (at florence)
      (friend_window ?d)
      (not (met_friend))
    )
    :effect (met_friend)
  )
)