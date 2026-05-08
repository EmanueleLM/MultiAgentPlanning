(define (domain european_trip_8_days_instance)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (at ?c - city)
    (direct_flight ?from - city ?to - city)
    (current_day ?d - day)
    (next ?d1 - day ?d2 - day)
    (day_in_city ?d - day ?c - city)
    (workshop_window ?d - day)

    (london_0) (london_1) (london_2) (london_3)
    (bucharest_0) (bucharest_1) (bucharest_2) (bucharest_3)
    (riga_0) (riga_1) (riga_2) (riga_3) (riga_4)
  )

  (:action stay_london_0_1
    :parameters (?d - day ?dn - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?dn)
      (at london)
      (london_0))
    :effect (and
      (not (current_day ?d))
      (current_day ?dn)
      (day_in_city ?d london)
      (not (london_0))
      (london_1))
  )

  (:action stay_london_1_2
    :parameters (?d - day ?dn - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?dn)
      (at london)
      (london_1))
    :effect (and
      (not (current_day ?d))
      (current_day ?dn)
      (day_in_city ?d london)
      (not (london_1))
      (london_2))
  )

  (:action stay_london_2_3
    :parameters (?d - day ?dn - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?dn)
      (at london)
      (london_2))
    :effect (and
      (not (current_day ?d))
      (current_day ?dn)
      (day_in_city ?d london)
      (not (london_2))
      (london_3))
  )

  (:action stay_bucharest_0_1
    :parameters (?d - day ?dn - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?dn)
      (at bucharest)
      (bucharest_0))
    :effect (and
      (not (current_day ?d))
      (current_day ?dn)
      (day_in_city ?d bucharest)
      (not (bucharest_0))
      (bucharest_1))
  )

  (:action stay_bucharest_1_2
    :parameters (?d - day ?dn - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?dn)
      (at bucharest)
      (bucharest_1))
    :effect (and
      (not (current_day ?d))
      (current_day ?dn)
      (day_in_city ?d bucharest)
      (not (bucharest_1))
      (bucharest_2))
  )

  (:action stay_bucharest_2_3
    :parameters (?d - day ?dn - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?dn)
      (at bucharest)
      (bucharest_2))
    :effect (and
      (not (current_day ?d))
      (current_day ?dn)
      (day_in_city ?d bucharest)
      (not (bucharest_2))
      (bucharest_3))
  )

  (:action stay_riga_0_1
    :parameters (?d - day ?dn - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?dn)
      (at riga)
      (riga_0))
    :effect (and
      (not (current_day ?d))
      (current_day ?dn)
      (day_in_city ?d riga)
      (not (riga_0))
      (riga_1))
  )

  (:action stay_riga_1_2
    :parameters (?d - day ?dn - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?dn)
      (at riga)
      (riga_1))
    :effect (and
      (not (current_day ?d))
      (current_day ?dn)
      (day_in_city ?d riga)
      (not (riga_1))
      (riga_2))
  )

  (:action stay_riga_2_3
    :parameters (?d - day ?dn - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?dn)
      (at riga)
      (riga_2))
    :effect (and
      (not (current_day ?d))
      (current_day ?dn)
      (day_in_city ?d riga)
      (not (riga_2))
      (riga_3))
  )

  (:action stay_riga_3_4
    :parameters (?d - day ?dn - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?dn)
      (at riga)
      (riga_3))
    :effect (and
      (not (current_day ?d))
      (current_day ?dn)
      (day_in_city ?d riga)
      (not (riga_3))
      (riga_4))
  )

  (:action fly_london_bucharest_0_1
    :parameters (?d - day ?dn - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?dn)
      (at london)
      (direct_flight london bucharest)
      (bucharest_0))
    :effect (and
      (not (current_day ?d))
      (current_day ?dn)
      (not (at london))
      (at bucharest)
      (day_in_city ?d bucharest)
      (not (bucharest_0))
      (bucharest_1))
  )

  (:action fly_london_bucharest_1_2
    :parameters (?d - day ?dn - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?dn)
      (at london)
      (direct_flight london bucharest)
      (bucharest_1))
    :effect (and
      (not (current_day ?d))
      (current_day ?dn)
      (not (at london))
      (at bucharest)
      (day_in_city ?d bucharest)
      (not (bucharest_1))
      (bucharest_2))
  )

  (:action fly_london_bucharest_2_3
    :parameters (?d - day ?dn - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?dn)
      (at london)
      (direct_flight london bucharest)
      (bucharest_2))
    :effect (and
      (not (current_day ?d))
      (current_day ?dn)
      (not (at london))
      (at bucharest)
      (day_in_city ?d bucharest)
      (not (bucharest_2))
      (bucharest_3))
  )

  (:action fly_bucharest_london_0_1
    :parameters (?d - day ?dn - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?dn)
      (at bucharest)
      (direct_flight bucharest london)
      (london_0))
    :effect (and
      (not (current_day ?d))
      (current_day ?dn)
      (not (at bucharest))
      (at london)
      (day_in_city ?d london)
      (not (london_0))
      (london_1))
  )

  (:action fly_bucharest_london_1_2
    :parameters (?d - day ?dn - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?dn)
      (at bucharest)
      (direct_flight bucharest london)
      (london_1))
    :effect (and
      (not (current_day ?d))
      (current_day ?dn)
      (not (at bucharest))
      (at london)
      (day_in_city ?d london)
      (not (london_1))
      (london_2))
  )

  (:action fly_bucharest_london_2_3
    :parameters (?d - day ?dn - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?dn)
      (at bucharest)
      (direct_flight bucharest london)
      (london_2))
    :effect (and
      (not (current_day ?d))
      (current_day ?dn)
      (not (at bucharest))
      (at london)
      (day_in_city ?d london)
      (not (london_2))
      (london_3))
  )

  (:action fly_bucharest_riga_0_1
    :parameters (?d - day ?dn - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?dn)
      (at bucharest)
      (direct_flight bucharest riga)
      (riga_0))
    :effect (and
      (not (current_day ?d))
      (current_day ?dn)
      (not (at bucharest))
      (at riga)
      (day_in_city ?d riga)
      (not (riga_0))
      (riga_1))
  )

  (:action fly_bucharest_riga_1_2
    :parameters (?d - day ?dn - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?dn)
      (at bucharest)
      (direct_flight bucharest riga)
      (riga_1))
    :effect (and
      (not (current_day ?d))
      (current_day ?dn)
      (not (at bucharest))
      (at riga)
      (day_in_city ?d riga)
      (not (riga_1))
      (riga_2))
  )

  (:action fly_bucharest_riga_2_3
    :parameters (?d - day ?dn - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?dn)
      (at bucharest)
      (direct_flight bucharest riga)
      (riga_2))
    :effect (and
      (not (current_day ?d))
      (current_day ?dn)
      (not (at bucharest))
      (at riga)
      (day_in_city ?d riga)
      (not (riga_2))
      (riga_3))
  )

  (:action fly_bucharest_riga_3_4
    :parameters (?d - day ?dn - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?dn)
      (at bucharest)
      (direct_flight bucharest riga)
      (riga_3))
    :effect (and
      (not (current_day ?d))
      (current_day ?dn)
      (not (at bucharest))
      (at riga)
      (day_in_city ?d riga)
      (not (riga_3))
      (riga_4))
  )

  (:action fly_riga_bucharest_0_1
    :parameters (?d - day ?dn - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?dn)
      (at riga)
      (direct_flight riga bucharest)
      (bucharest_0))
    :effect (and
      (not (current_day ?d))
      (current_day ?dn)
      (not (at riga))
      (at bucharest)
      (day_in_city ?d bucharest)
      (not (bucharest_0))
      (bucharest_1))
  )

  (:action fly_riga_bucharest_1_2
    :parameters (?d - day ?dn - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?dn)
      (at riga)
      (direct_flight riga bucharest)
      (bucharest_1))
    :effect (and
      (not (current_day ?d))
      (current_day ?dn)
      (not (at riga))
      (at bucharest)
      (day_in_city ?d bucharest)
      (not (bucharest_1))
      (bucharest_2))
  )

  (:action fly_riga_bucharest_2_3
    :parameters (?d - day ?dn - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?dn)
      (at riga)
      (direct_flight riga bucharest)
      (bucharest_2))
    :effect (and
      (not (current_day ?d))
      (current_day ?dn)
      (not (at riga))
      (at bucharest)
      (day_in_city ?d bucharest)
      (not (bucharest_2))
      (bucharest_3))
  )
)