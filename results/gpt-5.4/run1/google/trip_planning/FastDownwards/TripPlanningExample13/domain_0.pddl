(define (domain european_trip_17days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    traveler_type
    city
    day
    count7
    count5
  )

  (:constants
    traveler - traveler_type
    manchester bucharest lyon - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 d17 - day
    c0_7 c1_7 c2_7 c3_7 c4_7 c5_7 c6_7 c7_7 - count7
    c0_5 c1_5 c2_5 c3_5 c4_5 c5_5 - count5
  )

  (:predicates
    (at ?t - traveler_type ?c - city)
    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (direct_flight ?from - city ?to - city)
    (m_count ?n - count7)
    (b_count ?n - count7)
    (l_count ?n - count5)
    (next_count7 ?a - count7 ?b - count7)
    (next_count5 ?a - count5 ?b - count5)
    (lyon_window_day ?d - day)
    (lyon_window_covered ?d - day)
    (finished)
  )

  (:action stay_and_advance_in_manchester
    :parameters (?d - day ?d2 - day ?cm - count7 ?cm2 - count7)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at traveler manchester)
      (m_count ?cm)
      (next_count7 ?cm ?cm2)
      (not (finished))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (m_count ?cm))
      (m_count ?cm2)
    )
  )

  (:action stay_and_advance_in_bucharest
    :parameters (?d - day ?d2 - day ?cb - count7 ?cb2 - count7)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at traveler bucharest)
      (b_count ?cb)
      (next_count7 ?cb ?cb2)
      (not (finished))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (b_count ?cb))
      (b_count ?cb2)
    )
  )

  (:action stay_and_advance_in_lyon_window
    :parameters (?d - day ?d2 - day ?cl - count5 ?cl2 - count5)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at traveler lyon)
      (l_count ?cl)
      (next_count5 ?cl ?cl2)
      (lyon_window_day ?d)
      (not (finished))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (l_count ?cl))
      (l_count ?cl2)
      (lyon_window_covered ?d)
    )
  )

  (:action stay_and_advance_in_lyon_nonwindow
    :parameters (?d - day ?d2 - day ?cl - count5 ?cl2 - count5)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at traveler lyon)
      (l_count ?cl)
      (next_count5 ?cl ?cl2)
      (not (lyon_window_day ?d))
      (not (finished))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (l_count ?cl))
      (l_count ?cl2)
    )
  )

  (:action fly_manchester_to_bucharest_and_advance
    :parameters (?d - day ?d2 - day ?cm - count7 ?cm2 - count7)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at traveler manchester)
      (direct_flight manchester bucharest)
      (m_count ?cm)
      (next_count7 ?cm ?cm2)
      (not (finished))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (at traveler manchester))
      (at traveler bucharest)
      (not (m_count ?cm))
      (m_count ?cm2)
    )
  )

  (:action fly_bucharest_to_manchester_and_advance
    :parameters (?d - day ?d2 - day ?cb - count7 ?cb2 - count7)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at traveler bucharest)
      (direct_flight bucharest manchester)
      (b_count ?cb)
      (next_count7 ?cb ?cb2)
      (not (finished))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (at traveler bucharest))
      (at traveler manchester)
      (not (b_count ?cb))
      (b_count ?cb2)
    )
  )

  (:action fly_bucharest_to_lyon_and_advance
    :parameters (?d - day ?d2 - day ?cb - count7 ?cb2 - count7)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at traveler bucharest)
      (direct_flight bucharest lyon)
      (b_count ?cb)
      (next_count7 ?cb ?cb2)
      (not (finished))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (at traveler bucharest))
      (at traveler lyon)
      (not (b_count ?cb))
      (b_count ?cb2)
    )
  )

  (:action fly_lyon_to_bucharest_and_advance_window
    :parameters (?d - day ?d2 - day ?cl - count5 ?cl2 - count5)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at traveler lyon)
      (direct_flight lyon bucharest)
      (l_count ?cl)
      (next_count5 ?cl ?cl2)
      (lyon_window_day ?d)
      (not (finished))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (at traveler lyon))
      (at traveler bucharest)
      (not (l_count ?cl))
      (l_count ?cl2)
      (lyon_window_covered ?d)
    )
  )

  (:action fly_lyon_to_bucharest_and_advance_nonwindow
    :parameters (?d - day ?d2 - day ?cl - count5 ?cl2 - count5)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at traveler lyon)
      (direct_flight lyon bucharest)
      (l_count ?cl)
      (next_count5 ?cl ?cl2)
      (not (lyon_window_day ?d))
      (not (finished))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (at traveler lyon))
      (at traveler bucharest)
      (not (l_count ?cl))
      (l_count ?cl2)
    )
  )

  (:action finalize_last_day_in_manchester
    :parameters (?cm - count7 ?cm2 - count7)
    :precondition (and
      (current_day d17)
      (at traveler manchester)
      (m_count ?cm)
      (next_count7 ?cm ?cm2)
      (not (finished))
    )
    :effect (and
      (not (current_day d17))
      (not (m_count ?cm))
      (m_count ?cm2)
      (finished)
    )
  )

  (:action finalize_last_day_in_bucharest
    :parameters (?cb - count7 ?cb2 - count7)
    :precondition (and
      (current_day d17)
      (at traveler bucharest)
      (b_count ?cb)
      (next_count7 ?cb ?cb2)
      (not (finished))
    )
    :effect (and
      (not (current_day d17))
      (not (b_count ?cb))
      (b_count ?cb2)
      (finished)
    )
  )

  (:action finalize_last_day_in_lyon_window
    :parameters (?cl - count5 ?cl2 - count5)
    :precondition (and
      (current_day d17)
      (at traveler lyon)
      (l_count ?cl)
      (next_count5 ?cl ?cl2)
      (lyon_window_day d17)
      (not (finished))
    )
    :effect (and
      (not (current_day d17))
      (not (l_count ?cl))
      (l_count ?cl2)
      (lyon_window_covered d17)
      (finished)
    )
  )

  (:action finalize_last_day_in_lyon_nonwindow
    :parameters (?cl - count5 ?cl2 - count5)
    :precondition (and
      (current_day d17)
      (at traveler lyon)
      (l_count ?cl)
      (next_count5 ?cl ?cl2)
      (not (lyon_window_day d17))
      (not (finished))
    )
    :effect (and
      (not (current_day d17))
      (not (l_count ?cl))
      (l_count ?cl2)
      (finished)
    )
  )
)