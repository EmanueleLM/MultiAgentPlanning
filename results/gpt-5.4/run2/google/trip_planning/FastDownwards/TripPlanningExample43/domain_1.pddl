(define (domain european_trip_10_days_instance)
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
    (met_friends)
  )

  (:action start_in_city
    :parameters (?c - city)
    :precondition (and
      (not (current_day d1))
      (not (current_day d2))
      (not (current_day d3))
      (not (current_day d4))
      (not (current_day d5))
      (not (current_day d6))
      (not (current_day d7))
      (not (current_day d8))
      (not (current_day d9))
      (not (current_day d10))
      (not (at dublin))
      (not (at porto))
      (not (at venice))
    )
    :effect (and
      (current_day d1)
      (at ?c)
      (visited_on ?c d1)
    )
  )

  (:action stay
    :parameters (?from_day - day ?to_day - day ?c - city)
    :precondition (and
      (current_day ?from_day)
      (next_day ?from_day ?to_day)
      (at ?c)
    )
    :effect (and
      (not (current_day ?from_day))
      (current_day ?to_day)
      (visited_on ?c ?to_day)
    )
  )

  (:action fly
    :parameters (?from_day - day ?to_day - day ?from - city ?to - city)
    :precondition (and
      (current_day ?from_day)
      (next_day ?from_day ?to_day)
      (at ?from)
      (direct_flight ?from ?to)
      (not (at ?to))
    )
    :effect (and
      (not (current_day ?from_day))
      (current_day ?to_day)
      (not (at ?from))
      (at ?to)
      (visited_on ?to ?to_day)
    )
  )

  (:action meet_friends_on_d1
    :parameters ()
    :precondition (and
      (current_day d1)
      (at venice)
      (not (met_friends))
    )
    :effect (met_friends)
  )

  (:action meet_friends_on_d2
    :parameters ()
    :precondition (and
      (current_day d2)
      (at venice)
      (not (met_friends))
    )
    :effect (met_friends)
  )

  (:action meet_friends_on_d3
    :parameters ()
    :precondition (and
      (current_day d3)
      (at venice)
      (not (met_friends))
    )
    :effect (met_friends)
  )

  (:action meet_friends_on_d4
    :parameters ()
    :precondition (and
      (current_day d4)
      (at venice)
      (not (met_friends))
    )
    :effect (met_friends)
  )
)