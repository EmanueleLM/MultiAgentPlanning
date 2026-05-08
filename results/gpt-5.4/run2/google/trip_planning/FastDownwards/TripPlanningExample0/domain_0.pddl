(define (domain european_trip_14_days)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    location
    day
    florence_count
    barcelona_count
    helsinki_count
  )

  (:predicates
    (at ?l - location)
    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)

    (direct_flight ?from - location ?to - location)

    (florence_days ?c - florence_count)
    (barcelona_days ?c - barcelona_count)
    (helsinki_days ?c - helsinki_count)

    (next_florence_count ?c1 - florence_count ?c2 - florence_count)
    (next_barcelona_count ?c1 - barcelona_count ?c2 - barcelona_count)
    (next_helsinki_count ?c1 - helsinki_count ?c2 - helsinki_count)

    (visited_florence)
    (visited_barcelona)
    (visited_helsinki)

    (meeting_done)
    (meeting_window_day ?d - day)

    (trip_started)
  )

  (:action start_in_barcelona
    :precondition (and
      (at start)
      (current_day d1)
      (not (trip_started))
    )
    :effect (and
      (not (at start))
      (at barcelona)
      (trip_started)
      (visited_barcelona)
    )
  )

  (:action start_in_florence
    :precondition (and
      (at start)
      (current_day d1)
      (not (trip_started))
    )
    :effect (and
      (not (at start))
      (at florence)
      (trip_started)
      (visited_florence)
    )
  )

  (:action start_in_helsinki
    :precondition (and
      (at start)
      (current_day d1)
      (not (trip_started))
    )
    :effect (and
      (not (at start))
      (at helsinki)
      (trip_started)
      (visited_helsinki)
    )
  )

  (:action fly_barcelona_to_florence
    :precondition (and
      (at barcelona)
      (direct_flight barcelona florence)
      (trip_started)
    )
    :effect (and
      (not (at barcelona))
      (at florence)
      (visited_florence)
    )
  )

  (:action fly_florence_to_barcelona
    :precondition (and
      (at florence)
      (direct_flight florence barcelona)
      (trip_started)
    )
    :effect (and
      (not (at florence))
      (at barcelona)
      (visited_barcelona)
    )
  )

  (:action fly_barcelona_to_helsinki
    :precondition (and
      (at barcelona)
      (direct_flight barcelona helsinki)
      (trip_started)
    )
    :effect (and
      (not (at barcelona))
      (at helsinki)
      (visited_helsinki)
    )
  )

  (:action fly_helsinki_to_barcelona
    :precondition (and
      (at helsinki)
      (direct_flight helsinki barcelona)
      (trip_started)
    )
    :effect (and
      (not (at helsinki))
      (at barcelona)
      (visited_barcelona)
    )
  )

  (:action stay_florence_plain
    :parameters (?d1 - day ?d2 - day ?c1 - florence_count ?c2 - florence_count)
    :precondition (and
      (at florence)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (florence_days ?c1)
      (next_florence_count ?c1 ?c2)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (florence_days ?c1))
      (florence_days ?c2)
      (visited_florence)
    )
  )

  (:action stay_florence_meeting
    :parameters (?d1 - day ?d2 - day ?c1 - florence_count ?c2 - florence_count)
    :precondition (and
      (at florence)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (florence_days ?c1)
      (next_florence_count ?c1 ?c2)
      (meeting_window_day ?d1)
      (not (meeting_done))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (florence_days ?c1))
      (florence_days ?c2)
      (visited_florence)
      (meeting_done)
    )
  )

  (:action stay_barcelona
    :parameters (?d1 - day ?d2 - day ?c1 - barcelona_count ?c2 - barcelona_count)
    :precondition (and
      (at barcelona)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (barcelona_days ?c1)
      (next_barcelona_count ?c1 ?c2)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (barcelona_days ?c1))
      (barcelona_days ?c2)
      (visited_barcelona)
    )
  )

  (:action stay_helsinki
    :parameters (?d1 - day ?d2 - day ?c1 - helsinki_count ?c2 - helsinki_count)
    :precondition (and
      (at helsinki)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (helsinki_days ?c1)
      (next_helsinki_count ?c1 ?c2)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (helsinki_days ?c1))
      (helsinki_days ?c2)
      (visited_helsinki)
    )
  )
)