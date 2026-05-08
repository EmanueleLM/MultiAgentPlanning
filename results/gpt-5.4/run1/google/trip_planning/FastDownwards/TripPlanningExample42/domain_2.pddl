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
    (paris_count_0)
    (paris_count_1)
    (paris_count_2)
    (paris_count_3)
    (paris_count_4)
    (nice_count_0)
    (nice_count_1)
    (nice_count_2)
    (nice_count_3)
    (nice_count_4)
    (nice_count_5)
    (mykonos_count_0)
    (mykonos_count_1)
    (mykonos_count_2)
    (mykonos_count_3)
    (mykonos_count_4)
  )

  (:action start_in_paris
    :parameters ()
    :precondition (and
      (current_day ?d)
      (friend_window_day ?d)
      (paris_count_0)
      (nice_count_0)
      (mykonos_count_0)
      (not (at paris))
      (not (at nice))
      (not (at mykonos))
    )
    :effect (and
      (at paris)
      (not (paris_count_0))
      (paris_count_1)
      (met_friends)
    )
  )

  (:action start_in_nice
    :parameters ()
    :precondition (and
      (current_day ?d)
      (paris_count_0)
      (nice_count_0)
      (mykonos_count_0)
      (not (at paris))
      (not (at nice))
      (not (at mykonos))
    )
    :effect (and
      (at nice)
      (not (nice_count_0))
      (nice_count_1)
    )
  )

  (:action start_in_mykonos
    :parameters ()
    :precondition (and
      (current_day ?d)
      (paris_count_0)
      (nice_count_0)
      (mykonos_count_0)
      (not (at paris))
      (not (at nice))
      (not (at mykonos))
    )
    :effect (and
      (at mykonos)
      (not (mykonos_count_0))
      (mykonos_count_1)
    )
  )

  (:action stay_in_paris_from_1
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?d2)
      (at paris)
      (paris_count_1)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (paris_count_1))
      (paris_count_2)
    )
  )

  (:action stay_in_paris_from_2
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?d2)
      (at paris)
      (paris_count_2)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (paris_count_2))
      (paris_count_3)
    )
  )

  (:action stay_in_paris_from_3
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?d2)
      (at paris)
      (paris_count_3)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (paris_count_3))
      (paris_count_4)
    )
  )

  (:action stay_in_nice_from_1
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?d2)
      (at nice)
      (nice_count_1)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (nice_count_1))
      (nice_count_2)
    )
  )

  (:action stay_in_nice_from_2
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?d2)
      (at nice)
      (nice_count_2)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (nice_count_2))
      (nice_count_3)
    )
  )

  (:action stay_in_nice_from_3
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?d2)
      (at nice)
      (nice_count_3)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (nice_count_3))
      (nice_count_4)
    )
  )

  (:action stay_in_nice_from_4
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?d2)
      (at nice)
      (nice_count_4)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (nice_count_4))
      (nice_count_5)
    )
  )

  (:action stay_in_mykonos_from_1
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?d2)
      (at mykonos)
      (mykonos_count_1)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (mykonos_count_1))
      (mykonos_count_2)
    )
  )

  (:action stay_in_mykonos_from_2
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?d2)
      (at mykonos)
      (mykonos_count_2)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (mykonos_count_2))
      (mykonos_count_3)
    )
  )

  (:action stay_in_mykonos_from_3
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?d2)
      (at mykonos)
      (mykonos_count_3)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (mykonos_count_3))
      (mykonos_count_4)
    )
  )

  (:action fly_paris_to_nice_first
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?d2)
      (at paris)
      (direct paris nice)
      (nice_count_0)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (at paris))
      (at nice)
      (not (nice_count_0))
      (nice_count_1)
    )
  )

  (:action fly_paris_to_nice_more_1
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?d2)
      (at paris)
      (direct paris nice)
      (nice_count_1)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (at paris))
      (at nice)
      (not (nice_count_1))
      (nice_count_2)
    )
  )

  (:action fly_paris_to_nice_more_2
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?d2)
      (at paris)
      (direct paris nice)
      (nice_count_2)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (at paris))
      (at nice)
      (not (nice_count_2))
      (nice_count_3)
    )
  )

  (:action fly_paris_to_nice_more_3
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?d2)
      (at paris)
      (direct paris nice)
      (nice_count_3)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (at paris))
      (at nice)
      (not (nice_count_3))
      (nice_count_4)
    )
  )

  (:action fly_paris_to_nice_more_4
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?d2)
      (at paris)
      (direct paris nice)
      (nice_count_4)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (at paris))
      (at nice)
      (not (nice_count_4))
      (nice_count_5)
    )
  )

  (:action fly_nice_to_paris_first
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?d2)
      (at nice)
      (direct nice paris)
      (paris_count_0)
      (friend_window_day ?d2)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (at nice))
      (at paris)
      (not (paris_count_0))
      (paris_count_1)
      (met_friends)
    )
  )

  (:action fly_nice_to_paris_more_1
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?d2)
      (at nice)
      (direct nice paris)
      (paris_count_1)
      (friend_window_day ?d2)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (at nice))
      (at paris)
      (not (paris_count_1))
      (paris_count_2)
      (met_friends)
    )
  )

  (:action fly_nice_to_paris_more_2
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?d2)
      (at nice)
      (direct nice paris)
      (paris_count_2)
      (friend_window_day ?d2)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (at nice))
      (at paris)
      (not (paris_count_2))
      (paris_count_3)
      (met_friends)
    )
  )

  (:action fly_nice_to_paris_more_3
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?d2)
      (at nice)
      (direct nice paris)
      (paris_count_3)
      (friend_window_day ?d2)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (at nice))
      (at paris)
      (not (paris_count_3))
      (paris_count_4)
      (met_friends)
    )
  )

  (:action fly_nice_to_mykonos_first
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?d2)
      (at nice)
      (direct nice mykonos)
      (mykonos_count_0)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (at nice))
      (at mykonos)
      (not (mykonos_count_0))
      (mykonos_count_1)
    )
  )

  (:action fly_nice_to_mykonos_more_1
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?d2)
      (at nice)
      (direct nice mykonos)
      (mykonos_count_1)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (at nice))
      (at mykonos)
      (not (mykonos_count_1))
      (mykonos_count_2)
    )
  )

  (:action fly_nice_to_mykonos_more_2
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?d2)
      (at nice)
      (direct nice mykonos)
      (mykonos_count_2)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (at nice))
      (at mykonos)
      (not (mykonos_count_2))
      (mykonos_count_3)
    )
  )

  (:action fly_nice_to_mykonos_more_3
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?d2)
      (at nice)
      (direct nice mykonos)
      (mykonos_count_3)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (at nice))
      (at mykonos)
      (not (mykonos_count_3))
      (mykonos_count_4)
    )
  )

  (:action fly_mykonos_to_nice_first
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?d2)
      (at mykonos)
      (direct mykonos nice)
      (nice_count_0)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (at mykonos))
      (at nice)
      (not (nice_count_0))
      (nice_count_1)
    )
  )

  (:action fly_mykonos_to_nice_more_1
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?d2)
      (at mykonos)
      (direct mykonos nice)
      (nice_count_1)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (at mykonos))
      (at nice)
      (not (nice_count_1))
      (nice_count_2)
    )
  )

  (:action fly_mykonos_to_nice_more_2
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?d2)
      (at mykonos)
      (direct mykonos nice)
      (nice_count_2)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (at mykonos))
      (at nice)
      (not (nice_count_2))
      (nice_count_3)
    )
  )

  (:action fly_mykonos_to_nice_more_3
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?d2)
      (at mykonos)
      (direct mykonos nice)
      (nice_count_3)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (at mykonos))
      (at nice)
      (not (nice_count_3))
      (nice_count_4)
    )
  )

  (:action fly_mykonos_to_nice_more_4
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?d2)
      (at mykonos)
      (direct mykonos nice)
      (nice_count_4)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (at mykonos))
      (at nice)
      (not (nice_count_4))
      (nice_count_5)
    )
  )
)