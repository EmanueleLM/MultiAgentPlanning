(define (domain european_trip_8_days_instance)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (at ?c - city)
    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (direct_flight ?from - city ?to - city)
    (spent_day_in ?d - day ?c - city)
    (workshop_day ?d - day)
    (workshop_attended)

    (london_count_0)
    (london_count_1)
    (london_count_2)
    (london_count_3)

    (bucharest_count_0)
    (bucharest_count_1)
    (bucharest_count_2)
    (bucharest_count_3)

    (riga_count_0)
    (riga_count_1)
    (riga_count_2)
    (riga_count_3)
    (riga_count_4)
  )

  (:action stay_london_from_0
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at london)
      (london_count_0))
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (spent_day_in ?d london)
      (not (london_count_0))
      (london_count_1))
  )

  (:action stay_london_from_1
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at london)
      (london_count_1))
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (spent_day_in ?d london)
      (not (london_count_1))
      (london_count_2))
  )

  (:action stay_london_from_2
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at london)
      (london_count_2))
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (spent_day_in ?d london)
      (not (london_count_2))
      (london_count_3))
  )

  (:action stay_bucharest_from_0
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at bucharest)
      (bucharest_count_0))
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (spent_day_in ?d bucharest)
      (not (bucharest_count_0))
      (bucharest_count_1))
  )

  (:action stay_bucharest_from_1
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at bucharest)
      (bucharest_count_1))
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (spent_day_in ?d bucharest)
      (not (bucharest_count_1))
      (bucharest_count_2))
  )

  (:action stay_bucharest_from_2
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at bucharest)
      (bucharest_count_2))
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (spent_day_in ?d bucharest)
      (not (bucharest_count_2))
      (bucharest_count_3))
  )

  (:action stay_riga_from_0
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at riga)
      (riga_count_0))
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (spent_day_in ?d riga)
      (not (riga_count_0))
      (riga_count_1))
  )

  (:action stay_riga_from_1
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at riga)
      (riga_count_1))
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (spent_day_in ?d riga)
      (not (riga_count_1))
      (riga_count_2))
  )

  (:action stay_riga_from_2
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at riga)
      (riga_count_2))
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (spent_day_in ?d riga)
      (not (riga_count_2))
      (riga_count_3))
  )

  (:action stay_riga_from_3
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at riga)
      (riga_count_3))
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (spent_day_in ?d riga)
      (not (riga_count_3))
      (riga_count_4))
  )

  (:action fly_london_to_bucharest_from_0
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at london)
      (direct_flight london bucharest)
      (bucharest_count_0))
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at london))
      (at bucharest)
      (spent_day_in ?d bucharest)
      (not (bucharest_count_0))
      (bucharest_count_1))
  )

  (:action fly_london_to_bucharest_from_1
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at london)
      (direct_flight london bucharest)
      (bucharest_count_1))
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at london))
      (at bucharest)
      (spent_day_in ?d bucharest)
      (not (bucharest_count_1))
      (bucharest_count_2))
  )

  (:action fly_london_to_bucharest_from_2
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at london)
      (direct_flight london bucharest)
      (bucharest_count_2))
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at london))
      (at bucharest)
      (spent_day_in ?d bucharest)
      (not (bucharest_count_2))
      (bucharest_count_3))
  )

  (:action fly_bucharest_to_london_from_0
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at bucharest)
      (direct_flight bucharest london)
      (london_count_0))
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at bucharest))
      (at london)
      (spent_day_in ?d london)
      (not (london_count_0))
      (london_count_1))
  )

  (:action fly_bucharest_to_london_from_1
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at bucharest)
      (direct_flight bucharest london)
      (london_count_1))
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at bucharest))
      (at london)
      (spent_day_in ?d london)
      (not (london_count_1))
      (london_count_2))
  )

  (:action fly_bucharest_to_london_from_2
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at bucharest)
      (direct_flight bucharest london)
      (london_count_2))
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at bucharest))
      (at london)
      (spent_day_in ?d london)
      (not (london_count_2))
      (london_count_3))
  )

  (:action fly_bucharest_to_riga_from_0
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at bucharest)
      (direct_flight bucharest riga)
      (riga_count_0))
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at bucharest))
      (at riga)
      (spent_day_in ?d riga)
      (not (riga_count_0))
      (riga_count_1))
  )

  (:action fly_bucharest_to_riga_from_1
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at bucharest)
      (direct_flight bucharest riga)
      (riga_count_1))
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at bucharest))
      (at riga)
      (spent_day_in ?d riga)
      (not (riga_count_1))
      (riga_count_2))
  )

  (:action fly_bucharest_to_riga_from_2
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at bucharest)
      (direct_flight bucharest riga)
      (riga_count_2))
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at bucharest))
      (at riga)
      (spent_day_in ?d riga)
      (not (riga_count_2))
      (riga_count_3))
  )

  (:action fly_bucharest_to_riga_from_3
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at bucharest)
      (direct_flight bucharest riga)
      (riga_count_3))
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at bucharest))
      (at riga)
      (spent_day_in ?d riga)
      (not (riga_count_3))
      (riga_count_4))
  )

  (:action fly_riga_to_bucharest_from_0
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at riga)
      (direct_flight riga bucharest)
      (bucharest_count_0))
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at riga))
      (at bucharest)
      (spent_day_in ?d bucharest)
      (not (bucharest_count_0))
      (bucharest_count_1))
  )

  (:action fly_riga_to_bucharest_from_1
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at riga)
      (direct_flight riga bucharest)
      (bucharest_count_1))
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at riga))
      (at bucharest)
      (spent_day_in ?d bucharest)
      (not (bucharest_count_1))
      (bucharest_count_2))
  )

  (:action fly_riga_to_bucharest_from_2
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at riga)
      (direct_flight riga bucharest)
      (bucharest_count_2))
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at riga))
      (at bucharest)
      (spent_day_in ?d bucharest)
      (not (bucharest_count_2))
      (bucharest_count_3))
  )

  (:action certify_workshop_day_5
    :parameters ()
    :precondition (and
      (spent_day_in day_5 riga)
      (not (workshop_attended)))
    :effect (and
      (workshop_attended))
  )

  (:action certify_workshop_day_6
    :parameters ()
    :precondition (and
      (spent_day_in day_6 riga)
      (not (workshop_attended)))
    :effect (and
      (workshop_attended))
  )

  (:action certify_workshop_day_7
    :parameters ()
    :precondition (and
      (spent_day_in day_7 riga)
      (not (workshop_attended)))
    :effect (and
      (workshop_attended))
  )

  (:action certify_workshop_day_8
    :parameters ()
    :precondition (and
      (spent_day_in day_8 riga)
      (not (workshop_attended)))
    :effect (and
      (workshop_attended))
  )
)