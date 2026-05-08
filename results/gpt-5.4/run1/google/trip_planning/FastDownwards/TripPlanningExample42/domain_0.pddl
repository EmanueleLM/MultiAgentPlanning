(define (domain european_trip_11_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city day
  )

  (:predicates
    (at ?c - city ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (direct_flight ?from - city ?to - city)
    (current_day ?d - day)
    (before_start)
    (visited_window_paris)
    (window_day ?d - day)

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
      (before_start)
      (paris_count_0)
      (nice_count_0)
      (mykonos_count_0)
    )
    :effect (and
      (not (before_start))
      (not (paris_count_0))
      (paris_count_1)
      (at paris d1)
      (current_day d1)
      (visited_window_paris)
    )
  )

  (:action start_in_nice
    :parameters ()
    :precondition (and
      (before_start)
      (paris_count_0)
      (nice_count_0)
      (mykonos_count_0)
    )
    :effect (and
      (not (before_start))
      (not (nice_count_0))
      (nice_count_1)
      (at nice d1)
      (current_day d1)
    )
  )

  (:action start_in_mykonos
    :parameters ()
    :precondition (and
      (before_start)
      (paris_count_0)
      (nice_count_0)
      (mykonos_count_0)
    )
    :effect (and
      (not (before_start))
      (not (mykonos_count_0))
      (mykonos_count_1)
      (at mykonos d1)
      (current_day d1)
    )
  )

  (:action stay_paris_1
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at paris ?d)
      (paris_count_1)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (at paris ?d2)
      (not (paris_count_1))
      (paris_count_2)
      (visited_window_paris)
    )
  )

  (:action stay_paris_2
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at paris ?d)
      (paris_count_2)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (at paris ?d2)
      (not (paris_count_2))
      (paris_count_3)
      (visited_window_paris)
    )
  )

  (:action stay_paris_3
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at paris ?d)
      (paris_count_3)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (at paris ?d2)
      (not (paris_count_3))
      (paris_count_4)
      (visited_window_paris)
    )
  )

  (:action stay_nice_1
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at nice ?d)
      (nice_count_1)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (at nice ?d2)
      (not (nice_count_1))
      (nice_count_2)
    )
  )

  (:action stay_nice_2
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at nice ?d)
      (nice_count_2)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (at nice ?d2)
      (not (nice_count_2))
      (nice_count_3)
    )
  )

  (:action stay_nice_3
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at nice ?d)
      (nice_count_3)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (at nice ?d2)
      (not (nice_count_3))
      (nice_count_4)
    )
  )

  (:action stay_nice_4
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at nice ?d)
      (nice_count_4)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (at nice ?d2)
      (not (nice_count_4))
      (nice_count_5)
    )
  )

  (:action stay_mykonos_1
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at mykonos ?d)
      (mykonos_count_1)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (at mykonos ?d2)
      (not (mykonos_count_1))
      (mykonos_count_2)
    )
  )

  (:action stay_mykonos_2
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at mykonos ?d)
      (mykonos_count_2)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (at mykonos ?d2)
      (not (mykonos_count_2))
      (mykonos_count_3)
    )
  )

  (:action stay_mykonos_3
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at mykonos ?d)
      (mykonos_count_3)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (at mykonos ?d2)
      (not (mykonos_count_3))
      (mykonos_count_4)
    )
  )

  (:action fly_paris_to_nice_0
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at paris ?d)
      (direct_flight paris nice)
      (nice_count_0)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (at nice ?d2)
      (not (nice_count_0))
      (nice_count_1)
    )
  )

  (:action fly_paris_to_nice_1
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at paris ?d)
      (direct_flight paris nice)
      (nice_count_1)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (at nice ?d2)
      (not (nice_count_1))
      (nice_count_2)
    )
  )

  (:action fly_paris_to_nice_2
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at paris ?d)
      (direct_flight paris nice)
      (nice_count_2)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (at nice ?d2)
      (not (nice_count_2))
      (nice_count_3)
    )
  )

  (:action fly_paris_to_nice_3
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at paris ?d)
      (direct_flight paris nice)
      (nice_count_3)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (at nice ?d2)
      (not (nice_count_3))
      (nice_count_4)
    )
  )

  (:action fly_paris_to_nice_4
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at paris ?d)
      (direct_flight paris nice)
      (nice_count_4)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (at nice ?d2)
      (not (nice_count_4))
      (nice_count_5)
    )
  )

  (:action fly_nice_to_paris_0
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at nice ?d)
      (direct_flight nice paris)
      (paris_count_0)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (at paris ?d2)
      (not (paris_count_0))
      (paris_count_1)
      (visited_window_paris)
    )
  )

  (:action fly_nice_to_paris_1
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at nice ?d)
      (direct_flight nice paris)
      (paris_count_1)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (at paris ?d2)
      (not (paris_count_1))
      (paris_count_2)
      (visited_window_paris)
    )
  )

  (:action fly_nice_to_paris_2
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at nice ?d)
      (direct_flight nice paris)
      (paris_count_2)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (at paris ?d2)
      (not (paris_count_2))
      (paris_count_3)
      (visited_window_paris)
    )
  )

  (:action fly_nice_to_paris_3
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at nice ?d)
      (direct_flight nice paris)
      (paris_count_3)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (at paris ?d2)
      (not (paris_count_3))
      (paris_count_4)
      (visited_window_paris)
    )
  )

  (:action fly_nice_to_mykonos_0
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at nice ?d)
      (direct_flight nice mykonos)
      (mykonos_count_0)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (at mykonos ?d2)
      (not (mykonos_count_0))
      (mykonos_count_1)
    )
  )

  (:action fly_nice_to_mykonos_1
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at nice ?d)
      (direct_flight nice mykonos)
      (mykonos_count_1)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (at mykonos ?d2)
      (not (mykonos_count_1))
      (mykonos_count_2)
    )
  )

  (:action fly_nice_to_mykonos_2
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at nice ?d)
      (direct_flight nice mykonos)
      (mykonos_count_2)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (at mykonos ?d2)
      (not (mykonos_count_2))
      (mykonos_count_3)
    )
  )

  (:action fly_nice_to_mykonos_3
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at nice ?d)
      (direct_flight nice mykonos)
      (mykonos_count_3)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (at mykonos ?d2)
      (not (mykonos_count_3))
      (mykonos_count_4)
    )
  )

  (:action fly_mykonos_to_nice_0
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at mykonos ?d)
      (direct_flight mykonos nice)
      (nice_count_0)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (at nice ?d2)
      (not (nice_count_0))
      (nice_count_1)
    )
  )

  (:action fly_mykonos_to_nice_1
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at mykonos ?d)
      (direct_flight mykonos nice)
      (nice_count_1)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (at nice ?d2)
      (not (nice_count_1))
      (nice_count_2)
    )
  )

  (:action fly_mykonos_to_nice_2
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at mykonos ?d)
      (direct_flight mykonos nice)
      (nice_count_2)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (at nice ?d2)
      (not (nice_count_2))
      (nice_count_3)
    )
  )

  (:action fly_mykonos_to_nice_3
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at mykonos ?d)
      (direct_flight mykonos nice)
      (nice_count_3)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (at nice ?d2)
      (not (nice_count_3))
      (nice_count_4)
    )
  )

  (:action fly_mykonos_to_nice_4
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at mykonos ?d)
      (direct_flight mykonos nice)
      (nice_count_4)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (at nice ?d2)
      (not (nice_count_4))
      (nice_count_5)
    )
  )
)