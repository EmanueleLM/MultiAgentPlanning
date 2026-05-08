(define (domain european_trip_11_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
    paris_count
    nice_count
    mykonos_count
  )

  (:predicates
    (at ?c - city)
    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (direct_flight ?from - city ?to - city)

    (paris_days ?p - paris_count)
    (next_paris_count ?a - paris_count ?b - paris_count)

    (nice_days ?n - nice_count)
    (next_nice_count ?a - nice_count ?b - nice_count)

    (mykonos_days ?m - mykonos_count)
    (next_mykonos_count ?a - mykonos_count ?b - mykonos_count)

    (meeting_done)
    (meeting_window_day ?d - day)
  )

  (:action stay_in_paris
    :parameters (?d1 - day ?d2 - day ?p1 - paris_count ?p2 - paris_count)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at paris)
      (paris_days ?p1)
      (next_paris_count ?p1 ?p2)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (paris_days ?p1))
      (paris_days ?p2)
    )
  )

  (:action stay_in_nice
    :parameters (?d1 - day ?d2 - day ?n1 - nice_count ?n2 - nice_count)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at nice)
      (nice_days ?n1)
      (next_nice_count ?n1 ?n2)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (nice_days ?n1))
      (nice_days ?n2)
    )
  )

  (:action stay_in_mykonos
    :parameters (?d1 - day ?d2 - day ?m1 - mykonos_count ?m2 - mykonos_count)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at mykonos)
      (mykonos_days ?m1)
      (next_mykonos_count ?m1 ?m2)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (mykonos_days ?m1))
      (mykonos_days ?m2)
    )
  )

  (:action fly_paris_to_nice
    :parameters (?d1 - day ?d2 - day ?n1 - nice_count ?n2 - nice_count)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at paris)
      (direct_flight paris nice)
      (nice_days ?n1)
      (next_nice_count ?n1 ?n2)
    )
    :effect (and
      (not (at paris))
      (at nice)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (nice_days ?n1))
      (nice_days ?n2)
    )
  )

  (:action fly_nice_to_paris
    :parameters (?d1 - day ?d2 - day ?p1 - paris_count ?p2 - paris_count)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at nice)
      (direct_flight nice paris)
      (paris_days ?p1)
      (next_paris_count ?p1 ?p2)
    )
    :effect (and
      (not (at nice))
      (at paris)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (paris_days ?p1))
      (paris_days ?p2)
    )
  )

  (:action fly_nice_to_mykonos
    :parameters (?d1 - day ?d2 - day ?m1 - mykonos_count ?m2 - mykonos_count)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at nice)
      (direct_flight nice mykonos)
      (mykonos_days ?m1)
      (next_mykonos_count ?m1 ?m2)
    )
    :effect (and
      (not (at nice))
      (at mykonos)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (mykonos_days ?m1))
      (mykonos_days ?m2)
    )
  )

  (:action fly_mykonos_to_nice
    :parameters (?d1 - day ?d2 - day ?n1 - nice_count ?n2 - nice_count)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at mykonos)
      (direct_flight mykonos nice)
      (nice_days ?n1)
      (next_nice_count ?n1 ?n2)
    )
    :effect (and
      (not (at mykonos))
      (at nice)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (nice_days ?n1))
      (nice_days ?n2)
    )
  )

  (:action meet_friends_in_paris
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (meeting_window_day ?d)
      (at paris)
      (not (meeting_done))
    )
    :effect (and
      (meeting_done)
    )
  )
)