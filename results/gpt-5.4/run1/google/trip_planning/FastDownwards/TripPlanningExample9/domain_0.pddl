(define (domain european_trip_10_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types city day)

  (:predicates
    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (at ?c - city)
    (direct_flight ?from - city ?to - city)
    (workshop_window_day ?d - day)
    (workshop_attended)

    (frankfurt_day_0)
    (frankfurt_day_1)
    (frankfurt_day_2)
    (frankfurt_day_3)

    (bucharest_day_0)
    (bucharest_day_1)
    (bucharest_day_2)
    (bucharest_day_3)

    (stuttgart_day_0)
    (stuttgart_day_1)
    (stuttgart_day_2)
    (stuttgart_day_3)
    (stuttgart_day_4)
    (stuttgart_day_5)
    (stuttgart_day_6)
  )

  (:action stay_frankfurt_0_1
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at frankfurt)
      (frankfurt_day_0)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (frankfurt_day_0))
      (frankfurt_day_1)
    )
  )

  (:action stay_frankfurt_1_2
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at frankfurt)
      (frankfurt_day_1)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (frankfurt_day_1))
      (frankfurt_day_2)
    )
  )

  (:action stay_frankfurt_2_3
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at frankfurt)
      (frankfurt_day_2)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (frankfurt_day_2))
      (frankfurt_day_3)
    )
  )

  (:action stay_bucharest_0_1
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at bucharest)
      (bucharest_day_0)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (bucharest_day_0))
      (bucharest_day_1)
    )
  )

  (:action stay_bucharest_1_2
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at bucharest)
      (bucharest_day_1)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (bucharest_day_1))
      (bucharest_day_2)
    )
  )

  (:action stay_bucharest_2_3
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at bucharest)
      (bucharest_day_2)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (bucharest_day_2))
      (bucharest_day_3)
    )
  )

  (:action stay_stuttgart_0_1_nonwindow
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at stuttgart)
      (stuttgart_day_0)
      (not (workshop_window_day ?d))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (stuttgart_day_0))
      (stuttgart_day_1)
    )
  )

  (:action stay_stuttgart_0_1_window
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at stuttgart)
      (stuttgart_day_0)
      (workshop_window_day ?d)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (stuttgart_day_0))
      (stuttgart_day_1)
      (workshop_attended)
    )
  )

  (:action stay_stuttgart_1_2_nonwindow
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at stuttgart)
      (stuttgart_day_1)
      (not (workshop_window_day ?d))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (stuttgart_day_1))
      (stuttgart_day_2)
    )
  )

  (:action stay_stuttgart_1_2_window
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at stuttgart)
      (stuttgart_day_1)
      (workshop_window_day ?d)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (stuttgart_day_1))
      (stuttgart_day_2)
      (workshop_attended)
    )
  )

  (:action stay_stuttgart_2_3_nonwindow
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at stuttgart)
      (stuttgart_day_2)
      (not (workshop_window_day ?d))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (stuttgart_day_2))
      (stuttgart_day_3)
    )
  )

  (:action stay_stuttgart_2_3_window
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at stuttgart)
      (stuttgart_day_2)
      (workshop_window_day ?d)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (stuttgart_day_2))
      (stuttgart_day_3)
      (workshop_attended)
    )
  )

  (:action stay_stuttgart_3_4_nonwindow
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at stuttgart)
      (stuttgart_day_3)
      (not (workshop_window_day ?d))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (stuttgart_day_3))
      (stuttgart_day_4)
    )
  )

  (:action stay_stuttgart_3_4_window
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at stuttgart)
      (stuttgart_day_3)
      (workshop_window_day ?d)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (stuttgart_day_3))
      (stuttgart_day_4)
      (workshop_attended)
    )
  )

  (:action stay_stuttgart_4_5_nonwindow
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at stuttgart)
      (stuttgart_day_4)
      (not (workshop_window_day ?d))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (stuttgart_day_4))
      (stuttgart_day_5)
    )
  )

  (:action stay_stuttgart_4_5_window
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at stuttgart)
      (stuttgart_day_4)
      (workshop_window_day ?d)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (stuttgart_day_4))
      (stuttgart_day_5)
      (workshop_attended)
    )
  )

  (:action stay_stuttgart_5_6_nonwindow
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at stuttgart)
      (stuttgart_day_5)
      (not (workshop_window_day ?d))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (stuttgart_day_5))
      (stuttgart_day_6)
    )
  )

  (:action stay_stuttgart_5_6_window
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at stuttgart)
      (stuttgart_day_5)
      (workshop_window_day ?d)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (stuttgart_day_5))
      (stuttgart_day_6)
      (workshop_attended)
    )
  )

  (:action fly_to_frankfurt_0_1
    :parameters (?from - city ?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at ?from)
      (not (at frankfurt))
      (direct_flight ?from frankfurt)
      (frankfurt_day_0)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at ?from))
      (at frankfurt)
      (not (frankfurt_day_0))
      (frankfurt_day_1)
    )
  )

  (:action fly_to_frankfurt_1_2
    :parameters (?from - city ?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at ?from)
      (not (at frankfurt))
      (direct_flight ?from frankfurt)
      (frankfurt_day_1)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at ?from))
      (at frankfurt)
      (not (frankfurt_day_1))
      (frankfurt_day_2)
    )
  )

  (:action fly_to_frankfurt_2_3
    :parameters (?from - city ?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at ?from)
      (not (at frankfurt))
      (direct_flight ?from frankfurt)
      (frankfurt_day_2)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at ?from))
      (at frankfurt)
      (not (frankfurt_day_2))
      (frankfurt_day_3)
    )
  )

  (:action fly_to_bucharest_0_1
    :parameters (?from - city ?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at ?from)
      (not (at bucharest))
      (direct_flight ?from bucharest)
      (bucharest_day_0)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at ?from))
      (at bucharest)
      (not (bucharest_day_0))
      (bucharest_day_1)
    )
  )

  (:action fly_to_bucharest_1_2
    :parameters (?from - city ?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at ?from)
      (not (at bucharest))
      (direct_flight ?from bucharest)
      (bucharest_day_1)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at ?from))
      (at bucharest)
      (not (bucharest_day_1))
      (bucharest_day_2)
    )
  )

  (:action fly_to_bucharest_2_3
    :parameters (?from - city ?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at ?from)
      (not (at bucharest))
      (direct_flight ?from bucharest)
      (bucharest_day_2)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at ?from))
      (at bucharest)
      (not (bucharest_day_2))
      (bucharest_day_3)
    )
  )

  (:action fly_to_stuttgart_0_1_nonwindow
    :parameters (?from - city ?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at ?from)
      (not (at stuttgart))
      (direct_flight ?from stuttgart)
      (stuttgart_day_0)
      (not (workshop_window_day ?d))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at ?from))
      (at stuttgart)
      (not (stuttgart_day_0))
      (stuttgart_day_1)
    )
  )

  (:action fly_to_stuttgart_0_1_window
    :parameters (?from - city ?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at ?from)
      (not (at stuttgart))
      (direct_flight ?from stuttgart)
      (stuttgart_day_0)
      (workshop_window_day ?d)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at ?from))
      (at stuttgart)
      (not (stuttgart_day_0))
      (stuttgart_day_1)
      (workshop_attended)
    )
  )

  (:action fly_to_stuttgart_1_2_nonwindow
    :parameters (?from - city ?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at ?from)
      (not (at stuttgart))
      (direct_flight ?from stuttgart)
      (stuttgart_day_1)
      (not (workshop_window_day ?d))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at ?from))
      (at stuttgart)
      (not (stuttgart_day_1))
      (stuttgart_day_2)
    )
  )

  (:action fly_to_stuttgart_1_2_window
    :parameters (?from - city ?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at ?from)
      (not (at stuttgart))
      (direct_flight ?from stuttgart)
      (stuttgart_day_1)
      (workshop_window_day ?d)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at ?from))
      (at stuttgart)
      (not (stuttgart_day_1))
      (stuttgart_day_2)
      (workshop_attended)
    )
  )

  (:action fly_to_stuttgart_2_3_nonwindow
    :parameters (?from - city ?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at ?from)
      (not (at stuttgart))
      (direct_flight ?from stuttgart)
      (stuttgart_day_2)
      (not (workshop_window_day ?d))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at ?from))
      (at stuttgart)
      (not (stuttgart_day_2))
      (stuttgart_day_3)
    )
  )

  (:action fly_to_stuttgart_2_3_window
    :parameters (?from - city ?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at ?from)
      (not (at stuttgart))
      (direct_flight ?from stuttgart)
      (stuttgart_day_2)
      (workshop_window_day ?d)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at ?from))
      (at stuttgart)
      (not (stuttgart_day_2))
      (stuttgart_day_3)
      (workshop_attended)
    )
  )

  (:action fly_to_stuttgart_3_4_nonwindow
    :parameters (?from - city ?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at ?from)
      (not (at stuttgart))
      (direct_flight ?from stuttgart)
      (stuttgart_day_3)
      (not (workshop_window_day ?d))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at ?from))
      (at stuttgart)
      (not (stuttgart_day_3))
      (stuttgart_day_4)
    )
  )

  (:action fly_to_stuttgart_3_4_window
    :parameters (?from - city ?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at ?from)
      (not (at stuttgart))
      (direct_flight ?from stuttgart)
      (stuttgart_day_3)
      (workshop_window_day ?d)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at ?from))
      (at stuttgart)
      (not (stuttgart_day_3))
      (stuttgart_day_4)
      (workshop_attended)
    )
  )

  (:action fly_to_stuttgart_4_5_nonwindow
    :parameters (?from - city ?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at ?from)
      (not (at stuttgart))
      (direct_flight ?from stuttgart)
      (stuttgart_day_4)
      (not (workshop_window_day ?d))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at ?from))
      (at stuttgart)
      (not (stuttgart_day_4))
      (stuttgart_day_5)
    )
  )

  (:action fly_to_stuttgart_4_5_window
    :parameters (?from - city ?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at ?from)
      (not (at stuttgart))
      (direct_flight ?from stuttgart)
      (stuttgart_day_4)
      (workshop_window_day ?d)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at ?from))
      (at stuttgart)
      (not (stuttgart_day_4))
      (stuttgart_day_5)
      (workshop_attended)
    )
  )

  (:action fly_to_stuttgart_5_6_nonwindow
    :parameters (?from - city ?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at ?from)
      (not (at stuttgart))
      (direct_flight ?from stuttgart)
      (stuttgart_day_5)
      (not (workshop_window_day ?d))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at ?from))
      (at stuttgart)
      (not (stuttgart_day_5))
      (stuttgart_day_6)
    )
  )

  (:action fly_to_stuttgart_5_6_window
    :parameters (?from - city ?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at ?from)
      (not (at stuttgart))
      (direct_flight ?from stuttgart)
      (stuttgart_day_5)
      (workshop_window_day ?d)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at ?from))
      (at stuttgart)
      (not (stuttgart_day_5))
      (stuttgart_day_6)
      (workshop_attended)
    )
  )
)