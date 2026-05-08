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
    (next ?d1 - day ?d2 - day)
    (last_day ?d - day)
    (visited_day ?d - day ?c - city)
    (met_friends)
    (trip_finished)
  )

  (:action stay
    :parameters (?c - city ?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?d2)
      (at ?c)
      (not (visited_day ?d ?c))
    )
    :effect (and
      (visited_day ?d ?c)
      (not (current_day ?d))
      (current_day ?d2)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?d2)
      (at ?from)
      (direct_flight ?from ?to)
      (not (visited_day ?d ?from))
    )
    :effect (and
      (visited_day ?d ?from)
      (not (at ?from))
      (at ?to)
      (not (current_day ?d))
      (current_day ?d2)
    )
  )

  (:action meet_friends
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (at venice)
      (not (met_friends))
      (not (visited_day ?d venice))
    )
    :effect (met_friends)
  )

  (:action final_stay
    :parameters (?c - city ?d - day)
    :precondition (and
      (current_day ?d)
      (last_day ?d)
      (at ?c)
      (not (visited_day ?d ?c))
    )
    :effect (and
      (visited_day ?d ?c)
      (trip_finished)
      (not (current_day ?d))
    )
  )
)