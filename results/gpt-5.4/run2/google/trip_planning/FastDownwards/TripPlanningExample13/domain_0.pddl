(define (domain european_trip_17_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city day
  )

  (:predicates
    (at ?c - city)
    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (direct_flight ?from - city ?to - city)
    (lyon_window_day ?d - day)
    (relatives_visited)
    (finished)

    (lyon_days_0)
    (lyon_days_1)
    (lyon_days_2)
    (lyon_days_3)
    (lyon_days_4)
    (lyon_days_5)

    (bucharest_days_0)
    (bucharest_days_1)
    (bucharest_days_2)
    (bucharest_days_3)
    (bucharest_days_4)
    (bucharest_days_5)
    (bucharest_days_6)
    (bucharest_days_7)

    (manchester_days_0)
    (manchester_days_1)
    (manchester_days_2)
    (manchester_days_3)
    (manchester_days_4)
    (manchester_days_5)
    (manchester_days_6)
    (manchester_days_7)

    (start_chosen)
  )

  (:action choose_start_manchester
    :precondition (not (start_chosen))
    :effect (and
      (start_chosen)
      (at manchester)
    )
  )

  (:action choose_start_bucharest
    :precondition (not (start_chosen))
    :effect (and
      (start_chosen)
      (at bucharest)
    )
  )

  (:action choose_start_lyon
    :precondition (not (start_chosen))
    :effect (and
      (start_chosen)
      (at lyon)
    )
  )

  (:action spend_day_stay_manchester_0_1
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (start_chosen)
      (current_day ?d)
      (next_day ?d ?d2)
      (at manchester)
      (manchester_days_0)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (manchester_days_0))
      (manchester_days_1)
    )
  )

  (:action spend_day_stay_manchester_1_2
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (start_chosen)
      (current_day ?d)
      (next_day ?d ?d2)
      (at manchester)
      (manchester_days_1)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (manchester_days_1))
      (manchester_days_2)
    )
  )

  (:action spend_day_stay_manchester_2_3
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (start_chosen)
      (current_day ?d)
      (next_day ?d ?d2)
      (at manchester)
      (manchester_days_2)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (manchester_days_2))
      (manchester_days_3)
    )
  )

  (:action spend_day_stay_manchester_3_4
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (start_chosen)
      (current_day ?d)
      (next_day ?d ?d2)
      (at manchester)
      (manchester_days_3)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (manchester_days_3))
      (manchester_days_4)
    )
  )

  (:action spend_day_stay_manchester_4_5
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (start_chosen)
      (current_day ?d)
      (next_day ?d ?d2)
      (at manchester)
      (manchester_days_4)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (manchester_days_4))
      (manchester_days_5)
    )
  )

  (:action spend_day_stay_manchester_5_6
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (start_chosen)
      (current_day ?d)
      (next_day ?d ?d2)
      (at manchester)
      (manchester_days_5)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (manchester_days_5))
      (manchester_days_6)
    )
  )

  (:action spend_day_stay_manchester_6_7
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (start_chosen)
      (current_day ?d)
      (next_day ?d ?d2)
      (at manchester)
      (manchester_days_6)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (manchester_days_6))
      (manchester_days_7)
    )
  )

  (:action spend_day_fly_manchester_to_bucharest_0_1
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (start_chosen)
      (current_day ?d)
      (next_day ?d ?d2)
      (at manchester)
      (direct_flight manchester bucharest)
      (manchester_days_0)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (at manchester))
      (at bucharest)
      (not (manchester_days_0))
      (manchester_days_1)
    )
  )

  (:action spend_day_fly_manchester_to_bucharest_1_2
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (start_chosen)
      (current_day ?d)
      (next_day ?d ?d2)
      (at manchester)
      (direct_flight manchester bucharest)
      (manchester_days_1)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (at manchester))
      (at bucharest)
      (not (manchester_days_1))
      (manchester_days_2)
    )
  )

  (:action spend_day_fly_manchester_to_bucharest_2_3
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (start_chosen)
      (current_day ?d)
      (next_day ?d ?d2)
      (at manchester)
      (direct_flight manchester bucharest)
      (manchester_days_2)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (at manchester))
      (at bucharest)
      (not (manchester_days_2))
      (manchester_days_3)
    )
  )

  (:action spend_day_fly_manchester_to_bucharest_3_4
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (start_chosen)
      (current_day ?d)
      (next_day ?d ?d2)
      (at manchester)
      (direct_flight manchester bucharest)
      (manchester_days_3)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (at manchester))
      (at bucharest)
      (not (manchester_days_3))
      (manchester_days_4)
    )
  )

  (:action spend_day_fly_manchester_to_bucharest_4_5
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (start_chosen)
      (current_day ?d)
      (next_day ?d ?d2)
      (at manchester)
      (direct_flight manchester bucharest)
      (manchester_days_4)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (at manchester))
      (at bucharest)
      (not (manchester_days_4))
      (manchester_days_5)
    )
  )

  (:action spend_day_fly_manchester_to_bucharest_5_6
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (start_chosen)
      (current_day ?d)
      (next_day ?d ?d2)
      (at manchester)
      (direct_flight manchester bucharest)
      (manchester_days_5)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (at manchester))
      (at bucharest)
      (not (manchester_days_5))
      (manchester_days_6)
    )
  )

  (:action spend_day_fly_manchester_to_bucharest_6_7
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (start_chosen)
      (current_day ?d)
      (next_day ?d ?d2)
      (at manchester)
      (direct_flight manchester bucharest)
      (manchester_days_6)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (at manchester))
      (at bucharest)
      (not (manchester_days_6))
      (manchester_days_7)
    )
  )

  (:action spend_day_stay_bucharest_0_1
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (start_chosen)
      (current_day ?d)
      (next_day ?d ?d2)
      (at bucharest)
      (bucharest_days_0)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (bucharest_days_0))
      (bucharest_days_1)
    )
  )

  (:action spend_day_stay_bucharest_1_2
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (start_chosen)
      (current_day ?d)
      (next_day ?d ?d2)
      (at bucharest)
      (bucharest_days_1)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (bucharest_days_1))
      (bucharest_days_2)
    )
  )

  (:action spend_day_stay_bucharest_2_3
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (start_chosen)
      (current_day ?d)
      (next_day ?d ?d2)
      (at bucharest)
      (bucharest_days_2)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (bucharest_days_2))
      (bucharest_days_3)
    )
  )

  (:action spend_day_stay_bucharest_3_4
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (start_chosen)
      (current_day ?d)
      (next_day ?d ?d2)
      (at bucharest)
      (bucharest_days_3)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (bucharest_days_3))
      (bucharest_days_4)
    )
  )

  (:action spend_day_stay_bucharest_4_5
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (start_chosen)
      (current_day ?d)
      (next_day ?d ?d2)
      (at bucharest)
      (bucharest_days_4)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (bucharest_days_4))
      (bucharest_days_5)
    )
  )

  (:action spend_day_stay_bucharest_5_6
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (start_chosen)
      (current_day ?d)
      (next_day ?d ?d2)
      (at bucharest)
      (bucharest_days_5)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (bucharest_days_5))
      (bucharest_days_6)
    )
  )

  (:action spend_day_stay_bucharest_6_7
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (start_chosen)
      (current_day ?d)
      (next_day ?d ?d2)
      (at bucharest)
      (bucharest_days_6)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (bucharest_days_6))
      (bucharest_days_7)
    )
  )

  (:action spend_day_fly_bucharest_to_manchester_0_1
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (start_chosen)
      (current_day ?d)
      (next_day ?d ?d2)
      (at bucharest)
      (direct_flight bucharest manchester)
      (bucharest_days_0)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (at bucharest))
      (at manchester)
      (not (bucharest_days_0))
      (bucharest_days_1)
    )
  )

  (:action spend_day_fly_bucharest_to_manchester_1_2
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (start_chosen)
      (current_day ?d)
      (next_day ?d ?d2)
      (at bucharest)
      (direct_flight bucharest manchester)
      (bucharest_days_1)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (at bucharest))
      (at manchester)
      (not (bucharest_days_1))
      (bucharest_days_2)
    )
  )

  (:action spend_day_fly_bucharest_to_manchester_2_3
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (start_chosen)
      (current_day ?d)
      (next_day ?d ?d2)
      (at bucharest)
      (direct_flight bucharest manchester)
      (bucharest_days_2)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (at bucharest))
      (at manchester)
      (not (bucharest_days_2))
      (bucharest_days_3)
    )
  )

  (:action spend_day_fly_bucharest_to_manchester_3_4
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (start_chosen)
      (current_day ?d)
      (next_day ?d ?d2)
      (at bucharest)
      (direct_flight bucharest manchester)
      (bucharest_days_3)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (at bucharest))
      (at manchester)
      (not (bucharest_days_3))
      (bucharest_days_4)
    )
  )

  (:action spend_day_fly_bucharest_to_manchester_4_5
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (start_chosen)
      (current_day ?d)
      (next_day ?d ?d2)
      (at bucharest)
      (direct_flight bucharest manchester)
      (bucharest_days_4)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (at bucharest))
      (at manchester)
      (not (bucharest_days_4))
      (bucharest_days_5)
    )
  )

  (:action spend_day_fly_bucharest_to_manchester_5_6
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (start_chosen)
      (current_day ?d)
      (next_day ?d ?d2)
      (at bucharest)
      (direct_flight bucharest manchester)
      (bucharest_days_5)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (at bucharest))
      (at manchester)
      (not (bucharest_days_5))
      (bucharest_days_6)
    )
  )

  (:action spend_day_fly_bucharest_to_manchester_6_7
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (start_chosen)
      (current_day ?d)
      (next_day ?d ?d2)
      (at bucharest)
      (direct_flight bucharest manchester)
      (bucharest_days_6)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (at bucharest))
      (at manchester)
      (not (bucharest_days_6))
      (bucharest_days_7)
    )
  )

  (:action spend_day_fly_bucharest_to_lyon_0_1
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (start_chosen)
      (current_day ?d)
      (next_day ?d ?d2)
      (at bucharest)
      (direct_flight bucharest lyon)
      (bucharest_days_0)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (at bucharest))
      (at lyon)
      (not (bucharest_days_0))
      (bucharest_days_1)
    )
  )

  (:action spend_day_fly_bucharest_to_lyon_1_2
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (start_chosen)
      (current_day ?d)
      (next_day ?d ?d2)
      (at bucharest)
      (direct_flight bucharest lyon)
      (bucharest_days_1)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (at bucharest))
      (at lyon)
      (not (bucharest_days_1))
      (bucharest_days_2)
    )
  )

  (:action spend_day_fly_bucharest_to_lyon_2_3
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (start_chosen)
      (current_day ?d)
      (next_day ?d ?d2)
      (at bucharest)
      (direct_flight bucharest lyon)
      (bucharest_days_2)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (at bucharest))
      (at lyon)
      (not (bucharest_days_2))
      (bucharest_days_3)
    )
  )

  (:action spend_day_fly_bucharest_to_lyon_3_4
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (start_chosen)
      (current_day ?d)
      (next_day ?d ?d2)
      (at bucharest)
      (direct_flight bucharest lyon)
      (bucharest_days_3)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (at bucharest))
      (at lyon)
      (not (bucharest_days_3))
      (bucharest_days_4)
    )
  )

  (:action spend_day_fly_bucharest_to_lyon_4_5
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (start_chosen)
      (current_day ?d)
      (next_day ?d ?d2)
      (at bucharest)
      (direct_flight bucharest lyon)
      (bucharest_days_4)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (at bucharest))
      (at lyon)
      (not (bucharest_days_4))
      (bucharest_days_5)
    )
  )

  (:action spend_day_fly_bucharest_to_lyon_5_6
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (start_chosen)
      (current_day ?d)
      (next_day ?d ?d2)
      (at bucharest)
      (direct_flight bucharest lyon)
      (bucharest_days_5)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (at bucharest))
      (at lyon)
      (not (bucharest_days_5))
      (bucharest_days_6)
    )
  )

  (:action spend_day_fly_bucharest_to_lyon_6_7
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (start_chosen)
      (current_day ?d)
      (next_day ?d ?d2)
      (at bucharest)
      (direct_flight bucharest lyon)
      (bucharest_days_6)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (at bucharest))
      (at lyon)
      (not (bucharest_days_6))
      (bucharest_days_7)
    )
  )

  (:action spend_day_stay_lyon_0_1_nonwindow
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (start_chosen)
      (current_day ?d)
      (next_day ?d ?d2)
      (at lyon)
      (lyon_days_0)
      (not (lyon_window_day ?d))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (lyon_days_0))
      (lyon_days_1)
    )
  )

  (:action spend_day_stay_lyon_1_2_nonwindow
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (start_chosen)
      (current_day ?d)
      (next_day ?d ?d2)
      (at lyon)
      (lyon_days_1)
      (not (lyon_window_day ?d))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (lyon_days_1))
      (lyon_days_2)
    )
  )

  (:action spend_day_stay_lyon_2_3_nonwindow
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (start_chosen)
      (current_day ?d)
      (next_day ?d ?d2)
      (at lyon)
      (lyon_days_2)
      (not (lyon_window_day ?d))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (lyon_days_2))
      (lyon_days_3)
    )
  )

  (:action spend_day_stay_lyon_3_4_nonwindow
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (start_chosen)
      (current_day ?d)
      (next_day ?d ?d2)
      (at lyon)
      (lyon_days_3)
      (not (lyon_window_day ?d))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (lyon_days_3))
      (lyon_days_4)
    )
  )

  (:action spend_day_stay_lyon_4_5_nonwindow
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (start_chosen)
      (current_day ?d)
      (next_day ?d ?d2)
      (at lyon)
      (lyon_days_4)
      (not (lyon_window_day ?d))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (lyon_days_4))
      (lyon_days_5)
    )
  )

  (:action spend_day_fly_lyon_to_bucharest_0_1_nonwindow
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (start_chosen)
      (current_day ?d)
      (next_day ?d ?d2)
      (at lyon)
      (direct_flight lyon bucharest)
      (lyon_days_0)
      (not (lyon_window_day ?d))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (at lyon))
      (at bucharest)
      (not (lyon_days_0))
      (lyon_days_1)
    )
  )

  (:action spend_day_fly_lyon_to_bucharest_1_2_nonwindow
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (start_chosen)
      (current_day ?d)
      (next_day ?d ?d2)
      (at lyon)
      (direct_flight lyon bucharest)
      (lyon_days_1)
      (not (lyon_window_day ?d))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (at lyon))
      (at bucharest)
      (not (lyon_days_1))
      (lyon_days_2)
    )
  )

  (:action spend_day_fly_lyon_to_bucharest_2_3_nonwindow
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (start_chosen)
      (current_day ?d)
      (next_day ?d ?d2)
      (at lyon)
      (direct_flight lyon bucharest)
      (lyon_days_2)
      (not (lyon_window_day ?d))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (at lyon))
      (at bucharest)
      (not (lyon_days_2))
      (lyon_days_3)
    )
  )

  (:action spend_day_fly_lyon_to_bucharest_3_4_nonwindow
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (start_chosen)
      (current_day ?d)
      (next_day ?d ?d2)
      (at lyon)
      (direct_flight lyon bucharest)
      (lyon_days_3)
      (not (lyon_window_day ?d))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (at lyon))
      (at bucharest)
      (not (lyon_days_3))
      (lyon_days_4)
    )
  )

  (:action spend_day_fly_lyon_to_bucharest_4_5_nonwindow
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (start_chosen)
      (current_day ?d)
      (next_day ?d ?d2)
      (at lyon)
      (direct_flight lyon bucharest)
      (lyon_days_4)
      (not (lyon_window_day ?d))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (at lyon))
      (at bucharest)
      (not (lyon_days_4))
      (lyon_days_5)
    )
  )

  (:action spend_day_stay_lyon_0_1_window
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (start_chosen)
      (current_day ?d)
      (next_day ?d ?d2)
      (at lyon)
      (lyon_days_0)
      (lyon_window_day ?d)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (lyon_days_0))
      (lyon_days_1)
      (relatives_visited)
    )
  )

  (:action spend_day_stay_lyon_1_2_window
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (start_chosen)
      (current_day ?d)
      (next_day ?d ?d2)
      (at lyon)
      (lyon_days_1)
      (lyon_window_day ?d)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (lyon_days_1))
      (lyon_days_2)
      (relatives_visited)
    )
  )

  (:action spend_day_stay_lyon_2_3_window
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (start_chosen)
      (current_day ?d)
      (next_day ?d ?d2)
      (at lyon)
      (lyon_days_2)
      (lyon_window_day ?d)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (lyon_days_2))
      (lyon_days_3)
      (relatives_visited)
    )
  )

  (:action spend_day_stay_lyon_3_4_window
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (start_chosen)
      (current_day ?d)
      (next_day ?d ?d2)
      (at lyon)
      (lyon_days_3)
      (lyon_window_day ?d)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (lyon_days_3))
      (lyon_days_4)
      (relatives_visited)
    )
  )

  (:action spend_day_stay_lyon_4_5_window
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (start_chosen)
      (current_day ?d)
      (next_day ?d ?d2)
      (at lyon)
      (lyon_days_4)
      (lyon_window_day ?d)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (lyon_days_4))
      (lyon_days_5)
      (relatives_visited)
    )
  )

  (:action spend_day_fly_lyon_to_bucharest_0_1_window
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (start_chosen)
      (current_day ?d)
      (next_day ?d ?d2)
      (at lyon)
      (direct_flight lyon bucharest)
      (lyon_days_0)
      (lyon_window_day ?d)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (at lyon))
      (at bucharest)
      (not (lyon_days_0))
      (lyon_days_1)
      (relatives_visited)
    )
  )

  (:action spend_day_fly_lyon_to_bucharest_1_2_window
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (start_chosen)
      (current_day ?d)
      (next_day ?d ?d2)
      (at lyon)
      (direct_flight lyon bucharest)
      (lyon_days_1)
      (lyon_window_day ?d)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (at lyon))
      (at bucharest)
      (not (lyon_days_1))
      (lyon_days_2)
      (relatives_visited)
    )
  )

  (:action spend_day_fly_lyon_to_bucharest_2_3_window
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (start_chosen)
      (current_day ?d)
      (next_day ?d ?d2)
      (at lyon)
      (direct_flight lyon bucharest)
      (lyon_days_2)
      (lyon_window_day ?d)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (at lyon))
      (at bucharest)
      (not (lyon_days_2))
      (lyon_days_3)
      (relatives_visited)
    )
  )

  (:action spend_day_fly_lyon_to_bucharest_3_4_window
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (start_chosen)
      (current_day ?d)
      (next_day ?d ?d2)
      (at lyon)
      (direct_flight lyon bucharest)
      (lyon_days_3)
      (lyon_window_day ?d)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (at lyon))
      (at bucharest)
      (not (lyon_days_3))
      (lyon_days_4)
      (relatives_visited)
    )
  )

  (:action spend_day_fly_lyon_to_bucharest_4_5_window
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (start_chosen)
      (current_day ?d)
      (next_day ?d ?d2)
      (at lyon)
      (direct_flight lyon bucharest)
      (lyon_days_4)
      (lyon_window_day ?d)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (at lyon))
      (at bucharest)
      (not (lyon_days_4))
      (lyon_days_5)
      (relatives_visited)
    )
  )

  (:action spend_final_day_manchester_0_1
    :precondition (and
      (start_chosen)
      (current_day d17)
      (at manchester)
      (manchester_days_0)
      (not (finished))
    )
    :effect (and
      (not (manchester_days_0))
      (manchester_days_1)
      (finished)
    )
  )

  (:action spend_final_day_manchester_1_2
    :precondition (and
      (start_chosen)
      (current_day d17)
      (at manchester)
      (manchester_days_1)
      (not (finished))
    )
    :effect (and
      (not (manchester_days_1))
      (manchester_days_2)
      (finished)
    )
  )

  (:action spend_final_day_manchester_2_3
    :precondition (and
      (start_chosen)
      (current_day d17)
      (at manchester)
      (manchester_days_2)
      (not (finished))
    )
    :effect (and
      (not (manchester_days_2))
      (manchester_days_3)
      (finished)
    )
  )

  (:action spend_final_day_manchester_3_4
    :precondition (and
      (start_chosen)
      (current_day d17)
      (at manchester)
      (manchester_days_3)
      (not (finished))
    )
    :effect (and
      (not (manchester_days_3))
      (manchester_days_4)
      (finished)
    )
  )

  (:action spend_final_day_manchester_4_5
    :precondition (and
      (start_chosen)
      (current_day d17)
      (at manchester)
      (manchester_days_4)
      (not (finished))
    )
    :effect (and
      (not (manchester_days_4))
      (manchester_days_5)
      (finished)
    )
  )

  (:action spend_final_day_manchester_5_6
    :precondition (and
      (start_chosen)
      (current_day d17)
      (at manchester)
      (manchester_days_5)
      (not (finished))
    )
    :effect (and
      (not (manchester_days_5))
      (manchester_days_6)
      (finished)
    )
  )

  (:action spend_final_day_manchester_6_7
    :precondition (and
      (start_chosen)
      (current_day d17)
      (at manchester)
      (manchester_days_6)
      (not (finished))
    )
    :effect (and
      (not (manchester_days_6))
      (manchester_days_7)
      (finished)
    )
  )

  (:action spend_final_day_bucharest_0_1
    :precondition (and
      (start_chosen)
      (current_day d17)
      (at bucharest)
      (bucharest_days_0)
      (not (finished))
    )
    :effect (and
      (not (bucharest_days_0))
      (bucharest_days_1)
      (finished)
    )
  )

  (:action spend_final_day_bucharest_1_2
    :precondition (and
      (start_chosen)
      (current_day d17)
      (at bucharest)
      (bucharest_days_1)
      (not (finished))
    )
    :effect (and
      (not (bucharest_days_1))
      (bucharest_days_2)
      (finished)
    )
  )

  (:action spend_final_day_bucharest_2_3
    :precondition (and
      (start_chosen)
      (current_day d17)
      (at bucharest)
      (bucharest_days_2)
      (not (finished))
    )
    :effect (and
      (not (bucharest_days_2))
      (bucharest_days_3)
      (finished)
    )
  )

  (:action spend_final_day_bucharest_3_4
    :precondition (and
      (start_chosen)
      (current_day d17)
      (at bucharest)
      (bucharest_days_3)
      (not (finished))
    )
    :effect (and
      (not (bucharest_days_3))
      (bucharest_days_4)
      (finished)
    )
  )

  (:action spend_final_day_bucharest_4_5
    :precondition (and
      (start_chosen)
      (current_day d17)
      (at bucharest)
      (bucharest_days_4)
      (not (finished))
    )
    :effect (and
      (not (bucharest_days_4))
      (bucharest_days_5)
      (finished)
    )
  )

  (:action spend_final_day_bucharest_5_6
    :precondition (and
      (start_chosen)
      (current_day d17)
      (at bucharest)
      (bucharest_days_5)
      (not (finished))
    )
    :effect (and
      (not (bucharest_days_5))
      (bucharest_days_6)
      (finished)
    )
  )

  (:action spend_final_day_bucharest_6_7
    :precondition (and
      (start_chosen)
      (current_day d17)
      (at bucharest)
      (bucharest_days_6)
      (not (finished))
    )
    :effect (and
      (not (bucharest_days_6))
      (bucharest_days_7)
      (finished)
    )
  )

  (:action spend_final_day_lyon_0_1
    :precondition (and
      (start_chosen)
      (current_day d17)
      (at lyon)
      (lyon_days_0)
      (not (finished))
    )
    :effect (and
      (not (lyon_days_0))
      (lyon_days_1)
      (relatives_visited)
      (finished)
    )
  )

  (:action spend_final_day_lyon_1_2
    :precondition (and
      (start_chosen)
      (current_day d17)
      (at lyon)
      (lyon_days_1)
      (not (finished))
    )
    :effect (and
      (not (lyon_days_1))
      (lyon_days_2)
      (relatives_visited)
      (finished)
    )
  )

  (:action spend_final_day_lyon_2_3
    :precondition (and
      (start_chosen)
      (current_day d17)
      (at lyon)
      (lyon_days_2)
      (not (finished))
    )
    :effect (and
      (not (lyon_days_2))
      (lyon_days_3)
      (relatives_visited)
      (finished)
    )
  )

  (:action spend_final_day_lyon_3_4
    :precondition (and
      (start_chosen)
      (current_day d17)
      (at lyon)
      (lyon_days_3)
      (not (finished))
    )
    :effect (and
      (not (lyon_days_3))
      (lyon_days_4)
      (relatives_visited)
      (finished)
    )
  )

  (:action spend_final_day_lyon_4_5
    :precondition (and
      (start_chosen)
      (current_day d17)
      (at lyon)
      (lyon_days_4)
      (not (finished))
    )
    :effect (and
      (not (lyon_days_4))
      (lyon_days_5)
      (relatives_visited)
      (finished)
    )
  )
)