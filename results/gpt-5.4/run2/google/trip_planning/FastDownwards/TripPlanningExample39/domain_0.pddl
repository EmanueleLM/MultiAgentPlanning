(define (domain european_trip_12_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city day
  )

  (:predicates
    (at ?c - city)
    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (assigned ?d - day ?c - city)
    (direct_flight ?from - city ?to - city)
    (window_day ?d - day)
    (visited_relatives_in_window)
    (started)
  )

  (:action init_in_porto
    :parameters ()
    :precondition (not (started))
    :effect (and
      (started)
      (at porto)
      (current_day day_1)
      (assigned day_1 porto)
      (visited_relatives_in_window)
    )
  )

  (:action init_in_barcelona
    :parameters ()
    :precondition (not (started))
    :effect (and
      (started)
      (at barcelona)
      (current_day day_1)
      (assigned day_1 barcelona)
    )
  )

  (:action init_in_florence
    :parameters ()
    :precondition (not (started))
    :effect (and
      (started)
      (at florence)
      (current_day day_1)
      (assigned day_1 florence)
    )
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (started)
      (at ?c)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (not (assigned ?d2 porto))
      (not (assigned ?d2 barcelona))
      (not (assigned ?d2 florence))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (assigned ?d2 ?c)
    )
  )

  (:action stay_porto_window
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (started)
      (at porto)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (window_day ?d2)
      (not (assigned ?d2 porto))
      (not (assigned ?d2 barcelona))
      (not (assigned ?d2 florence))
      (not (visited_relatives_in_window))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (assigned ?d2 porto)
      (visited_relatives_in_window)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (started)
      (at ?from)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (direct_flight ?from ?to)
      (not (assigned ?d2 porto))
      (not (assigned ?d2 barcelona))
      (not (assigned ?d2 florence))
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_day ?d1))
      (current_day ?d2)
      (assigned ?d2 ?to)
    )
  )

  (:action fly_to_porto_window
    :parameters (?from - city ?d1 - day ?d2 - day)
    :precondition (and
      (started)
      (at ?from)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (direct_flight ?from porto)
      (window_day ?d2)
      (not (assigned ?d2 porto))
      (not (assigned ?d2 barcelona))
      (not (assigned ?d2 florence))
      (not (visited_relatives_in_window))
    )
    :effect (and
      (not (at ?from))
      (at porto)
      (not (current_day ?d1))
      (current_day ?d2)
      (assigned ?d2 porto)
      (visited_relatives_in_window)
    )
  )
)