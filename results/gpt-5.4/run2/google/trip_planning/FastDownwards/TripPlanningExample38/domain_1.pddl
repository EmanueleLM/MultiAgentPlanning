(define (domain european_trip_5_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city day
  )

  (:predicates
    (direct_flight ?from - city ?to - city)
    (next_day ?d1 - day ?d2 - day)
    (current_day ?d - day)
    (at ?c - city ?d - day)
    (visited_geneva_day ?d - day)
    (visited_madrid_day ?d - day)
    (visited_venice_day ?d - day)
  )

  (:action start_in_city
    :parameters (?c - city)
    :precondition
      (and
        (current_day day1)
        (not (at geneva day1))
        (not (at madrid day1))
        (not (at venice day1))
      )
    :effect
      (and
        (at ?c day1)
      )
  )

  (:action stay_geneva
    :parameters (?d1 - day ?d2 - day)
    :precondition
      (and
        (current_day ?d1)
        (next_day ?d1 ?d2)
        (at geneva ?d1)
        (not (at geneva ?d2))
        (not (at madrid ?d2))
        (not (at venice ?d2))
      )
    :effect
      (and
        (at geneva ?d2)
        (not (current_day ?d1))
        (current_day ?d2)
        (visited_geneva_day ?d2)
      )
  )

  (:action stay_madrid
    :parameters (?d1 - day ?d2 - day)
    :precondition
      (and
        (current_day ?d1)
        (next_day ?d1 ?d2)
        (at madrid ?d1)
        (not (at geneva ?d2))
        (not (at madrid ?d2))
        (not (at venice ?d2))
      )
    :effect
      (and
        (at madrid ?d2)
        (not (current_day ?d1))
        (current_day ?d2)
        (visited_madrid_day ?d2)
      )
  )

  (:action stay_venice
    :parameters (?d1 - day ?d2 - day)
    :precondition
      (and
        (current_day ?d1)
        (next_day ?d1 ?d2)
        (at venice ?d1)
        (not (at geneva ?d2))
        (not (at madrid ?d2))
        (not (at venice ?d2))
      )
    :effect
      (and
        (at venice ?d2)
        (not (current_day ?d1))
        (current_day ?d2)
        (visited_venice_day ?d2)
      )
  )

  (:action fly_geneva_to_madrid
    :parameters (?d1 - day ?d2 - day)
    :precondition
      (and
        (current_day ?d1)
        (next_day ?d1 ?d2)
        (at geneva ?d1)
        (direct_flight geneva madrid)
        (not (at geneva ?d2))
        (not (at madrid ?d2))
        (not (at venice ?d2))
      )
    :effect
      (and
        (at madrid ?d2)
        (not (current_day ?d1))
        (current_day ?d2)
        (visited_madrid_day ?d2)
      )
  )

  (:action fly_madrid_to_geneva
    :parameters (?d1 - day ?d2 - day)
    :precondition
      (and
        (current_day ?d1)
        (next_day ?d1 ?d2)
        (at madrid ?d1)
        (direct_flight madrid geneva)
        (not (at geneva ?d2))
        (not (at madrid ?d2))
        (not (at venice ?d2))
      )
    :effect
      (and
        (at geneva ?d2)
        (not (current_day ?d1))
        (current_day ?d2)
        (visited_geneva_day ?d2)
      )
  )

  (:action fly_madrid_to_venice
    :parameters (?d1 - day ?d2 - day)
    :precondition
      (and
        (current_day ?d1)
        (next_day ?d1 ?d2)
        (at madrid ?d1)
        (direct_flight madrid venice)
        (not (at geneva ?d2))
        (not (at madrid ?d2))
        (not (at venice ?d2))
      )
    :effect
      (and
        (at venice ?d2)
        (not (current_day ?d1))
        (current_day ?d2)
        (visited_venice_day ?d2)
      )
  )

  (:action fly_venice_to_madrid
    :parameters (?d1 - day ?d2 - day)
    :precondition
      (and
        (current_day ?d1)
        (next_day ?d1 ?d2)
        (at venice ?d1)
        (direct_flight venice madrid)
        (not (at geneva ?d2))
        (not (at madrid ?d2))
        (not (at venice ?d2))
      )
    :effect
      (and
        (at madrid ?d2)
        (not (current_day ?d1))
        (current_day ?d2)
        (visited_madrid_day ?d2)
      )
  )
)