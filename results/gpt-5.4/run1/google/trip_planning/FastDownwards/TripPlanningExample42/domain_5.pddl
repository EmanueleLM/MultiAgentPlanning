(define (domain tripplanningexample42)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (at ?c - city)
    (direct ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (current_day ?d - day)
    (friend_window_day ?d - day)
    (met_friends)
    (visited_on ?c - city ?d - day)
  )

  (:action start_trip
    :parameters (?c - city)
    :precondition (and
      (current_day d1)
      (not (at paris))
      (not (at nice))
      (not (at mykonos))
    )
    :effect (and
      (at ?c)
      (visited_on ?c d1)
    )
  )

  (:action meet_friends
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (at paris)
      (friend_window_day ?d)
      (not (met_friends))
    )
    :effect (met_friends)
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at ?c)
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
      (direct ?from ?to)
      (not (at ?to))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (at ?from))
      (at ?to)
      (visited_on ?to ?d2)
    )
  )
)