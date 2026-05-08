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
    (started)
  )

  (:action start_in_city
    :parameters (?c - city)
    :precondition (and
      (not (started))
    )
    :effect (and
      (started)
      (current_day day_1)
      (at ?c)
      (visited_on ?c day_1)
    )
  )

  (:action stay
    :parameters (?from_day - day ?to_day - day ?c - city)
    :precondition (and
      (started)
      (current_day ?from_day)
      (next_day ?from_day ?to_day)
      (at ?c)
      (not (visited_on ?c ?to_day))
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
      (started)
      (current_day ?from_day)
      (next_day ?from_day ?to_day)
      (at ?from)
      (direct_flight ?from ?to)
      (not (at ?to))
      (not (visited_on ?to ?to_day))
    )
    :effect (and
      (not (current_day ?from_day))
      (current_day ?to_day)
      (not (at ?from))
      (at ?to)
      (visited_on ?to ?to_day)
    )
  )

  (:action meet_friends_day_1
    :parameters ()
    :precondition (and
      (current_day day_1)
      (at venice)
      (not (met_friends))
    )
    :effect (met_friends)
  )

  (:action meet_friends_day_2
    :parameters ()
    :precondition (and
      (current_day day_2)
      (at venice)
      (not (met_friends))
    )
    :effect (met_friends)
  )

  (:action meet_friends_day_3
    :parameters ()
    :precondition (and
      (current_day day_3)
      (at venice)
      (not (met_friends))
    )
    :effect (met_friends)
  )

  (:action meet_friends_day_4
    :parameters ()
    :precondition (and
      (current_day day_4)
      (at venice)
      (not (met_friends))
    )
    :effect (met_friends)
  )
)