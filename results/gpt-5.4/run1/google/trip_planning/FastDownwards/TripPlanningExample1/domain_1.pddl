(define (domain european_trip_15_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
    count
  )

  (:predicates
    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)

    (at ?c - city)
    (direct_flight ?from - city ?to - city)

    (riga_count ?n - count)
    (manchester_count ?n - count)
    (split_count ?n - count)

    (next_count ?n1 - count ?n2 - count)
  )

  (:action start_at
    :parameters (?c - city ?n - count ?n2 - count)
    :precondition (and
      (current_day d1)
      (not (at riga))
      (not (at manchester))
      (not (at split))
      (next_count ?n ?n2)
      (or_dummy_start ?c ?n ?n2)
    )
    :effect (and
      (at ?c)
      (when_riga_start ?c ?n ?n2)
      (when_manchester_start ?c ?n ?n2)
      (when_split_start ?c ?n ?n2)
    )
  )

  (:action start_in_riga
    :parameters (?n1 - count ?n2 - count)
    :precondition (and
      (current_day d1)
      (not (at riga))
      (not (at manchester))
      (not (at split))
      (riga_count ?n1)
      (next_count ?n1 ?n2)
    )
    :effect (and
      (at riga)
      (not (riga_count ?n1))
      (riga_count ?n2)
    )
  )

  (:action start_in_manchester
    :parameters (?n1 - count ?n2 - count)
    :precondition (and
      (current_day d1)
      (not (at riga))
      (not (at manchester))
      (not (at split))
      (manchester_count ?n1)
      (next_count ?n1 ?n2)
    )
    :effect (and
      (at manchester)
      (not (manchester_count ?n1))
      (manchester_count ?n2)
    )
  )

  (:action start_in_split
    :parameters (?n1 - count ?n2 - count)
    :precondition (and
      (current_day d1)
      (not (at riga))
      (not (at manchester))
      (not (at split))
      (split_count ?n1)
      (next_count ?n1 ?n2)
    )
    :effect (and
      (at split)
      (not (split_count ?n1))
      (split_count ?n2)
    )
  )

  (:action stay_in_riga
    :parameters (?d1 - day ?d2 - day ?n1 - count ?n2 - count)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at riga)
      (riga_count ?n1)
      (next_count ?n1 ?n2)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (riga_count ?n1))
      (riga_count ?n2)
    )
  )

  (:action stay_in_manchester
    :parameters (?d1 - day ?d2 - day ?n1 - count ?n2 - count)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at manchester)
      (manchester_count ?n1)
      (next_count ?n1 ?n2)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (manchester_count ?n1))
      (manchester_count ?n2)
    )
  )

  (:action stay_in_split
    :parameters (?d1 - day ?d2 - day ?n1 - count ?n2 - count)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at split)
      (split_count ?n1)
      (next_count ?n1 ?n2)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (split_count ?n1))
      (split_count ?n2)
    )
  )

  (:action fly_riga_to_manchester
    :parameters (?d1 - day ?d2 - day ?n1 - count ?n2 - count)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at riga)
      (direct_flight riga manchester)
      (manchester_count ?n1)
      (next_count ?n1 ?n2)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (at riga))
      (at manchester)
      (not (manchester_count ?n1))
      (manchester_count ?n2)
    )
  )

  (:action fly_manchester_to_riga
    :parameters (?d1 - day ?d2 - day ?n1 - count ?n2 - count)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at manchester)
      (direct_flight manchester riga)
      (riga_count ?n1)
      (next_count ?n1 ?n2)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (at manchester))
      (at riga)
      (not (riga_count ?n1))
      (riga_count ?n2)
    )
  )

  (:action fly_manchester_to_split
    :parameters (?d1 - day ?d2 - day ?n1 - count ?n2 - count)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at manchester)
      (direct_flight manchester split)
      (split_count ?n1)
      (next_count ?n1 ?n2)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (at manchester))
      (at split)
      (not (split_count ?n1))
      (split_count ?n2)
    )
  )
)