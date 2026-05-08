(define (domain european_trip_14_days)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city day
  )

  (:predicates
    (at ?c - city)
    (direct_flight ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (current_day ?d - day)
    (occupied ?d - day)
    (visited_on ?c - city ?d - day)
    (friend_window ?d - day)
    (met_friend)
  )

  (:action start_trip
    :parameters (?c - city)
    :precondition (and
      (current_day day_1)
      (not (occupied day_1))
      (not (at barcelona))
      (not (at florence))
      (not (at helsinki))
    )
    :effect (and
      (at ?c)
      (occupied day_1)
      (visited_on ?c day_1)
    )
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at ?c)
      (occupied ?d1)
      (not (occupied ?d2))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (occupied ?d2)
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
      (occupied ?d1)
      (not (occupied ?d2))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (at ?from))
      (at ?to)
      (occupied ?d2)
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