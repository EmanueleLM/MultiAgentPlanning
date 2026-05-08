(define (domain trip_planning_example13)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city day count
  )

  (:predicates
    (at ?c - city)
    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (direct_flight ?from - city ?to - city)

    (count_manchester ?n - count)
    (count_bucharest ?n - count)
    (count_lyon ?n - count)
    (next_count ?n1 - count ?n2 - count)

    (lyon_window_day ?d - day)
    (visited_relatives)

    (trip_finished)
  )

  (:action choose_start
    :parameters (?c - city)
    :precondition (and
      (not (at manchester))
      (not (at bucharest))
      (not (at lyon))
    )
    :effect (at ?c)
  )

  (:action stay_and_advance
    :parameters (?c - city ?d1 - day ?d2 - day ?n1 - count ?n2 - count)
    :precondition (and
      (at ?c)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (next_count ?n1 ?n2)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action stay_manchester
    :parameters (?d1 - day ?d2 - day ?n1 - count ?n2 - count)
    :precondition (and
      (at manchester)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (count_manchester ?n1)
      (next_count ?n1 ?n2)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (count_manchester ?n1))
      (count_manchester ?n2)
    )
  )

  (:action stay_bucharest
    :parameters (?d1 - day ?d2 - day ?n1 - count ?n2 - count)
    :precondition (and
      (at bucharest)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (count_bucharest ?n1)
      (next_count ?n1 ?n2)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (count_bucharest ?n1))
      (count_bucharest ?n2)
    )
  )

  (:action stay_lyon_nonwindow
    :parameters (?d1 - day ?d2 - day ?n1 - count ?n2 - count)
    :precondition (and
      (at lyon)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (count_lyon ?n1)
      (next_count ?n1 ?n2)
      (not (lyon_window_day ?d1))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (count_lyon ?n1))
      (count_lyon ?n2)
    )
  )

  (:action stay_lyon_window
    :parameters (?d1 - day ?d2 - day ?n1 - count ?n2 - count)
    :precondition (and
      (at lyon)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (count_lyon ?n1)
      (next_count ?n1 ?n2)
      (lyon_window_day ?d1)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (count_lyon ?n1))
      (count_lyon ?n2)
      (visited_relatives)
    )
  )

  (:action fly_manchester_bucharest
    :parameters (?d1 - day ?d2 - day ?n1 - count ?n2 - count)
    :precondition (and
      (at manchester)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (direct_flight manchester bucharest)
      (count_manchester ?n1)
      (next_count ?n1 ?n2)
    )
    :effect (and
      (not (at manchester))
      (at bucharest)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (count_manchester ?n1))
      (count_manchester ?n2)
    )
  )

  (:action fly_bucharest_manchester
    :parameters (?d1 - day ?d2 - day ?n1 - count ?n2 - count)
    :precondition (and
      (at bucharest)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (direct_flight bucharest manchester)
      (count_bucharest ?n1)
      (next_count ?n1 ?n2)
    )
    :effect (and
      (not (at bucharest))
      (at manchester)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (count_bucharest ?n1))
      (count_bucharest ?n2)
    )
  )

  (:action fly_bucharest_lyon_nonwindow
    :parameters (?d1 - day ?d2 - day ?n1 - count ?n2 - count)
    :precondition (and
      (at bucharest)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (direct_flight bucharest lyon)
      (count_bucharest ?n1)
      (next_count ?n1 ?n2)
      (not (lyon_window_day ?d1))
    )
    :effect (and
      (not (at bucharest))
      (at lyon)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (count_bucharest ?n1))
      (count_bucharest ?n2)
    )
  )

  (:action fly_bucharest_lyon_window
    :parameters (?d1 - day ?d2 - day ?n1 - count ?n2 - count)
    :precondition (and
      (at bucharest)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (direct_flight bucharest lyon)
      (count_bucharest ?n1)
      (next_count ?n1 ?n2)
      (lyon_window_day ?d1)
    )
    :effect (and
      (not (at bucharest))
      (at lyon)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (count_bucharest ?n1))
      (count_bucharest ?n2)
      (visited_relatives)
    )
  )

  (:action fly_lyon_bucharest_nonwindow
    :parameters (?d1 - day ?d2 - day ?n1 - count ?n2 - count)
    :precondition (and
      (at lyon)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (direct_flight lyon bucharest)
      (count_lyon ?n1)
      (next_count ?n1 ?n2)
      (not (lyon_window_day ?d1))
    )
    :effect (and
      (not (at lyon))
      (at bucharest)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (count_lyon ?n1))
      (count_lyon ?n2)
    )
  )

  (:action fly_lyon_bucharest_window
    :parameters (?d1 - day ?d2 - day ?n1 - count ?n2 - count)
    :precondition (and
      (at lyon)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (direct_flight lyon bucharest)
      (count_lyon ?n1)
      (next_count ?n1 ?n2)
      (lyon_window_day ?d1)
    )
    :effect (and
      (not (at lyon))
      (at bucharest)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (count_lyon ?n1))
      (count_lyon ?n2)
      (visited_relatives)
    )
  )

  (:action finish_in_manchester
    :parameters (?n1 - count ?n2 - count)
    :precondition (and
      (at manchester)
      (current_day d17)
      (count_manchester ?n1)
      (next_count ?n1 ?n2)
      (not (trip_finished))
    )
    :effect (and
      (not (count_manchester ?n1))
      (count_manchester ?n2)
      (trip_finished)
    )
  )

  (:action finish_in_bucharest
    :parameters (?n1 - count ?n2 - count)
    :precondition (and
      (at bucharest)
      (current_day d17)
      (count_bucharest ?n1)
      (next_count ?n1 ?n2)
      (not (trip_finished))
    )
    :effect (and
      (not (count_bucharest ?n1))
      (count_bucharest ?n2)
      (trip_finished)
    )
  )

  (:action finish_in_lyon_nonwindow
    :parameters (?n1 - count ?n2 - count)
    :precondition (and
      (at lyon)
      (current_day d17)
      (count_lyon ?n1)
      (next_count ?n1 ?n2)
      (not (trip_finished))
      (not (lyon_window_day d17))
    )
    :effect (and
      (not (count_lyon ?n1))
      (count_lyon ?n2)
      (trip_finished)
    )
  )

  (:action finish_in_lyon_window
    :parameters (?n1 - count ?n2 - count)
    :precondition (and
      (at lyon)
      (current_day d17)
      (count_lyon ?n1)
      (next_count ?n1 ?n2)
      (not (trip_finished))
      (lyon_window_day d17)
    )
    :effect (and
      (not (count_lyon ?n1))
      (count_lyon ?n2)
      (visited_relatives)
      (trip_finished)
    )
  )
)