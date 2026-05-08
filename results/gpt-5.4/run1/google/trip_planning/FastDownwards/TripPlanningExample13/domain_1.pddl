(define (domain european_trip_17days)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city day
  )

  (:predicates
    (at ?c - city)
    (flight ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (today ?d - day)

    (visited_manchester ?d - day)
    (visited_bucharest ?d - day)
    (visited_lyon ?d - day)

    (window_day ?d - day)
    (relative_visit_done ?d - day)

    (trip_finished)
  )

  (:action stay_manchester
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (today ?d)
      (next ?d ?d2)
      (at manchester)
      (not (trip_finished))
    )
    :effect (and
      (not (today ?d))
      (today ?d2)
      (visited_manchester ?d)
    )
  )

  (:action stay_bucharest
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (today ?d)
      (next ?d ?d2)
      (at bucharest)
      (not (trip_finished))
    )
    :effect (and
      (not (today ?d))
      (today ?d2)
      (visited_bucharest ?d)
    )
  )

  (:action stay_lyon_window
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (today ?d)
      (next ?d ?d2)
      (at lyon)
      (window_day ?d)
      (not (trip_finished))
    )
    :effect (and
      (not (today ?d))
      (today ?d2)
      (visited_lyon ?d)
      (relative_visit_done ?d)
    )
  )

  (:action stay_lyon_nonwindow
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (today ?d)
      (next ?d ?d2)
      (at lyon)
      (not (window_day ?d))
      (not (trip_finished))
    )
    :effect (and
      (not (today ?d))
      (today ?d2)
      (visited_lyon ?d)
    )
  )

  (:action fly_manchester_bucharest
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (today ?d)
      (next ?d ?d2)
      (at manchester)
      (flight manchester bucharest)
      (not (trip_finished))
    )
    :effect (and
      (not (today ?d))
      (today ?d2)
      (not (at manchester))
      (at bucharest)
      (visited_manchester ?d)
    )
  )

  (:action fly_bucharest_manchester
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (today ?d)
      (next ?d ?d2)
      (at bucharest)
      (flight bucharest manchester)
      (not (trip_finished))
    )
    :effect (and
      (not (today ?d))
      (today ?d2)
      (not (at bucharest))
      (at manchester)
      (visited_bucharest ?d)
    )
  )

  (:action fly_bucharest_lyon
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (today ?d)
      (next ?d ?d2)
      (at bucharest)
      (flight bucharest lyon)
      (not (trip_finished))
    )
    :effect (and
      (not (today ?d))
      (today ?d2)
      (not (at bucharest))
      (at lyon)
      (visited_bucharest ?d)
    )
  )

  (:action fly_lyon_bucharest_window
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (today ?d)
      (next ?d ?d2)
      (at lyon)
      (flight lyon bucharest)
      (window_day ?d)
      (not (trip_finished))
    )
    :effect (and
      (not (today ?d))
      (today ?d2)
      (not (at lyon))
      (at bucharest)
      (visited_lyon ?d)
      (relative_visit_done ?d)
    )
  )

  (:action fly_lyon_bucharest_nonwindow
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (today ?d)
      (next ?d ?d2)
      (at lyon)
      (flight lyon bucharest)
      (not (window_day ?d))
      (not (trip_finished))
    )
    :effect (and
      (not (today ?d))
      (today ?d2)
      (not (at lyon))
      (at bucharest)
      (visited_lyon ?d)
    )
  )

  (:action finish_manchester
    :parameters ()
    :precondition (and
      (today d17)
      (at manchester)
      (not (trip_finished))
    )
    :effect (and
      (visited_manchester d17)
      (trip_finished)
      (not (today d17))
    )
  )

  (:action finish_bucharest
    :parameters ()
    :precondition (and
      (today d17)
      (at bucharest)
      (not (trip_finished))
    )
    :effect (and
      (visited_bucharest d17)
      (trip_finished)
      (not (today d17))
    )
  )

  (:action finish_lyon_window
    :parameters ()
    :precondition (and
      (today d17)
      (at lyon)
      (window_day d17)
      (not (trip_finished))
    )
    :effect (and
      (visited_lyon d17)
      (relative_visit_done d17)
      (trip_finished)
      (not (today d17))
    )
  )

  (:action finish_lyon_nonwindow
    :parameters ()
    :precondition (and
      (today d17)
      (at lyon)
      (not (window_day d17))
      (not (trip_finished))
    )
    :effect (and
      (visited_lyon d17)
      (trip_finished)
      (not (today d17))
    )
  )
)