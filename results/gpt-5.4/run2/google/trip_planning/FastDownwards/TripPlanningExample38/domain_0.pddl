(define (domain european_trip_5_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city day
  )

  (:predicates
    (next_day ?d1 - day ?d2 - day)
    (current_day ?d - day)
    (assigned ?d - day)
    (at ?d - day ?c - city)
    (direct_flight ?from - city ?to - city)

    (used_geneva_1)
    (used_geneva_2)
    (used_madrid_1)
    (used_madrid_2)
    (used_madrid_3)
    (used_venice_1)
    (used_venice_2)
  )

  (:action choose_start_geneva_use_1
    :precondition (and
      (current_day day1)
      (not (assigned day1))
      (not (used_geneva_1))
    )
    :effect (and
      (assigned day1)
      (at day1 geneva)
      (used_geneva_1)
    )
  )

  (:action choose_start_geneva_use_2
    :precondition (and
      (current_day day1)
      (not (assigned day1))
      (not (used_geneva_2))
    )
    :effect (and
      (assigned day1)
      (at day1 geneva)
      (used_geneva_2)
    )
  )

  (:action choose_start_madrid_use_1
    :precondition (and
      (current_day day1)
      (not (assigned day1))
      (not (used_madrid_1))
    )
    :effect (and
      (assigned day1)
      (at day1 madrid)
      (used_madrid_1)
    )
  )

  (:action choose_start_madrid_use_2
    :precondition (and
      (current_day day1)
      (not (assigned day1))
      (not (used_madrid_2))
    )
    :effect (and
      (assigned day1)
      (at day1 madrid)
      (used_madrid_2)
    )
  )

  (:action choose_start_madrid_use_3
    :precondition (and
      (current_day day1)
      (not (assigned day1))
      (not (used_madrid_3))
    )
    :effect (and
      (assigned day1)
      (at day1 madrid)
      (used_madrid_3)
    )
  )

  (:action choose_start_venice_use_1
    :precondition (and
      (current_day day1)
      (not (assigned day1))
      (not (used_venice_1))
    )
    :effect (and
      (assigned day1)
      (at day1 venice)
      (used_venice_1)
    )
  )

  (:action choose_start_venice_use_2
    :precondition (and
      (current_day day1)
      (not (assigned day1))
      (not (used_venice_2))
    )
    :effect (and
      (assigned day1)
      (at day1 venice)
      (used_venice_2)
    )
  )

  (:action stay_geneva_use_1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (at ?d1 geneva)
      (not (assigned ?d2))
      (not (used_geneva_1))
    )
    :effect (and
      (assigned ?d2)
      (at ?d2 geneva)
      (used_geneva_1)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action stay_geneva_use_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (at ?d1 geneva)
      (not (assigned ?d2))
      (not (used_geneva_2))
    )
    :effect (and
      (assigned ?d2)
      (at ?d2 geneva)
      (used_geneva_2)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action stay_madrid_use_1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (at ?d1 madrid)
      (not (assigned ?d2))
      (not (used_madrid_1))
    )
    :effect (and
      (assigned ?d2)
      (at ?d2 madrid)
      (used_madrid_1)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action stay_madrid_use_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (at ?d1 madrid)
      (not (assigned ?d2))
      (not (used_madrid_2))
    )
    :effect (and
      (assigned ?d2)
      (at ?d2 madrid)
      (used_madrid_2)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action stay_madrid_use_3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (at ?d1 madrid)
      (not (assigned ?d2))
      (not (used_madrid_3))
    )
    :effect (and
      (assigned ?d2)
      (at ?d2 madrid)
      (used_madrid_3)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action stay_venice_use_1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (at ?d1 venice)
      (not (assigned ?d2))
      (not (used_venice_1))
    )
    :effect (and
      (assigned ?d2)
      (at ?d2 venice)
      (used_venice_1)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action stay_venice_use_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (at ?d1 venice)
      (not (assigned ?d2))
      (not (used_venice_2))
    )
    :effect (and
      (assigned ?d2)
      (at ?d2 venice)
      (used_venice_2)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action fly_geneva_to_madrid_use_1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (at ?d1 geneva)
      (not (assigned ?d2))
      (direct_flight geneva madrid)
      (not (used_madrid_1))
    )
    :effect (and
      (assigned ?d2)
      (at ?d2 madrid)
      (used_madrid_1)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action fly_geneva_to_madrid_use_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (at ?d1 geneva)
      (not (assigned ?d2))
      (direct_flight geneva madrid)
      (not (used_madrid_2))
    )
    :effect (and
      (assigned ?d2)
      (at ?d2 madrid)
      (used_madrid_2)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action fly_geneva_to_madrid_use_3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (at ?d1 geneva)
      (not (assigned ?d2))
      (direct_flight geneva madrid)
      (not (used_madrid_3))
    )
    :effect (and
      (assigned ?d2)
      (at ?d2 madrid)
      (used_madrid_3)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action fly_madrid_to_geneva_use_1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (at ?d1 madrid)
      (not (assigned ?d2))
      (direct_flight madrid geneva)
      (not (used_geneva_1))
    )
    :effect (and
      (assigned ?d2)
      (at ?d2 geneva)
      (used_geneva_1)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action fly_madrid_to_geneva_use_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (at ?d1 madrid)
      (not (assigned ?d2))
      (direct_flight madrid geneva)
      (not (used_geneva_2))
    )
    :effect (and
      (assigned ?d2)
      (at ?d2 geneva)
      (used_geneva_2)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action fly_madrid_to_venice_use_1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (at ?d1 madrid)
      (not (assigned ?d2))
      (direct_flight madrid venice)
      (not (used_venice_1))
    )
    :effect (and
      (assigned ?d2)
      (at ?d2 venice)
      (used_venice_1)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action fly_madrid_to_venice_use_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (at ?d1 madrid)
      (not (assigned ?d2))
      (direct_flight madrid venice)
      (not (used_venice_2))
    )
    :effect (and
      (assigned ?d2)
      (at ?d2 venice)
      (used_venice_2)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action fly_venice_to_madrid_use_1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (at ?d1 venice)
      (not (assigned ?d2))
      (direct_flight venice madrid)
      (not (used_madrid_1))
    )
    :effect (and
      (assigned ?d2)
      (at ?d2 madrid)
      (used_madrid_1)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action fly_venice_to_madrid_use_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (at ?d1 venice)
      (not (assigned ?d2))
      (direct_flight venice madrid)
      (not (used_madrid_2))
    )
    :effect (and
      (assigned ?d2)
      (at ?d2 madrid)
      (used_madrid_2)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action fly_venice_to_madrid_use_3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (at ?d1 venice)
      (not (assigned ?d2))
      (direct_flight venice madrid)
      (not (used_madrid_3))
    )
    :effect (and
      (assigned ?d2)
      (at ?d2 madrid)
      (used_madrid_3)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )
)