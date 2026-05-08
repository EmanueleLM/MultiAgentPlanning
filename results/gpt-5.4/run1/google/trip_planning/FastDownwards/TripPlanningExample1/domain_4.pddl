(define (domain european_trip_15_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:constants
    riga manchester split - city
  )

  (:predicates
    (at ?c - city)
    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (direct_flight ?from - city ?to - city)
    (visited_day_riga ?d - day)
    (visited_day_manchester ?d - day)
    (visited_day_split ?d - day)
  )

  (:action stay_riga
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at riga)
      (not (visited_day_riga ?d2))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (visited_day_riga ?d2)
    )
  )

  (:action stay_manchester
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at manchester)
      (not (visited_day_manchester ?d2))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (visited_day_manchester ?d2)
    )
  )

  (:action stay_split
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at split)
      (not (visited_day_split ?d2))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (visited_day_split ?d2)
    )
  )

  (:action fly_riga_to_manchester
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at riga)
      (direct_flight riga manchester)
      (not (visited_day_manchester ?d2))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (at riga))
      (at manchester)
      (visited_day_manchester ?d2)
    )
  )

  (:action fly_manchester_to_riga
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at manchester)
      (direct_flight manchester riga)
      (not (visited_day_riga ?d2))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (at manchester))
      (at riga)
      (visited_day_riga ?d2)
    )
  )

  (:action fly_manchester_to_split
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at manchester)
      (direct_flight manchester split)
      (not (visited_day_split ?d2))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (at manchester))
      (at split)
      (visited_day_split ?d2)
    )
  )
)