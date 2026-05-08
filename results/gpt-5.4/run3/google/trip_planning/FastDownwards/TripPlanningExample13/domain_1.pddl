(define (domain european_trip_17_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city day
  )

  (:predicates
    (at ?c - city)
    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (last_day ?d - day)
    (direct_flight ?from - city ?to - city)

    (visited_manchester ?d - day)
    (visited_bucharest ?d - day)
    (visited_lyon ?d - day)

    (lyon_window_day ?d - day)
  )

  (:action stay_manchester
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at manchester)
      (not (visited_manchester ?d))
    )
    :effect (and
      (visited_manchester ?d)
      (not (current_day ?d))
      (current_day ?d_next)
    )
  )

  (:action stay_bucharest
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at bucharest)
      (not (visited_bucharest ?d))
    )
    :effect (and
      (visited_bucharest ?d)
      (not (current_day ?d))
      (current_day ?d_next)
    )
  )

  (:action stay_lyon
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at lyon)
      (not (visited_lyon ?d))
    )
    :effect (and
      (visited_lyon ?d)
      (not (current_day ?d))
      (current_day ?d_next)
    )
  )

  (:action stay_manchester_last_day
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (last_day ?d)
      (at manchester)
      (not (visited_manchester ?d))
    )
    :effect (and
      (visited_manchester ?d)
      (not (current_day ?d))
    )
  )

  (:action stay_bucharest_last_day
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (last_day ?d)
      (at bucharest)
      (not (visited_bucharest ?d))
    )
    :effect (and
      (visited_bucharest ?d)
      (not (current_day ?d))
    )
  )

  (:action stay_lyon_last_day
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (last_day ?d)
      (at lyon)
      (not (visited_lyon ?d))
    )
    :effect (and
      (visited_lyon ?d)
      (not (current_day ?d))
    )
  )

  (:action fly_manchester_bucharest
    :parameters ()
    :precondition (and
      (at manchester)
      (direct_flight manchester bucharest)
    )
    :effect (and
      (not (at manchester))
      (at bucharest)
    )
  )

  (:action fly_bucharest_manchester
    :parameters ()
    :precondition (and
      (at bucharest)
      (direct_flight bucharest manchester)
    )
    :effect (and
      (not (at bucharest))
      (at manchester)
    )
  )

  (:action fly_bucharest_lyon
    :parameters ()
    :precondition (and
      (at bucharest)
      (direct_flight bucharest lyon)
    )
    :effect (and
      (not (at bucharest))
      (at lyon)
    )
  )

  (:action fly_lyon_bucharest
    :parameters ()
    :precondition (and
      (at lyon)
      (direct_flight lyon bucharest)
    )
    :effect (and
      (not (at lyon))
      (at bucharest)
    )
  )
)