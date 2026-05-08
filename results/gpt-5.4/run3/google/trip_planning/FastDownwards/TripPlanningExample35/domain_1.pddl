(define (domain trip_europe_10_days_instance)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (at ?c - city ?d - day)
    (direct_flight ?from - city ?to - city)
    (trip_started)
    (relatives_visited)

    (bucharest_count_0)
    (bucharest_count_1)
    (bucharest_count_2)
    (bucharest_count_3)

    (zurich_count_0)
    (zurich_count_1)
    (zurich_count_2)

    (dubrovnik_count_0)
    (dubrovnik_count_1)
    (dubrovnik_count_2)
    (dubrovnik_count_3)
    (dubrovnik_count_4)
    (dubrovnik_count_5)
    (dubrovnik_count_6)
    (dubrovnik_count_7)
  )

  (:action start_in_bucharest
    :parameters ()
    :precondition (and
      (not (trip_started))
      (current_day day_1)
      (bucharest_count_0))
    :effect (and
      (trip_started)
      (at bucharest day_1)
      (not (bucharest_count_0))
      (bucharest_count_1))
  )

  (:action start_in_zurich
    :parameters ()
    :precondition (and
      (not (trip_started))
      (current_day day_1)
      (zurich_count_0))
    :effect (and
      (trip_started)
      (at zurich day_1)
      (not (zurich_count_0))
      (zurich_count_1))
  )

  (:action start_in_dubrovnik
    :parameters ()
    :precondition (and
      (not (trip_started))
      (current_day day_1)
      (dubrovnik_count_0))
    :effect (and
      (trip_started)
      (at dubrovnik day_1)
      (not (dubrovnik_count_0))
      (dubrovnik_count_1))
  )

  (:action stay_bucharest_1_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (trip_started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at bucharest ?d1)
      (bucharest_count_1))
    :effect (and
      (at bucharest ?d2)
      (not (bucharest_count_1))
      (bucharest_count_2)
      (not (current_day ?d1))
      (current_day ?d2))
  )

  (:action stay_bucharest_2_3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (trip_started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at bucharest ?d1)
      (bucharest_count_2))
    :effect (and
      (at bucharest ?d2)
      (not (bucharest_count_2))
      (bucharest_count_3)
      (not (current_day ?d1))
      (current_day ?d2))
  )

  (:action stay_zurich_1_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (trip_started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at zurich ?d1)
      (zurich_count_1))
    :effect (and
      (at zurich ?d2)
      (not (zurich_count_1))
      (zurich_count_2)
      (not (current_day ?d1))
      (current_day ?d2))
  )

  (:action stay_dubrovnik_1_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (trip_started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at dubrovnik ?d1)
      (dubrovnik_count_1))
    :effect (and
      (at dubrovnik ?d2)
      (not (dubrovnik_count_1))
      (dubrovnik_count_2)
      (not (current_day ?d1))
      (current_day ?d2))
  )

  (:action stay_dubrovnik_2_3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (trip_started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at dubrovnik ?d1)
      (dubrovnik_count_2))
    :effect (and
      (at dubrovnik ?d2)
      (not (dubrovnik_count_2))
      (dubrovnik_count_3)
      (not (current_day ?d1))
      (current_day ?d2))
  )

  (:action stay_dubrovnik_3_4
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (trip_started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at dubrovnik ?d1)
      (dubrovnik_count_3))
    :effect (and
      (at dubrovnik ?d2)
      (not (dubrovnik_count_3))
      (dubrovnik_count_4)
      (not (current_day ?d1))
      (current_day ?d2)
      (relatives_visited))
  )

  (:action stay_dubrovnik_4_5
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (trip_started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at dubrovnik ?d1)
      (dubrovnik_count_4))
    :effect (and
      (at dubrovnik ?d2)
      (not (dubrovnik_count_4))
      (dubrovnik_count_5)
      (not (current_day ?d1))
      (current_day ?d2)
      (relatives_visited))
  )

  (:action stay_dubrovnik_5_6
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (trip_started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at dubrovnik ?d1)
      (dubrovnik_count_5))
    :effect (and
      (at dubrovnik ?d2)
      (not (dubrovnik_count_5))
      (dubrovnik_count_6)
      (not (current_day ?d1))
      (current_day ?d2)
      (relatives_visited))
  )

  (:action stay_dubrovnik_6_7
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (trip_started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at dubrovnik ?d1)
      (dubrovnik_count_6))
    :effect (and
      (at dubrovnik ?d2)
      (not (dubrovnik_count_6))
      (dubrovnik_count_7)
      (not (current_day ?d1))
      (current_day ?d2)
      (relatives_visited))
  )

  (:action fly_bucharest_to_zurich_1_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (trip_started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at bucharest ?d1)
      (direct_flight bucharest zurich)
      (zurich_count_1))
    :effect (and
      (at zurich ?d2)
      (not (zurich_count_1))
      (zurich_count_2)
      (not (current_day ?d1))
      (current_day ?d2))
  )

  (:action fly_zurich_to_bucharest_1_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (trip_started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at zurich ?d1)
      (direct_flight zurich bucharest)
      (bucharest_count_1))
    :effect (and
      (at bucharest ?d2)
      (not (bucharest_count_1))
      (bucharest_count_2)
      (not (current_day ?d1))
      (current_day ?d2))
  )

  (:action fly_zurich_to_bucharest_2_3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (trip_started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at zurich ?d1)
      (direct_flight zurich bucharest)
      (bucharest_count_2))
    :effect (and
      (at bucharest ?d2)
      (not (bucharest_count_2))
      (bucharest_count_3)
      (not (current_day ?d1))
      (current_day ?d2))
  )

  (:action fly_zurich_to_dubrovnik_1_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (trip_started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at zurich ?d1)
      (direct_flight zurich dubrovnik)
      (dubrovnik_count_1))
    :effect (and
      (at dubrovnik ?d2)
      (not (dubrovnik_count_1))
      (dubrovnik_count_2)
      (not (current_day ?d1))
      (current_day ?d2))
  )

  (:action fly_zurich_to_dubrovnik_2_3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (trip_started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at zurich ?d1)
      (direct_flight zurich dubrovnik)
      (dubrovnik_count_2))
    :effect (and
      (at dubrovnik ?d2)
      (not (dubrovnik_count_2))
      (dubrovnik_count_3)
      (not (current_day ?d1))
      (current_day ?d2))
  )

  (:action fly_zurich_to_dubrovnik_3_4
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (trip_started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at zurich ?d1)
      (direct_flight zurich dubrovnik)
      (dubrovnik_count_3))
    :effect (and
      (at dubrovnik ?d2)
      (not (dubrovnik_count_3))
      (dubrovnik_count_4)
      (not (current_day ?d1))
      (current_day ?d2)
      (relatives_visited))
  )

  (:action fly_zurich_to_dubrovnik_4_5
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (trip_started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at zurich ?d1)
      (direct_flight zurich dubrovnik)
      (dubrovnik_count_4))
    :effect (and
      (at dubrovnik ?d2)
      (not (dubrovnik_count_4))
      (dubrovnik_count_5)
      (not (current_day ?d1))
      (current_day ?d2)
      (relatives_visited))
  )

  (:action fly_zurich_to_dubrovnik_5_6
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (trip_started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at zurich ?d1)
      (direct_flight zurich dubrovnik)
      (dubrovnik_count_5))
    :effect (and
      (at dubrovnik ?d2)
      (not (dubrovnik_count_5))
      (dubrovnik_count_6)
      (not (current_day ?d1))
      (current_day ?d2)
      (relatives_visited))
  )

  (:action fly_zurich_to_dubrovnik_6_7
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (trip_started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at zurich ?d1)
      (direct_flight zurich dubrovnik)
      (dubrovnik_count_6))
    :effect (and
      (at dubrovnik ?d2)
      (not (dubrovnik_count_6))
      (dubrovnik_count_7)
      (not (current_day ?d1))
      (current_day ?d2)
      (relatives_visited))
  )

  (:action fly_dubrovnik_to_zurich_1_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (trip_started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at dubrovnik ?d1)
      (direct_flight dubrovnik zurich)
      (zurich_count_1))
    :effect (and
      (at zurich ?d2)
      (not (zurich_count_1))
      (zurich_count_2)
      (not (current_day ?d1))
      (current_day ?d2))
  )
)