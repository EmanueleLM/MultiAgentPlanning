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
    (last_day ?d - day)
    (friend_window_day ?d - day)
    (met_friends)

    (visited_paris ?d - day)
    (visited_nice ?d - day)
    (visited_mykonos ?d - day)
  )

  (:action start_in_city
    :parameters (?c - city ?d - day)
    :precondition (and
      (current_day ?d)
      (not (at paris))
      (not (at nice))
      (not (at mykonos))
    )
    :effect (and
      (at ?c)
      (visited_paris ?d)
    )
  )

  (:action start_in_paris
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (not (at paris))
      (not (at nice))
      (not (at mykonos))
      (friend_window_day ?d)
      (not (met_friends))
    )
    :effect (and
      (at paris)
      (visited_paris ?d)
      (met_friends)
    )
  )

  (:action start_in_nice
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (not (at paris))
      (not (at nice))
      (not (at mykonos))
    )
    :effect (and
      (at nice)
      (visited_nice ?d)
    )
  )

  (:action start_in_mykonos
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (not (at paris))
      (not (at nice))
      (not (at mykonos))
    )
    :effect (and
      (at mykonos)
      (visited_mykonos ?d)
    )
  )

  (:action stay_paris
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at paris)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (visited_paris ?d2)
    )
  )

  (:action stay_nice
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at nice)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (visited_nice ?d2)
    )
  )

  (:action stay_mykonos
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at mykonos)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (visited_mykonos ?d2)
    )
  )

  (:action fly_paris_to_nice
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at paris)
      (direct paris nice)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (at paris))
      (at nice)
      (visited_nice ?d2)
    )
  )

  (:action fly_nice_to_paris
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at nice)
      (direct nice paris)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (at nice))
      (at paris)
      (visited_paris ?d2)
    )
  )

  (:action meet_friends_in_paris
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (at paris)
      (friend_window_day ?d)
      (not (met_friends))
    )
    :effect (and
      (met_friends)
    )
  )

  (:action fly_nice_to_mykonos
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at nice)
      (direct nice mykonos)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (at nice))
      (at mykonos)
      (visited_mykonos ?d2)
    )
  )

  (:action fly_mykonos_to_nice
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at mykonos)
      (direct mykonos nice)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (at mykonos))
      (at nice)
      (visited_nice ?d2)
    )
  )
)