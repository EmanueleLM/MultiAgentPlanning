(define (domain european_trip_10_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city day
  )

  (:predicates
    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (at ?c - city)
    (direct_flight ?from - city ?to - city)
    (spent ?d - day ?c - city)
    (trip_started)
    (met_friends_in_window)
  )

  (:action initialize_day_1_at_dublin
    :parameters ()
    :precondition (not (trip_started))
    :effect (and
      (trip_started)
      (current_day day_1)
      (at dublin)
      (spent day_1 dublin)
    )
  )

  (:action initialize_day_1_at_porto
    :parameters ()
    :precondition (not (trip_started))
    :effect (and
      (trip_started)
      (current_day day_1)
      (at porto)
      (spent day_1 porto)
    )
  )

  (:action initialize_day_1_at_venice
    :parameters ()
    :precondition (not (trip_started))
    :effect (and
      (trip_started)
      (current_day day_1)
      (at venice)
      (spent day_1 venice)
      (met_friends_in_window)
    )
  )

  (:action stay
    :parameters (?d1 - day ?d2 - day ?c - city)
    :precondition (and
      (trip_started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at ?c)
      (not (and (or)))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (spent ?d2 ?c)
    )
  )

  (:action stay_day_1_to_day_2_in_venice
    :parameters ()
    :precondition (and
      (trip_started)
      (current_day day_1)
      (next_day day_1 day_2)
      (at venice)
    )
    :effect (and
      (not (current_day day_1))
      (current_day day_2)
      (spent day_2 venice)
      (met_friends_in_window)
    )
  )

  (:action stay_day_2_to_day_3_in_venice
    :parameters ()
    :precondition (and
      (trip_started)
      (current_day day_2)
      (next_day day_2 day_3)
      (at venice)
    )
    :effect (and
      (not (current_day day_2))
      (current_day day_3)
      (spent day_3 venice)
      (met_friends_in_window)
    )
  )

  (:action stay_day_3_to_day_4_in_venice
    :parameters ()
    :precondition (and
      (trip_started)
      (current_day day_3)
      (next_day day_3 day_4)
      (at venice)
    )
    :effect (and
      (not (current_day day_3))
      (current_day day_4)
      (spent day_4 venice)
      (met_friends_in_window)
    )
  )

  (:action fly
    :parameters (?d1 - day ?d2 - day ?from - city ?to - city)
    :precondition (and
      (trip_started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at ?from)
      (direct_flight ?from ?to)
      (not (at ?to))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (at ?from))
      (at ?to)
      (spent ?d2 ?to)
    )
  )

  (:action fly_day_1_to_day_2_to_venice_from_dublin
    :parameters ()
    :precondition (and
      (trip_started)
      (current_day day_1)
      (next_day day_1 day_2)
      (at dublin)
      (direct_flight dublin venice)
      (not (at venice))
    )
    :effect (and
      (not (current_day day_1))
      (current_day day_2)
      (not (at dublin))
      (at venice)
      (spent day_2 venice)
      (met_friends_in_window)
    )
  )

  (:action fly_day_2_to_day_3_to_venice_from_dublin
    :parameters ()
    :precondition (and
      (trip_started)
      (current_day day_2)
      (next_day day_2 day_3)
      (at dublin)
      (direct_flight dublin venice)
      (not (at venice))
    )
    :effect (and
      (not (current_day day_2))
      (current_day day_3)
      (not (at dublin))
      (at venice)
      (spent day_3 venice)
      (met_friends_in_window)
    )
  )

  (:action fly_day_3_to_day_4_to_venice_from_dublin
    :parameters ()
    :precondition (and
      (trip_started)
      (current_day day_3)
      (next_day day_3 day_4)
      (at dublin)
      (direct_flight dublin venice)
      (not (at venice))
    )
    :effect (and
      (not (current_day day_3))
      (current_day day_4)
      (not (at dublin))
      (at venice)
      (spent day_4 venice)
      (met_friends_in_window)
    )
  )
)