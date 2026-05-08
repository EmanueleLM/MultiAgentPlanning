(define (domain trip_planning_example28)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
    count
  )

  (:predicates
    (at ?c - city)
    (direct ?from - city ?to - city)
    (next_day ?d1 - day ?d2 - day)
    (current_day ?d - day)
    (last_day ?d - day)
    (used_day)
    (count_next ?c1 - count ?c2 - count)
    (venice_days ?n - count)
    (florence_days ?n - count)
    (zurich_days ?n - count)
    (trip_done)
  )

  (:action start_in_venice
    :parameters (?d - day ?n1 - count ?n2 - count)
    :precondition (and
      (current_day ?d)
      (not (used_day))
      (not (at venice))
      (not (at florence))
      (not (at zurich))
      (venice_days ?n1)
      (count_next ?n1 ?n2)
    )
    :effect (and
      (at venice)
      (used_day)
      (not (venice_days ?n1))
      (venice_days ?n2)
    )
  )

  (:action start_in_florence
    :parameters (?d - day ?n1 - count ?n2 - count)
    :precondition (and
      (current_day ?d)
      (not (used_day))
      (not (at venice))
      (not (at florence))
      (not (at zurich))
      (florence_days ?n1)
      (count_next ?n1 ?n2)
    )
    :effect (and
      (at florence)
      (used_day)
      (not (florence_days ?n1))
      (florence_days ?n2)
    )
  )

  (:action start_in_zurich
    :parameters (?d - day ?n1 - count ?n2 - count)
    :precondition (and
      (current_day ?d)
      (not (used_day))
      (not (at venice))
      (not (at florence))
      (not (at zurich))
      (zurich_days ?n1)
      (count_next ?n1 ?n2)
    )
    :effect (and
      (at zurich)
      (used_day)
      (not (zurich_days ?n1))
      (zurich_days ?n2)
    )
  )

  (:action stay_in_venice
    :parameters (?d - day ?n1 - count ?n2 - count)
    :precondition (and
      (current_day ?d)
      (not (used_day))
      (at venice)
      (venice_days ?n1)
      (count_next ?n1 ?n2)
    )
    :effect (and
      (used_day)
      (not (venice_days ?n1))
      (venice_days ?n2)
    )
  )

  (:action stay_in_florence
    :parameters (?d - day ?n1 - count ?n2 - count)
    :precondition (and
      (current_day ?d)
      (not (used_day))
      (at florence)
      (florence_days ?n1)
      (count_next ?n1 ?n2)
    )
    :effect (and
      (used_day)
      (not (florence_days ?n1))
      (florence_days ?n2)
    )
  )

  (:action stay_in_zurich
    :parameters (?d - day ?n1 - count ?n2 - count)
    :precondition (and
      (current_day ?d)
      (not (used_day))
      (at zurich)
      (zurich_days ?n1)
      (count_next ?n1 ?n2)
    )
    :effect (and
      (used_day)
      (not (zurich_days ?n1))
      (zurich_days ?n2)
    )
  )

  (:action fly_venice_to_zurich
    :parameters (?d - day ?n1 - count ?n2 - count)
    :precondition (and
      (current_day ?d)
      (not (used_day))
      (at venice)
      (direct venice zurich)
      (zurich_days ?n1)
      (count_next ?n1 ?n2)
    )
    :effect (and
      (not (at venice))
      (at zurich)
      (used_day)
      (not (zurich_days ?n1))
      (zurich_days ?n2)
    )
  )

  (:action fly_zurich_to_venice
    :parameters (?d - day ?n1 - count ?n2 - count)
    :precondition (and
      (current_day ?d)
      (not (used_day))
      (at zurich)
      (direct zurich venice)
      (venice_days ?n1)
      (count_next ?n1 ?n2)
    )
    :effect (and
      (not (at zurich))
      (at venice)
      (used_day)
      (not (venice_days ?n1))
      (venice_days ?n2)
    )
  )

  (:action fly_zurich_to_florence
    :parameters (?d - day ?n1 - count ?n2 - count)
    :precondition (and
      (current_day ?d)
      (not (used_day))
      (at zurich)
      (direct zurich florence)
      (florence_days ?n1)
      (count_next ?n1 ?n2)
    )
    :effect (and
      (not (at zurich))
      (at florence)
      (used_day)
      (not (florence_days ?n1))
      (florence_days ?n2)
    )
  )

  (:action advance_day
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (used_day)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (used_day))
    )
  )

  (:action finish_trip
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (last_day ?d)
      (used_day)
      (venice_days c6)
      (florence_days c6)
      (zurich_days c2)
    )
    :effect (and
      (trip_done)
    )
  )
)