(define (domain tripplanningexample29)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (direct ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)

    (current_day ?d - day)
    (at ?c - city)

    (visited ?c - city ?d - day)

    (need_frankfurt_1)
    (need_frankfurt_2)
    (need_frankfurt_3)

    (need_dubrovnik_1)
    (need_dubrovnik_2)
    (need_dubrovnik_3)
    (need_dubrovnik_4)
    (need_dubrovnik_5)
    (need_dubrovnik_6)
    (need_dubrovnik_7)

    (need_krakow_1)
    (need_krakow_2)

    (trip_started)
  )

  (:action start_in_frankfurt
    :parameters ()
    :precondition (and
      (not (trip_started))
      (current_day day1)
      (need_frankfurt_1)
      (not (at frankfurt))
      (not (at krakow))
      (not (at dubrovnik))
    )
    :effect (and
      (trip_started)
      (at frankfurt)
      (visited frankfurt day1)
      (not (need_frankfurt_1))
      (need_frankfurt_2)
    )
  )

  (:action start_in_dubrovnik
    :parameters ()
    :precondition (and
      (not (trip_started))
      (current_day day1)
      (need_dubrovnik_1)
      (not (at frankfurt))
      (not (at krakow))
      (not (at dubrovnik))
    )
    :effect (and
      (trip_started)
      (at dubrovnik)
      (visited dubrovnik day1)
      (not (need_dubrovnik_1))
      (need_dubrovnik_2)
    )
  )

  (:action start_in_krakow
    :parameters ()
    :precondition (and
      (not (trip_started))
      (current_day day1)
      (need_krakow_1)
      (not (at frankfurt))
      (not (at krakow))
      (not (at dubrovnik))
    )
    :effect (and
      (trip_started)
      (at krakow)
      (visited krakow day1)
      (not (need_krakow_1))
      (need_krakow_2)
    )
  )

  (:action stay_in_frankfurt_step_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (trip_started)
      (current_day ?d1)
      (next ?d1 ?d2)
      (at frankfurt)
      (need_frankfurt_2)
      (not (visited frankfurt ?d2))
    )
    :effect (and
      (visited frankfurt ?d2)
      (not (need_frankfurt_2))
      (need_frankfurt_3)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action stay_in_frankfurt_step_3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (trip_started)
      (current_day ?d1)
      (next ?d1 ?d2)
      (at frankfurt)
      (need_frankfurt_3)
      (not (visited frankfurt ?d2))
    )
    :effect (and
      (visited frankfurt ?d2)
      (not (need_frankfurt_3))
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action stay_in_dubrovnik_step_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (trip_started)
      (current_day ?d1)
      (next ?d1 ?d2)
      (at dubrovnik)
      (need_dubrovnik_2)
      (not (visited dubrovnik ?d2))
    )
    :effect (and
      (visited dubrovnik ?d2)
      (not (need_dubrovnik_2))
      (need_dubrovnik_3)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action stay_in_dubrovnik_step_3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (trip_started)
      (current_day ?d1)
      (next ?d1 ?d2)
      (at dubrovnik)
      (need_dubrovnik_3)
      (not (visited dubrovnik ?d2))
    )
    :effect (and
      (visited dubrovnik ?d2)
      (not (need_dubrovnik_3))
      (need_dubrovnik_4)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action stay_in_dubrovnik_step_4
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (trip_started)
      (current_day ?d1)
      (next ?d1 ?d2)
      (at dubrovnik)
      (need_dubrovnik_4)
      (not (visited dubrovnik ?d2))
    )
    :effect (and
      (visited dubrovnik ?d2)
      (not (need_dubrovnik_4))
      (need_dubrovnik_5)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action stay_in_dubrovnik_step_5
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (trip_started)
      (current_day ?d1)
      (next ?d1 ?d2)
      (at dubrovnik)
      (need_dubrovnik_5)
      (not (visited dubrovnik ?d2))
    )
    :effect (and
      (visited dubrovnik ?d2)
      (not (need_dubrovnik_5))
      (need_dubrovnik_6)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action stay_in_dubrovnik_step_6
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (trip_started)
      (current_day ?d1)
      (next ?d1 ?d2)
      (at dubrovnik)
      (need_dubrovnik_6)
      (not (visited dubrovnik ?d2))
    )
    :effect (and
      (visited dubrovnik ?d2)
      (not (need_dubrovnik_6))
      (need_dubrovnik_7)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action stay_in_dubrovnik_step_7
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (trip_started)
      (current_day ?d1)
      (next ?d1 ?d2)
      (at dubrovnik)
      (need_dubrovnik_7)
      (not (visited dubrovnik ?d2))
    )
    :effect (and
      (visited dubrovnik ?d2)
      (not (need_dubrovnik_7))
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action stay_in_krakow_step_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (trip_started)
      (current_day ?d1)
      (next ?d1 ?d2)
      (at krakow)
      (need_krakow_2)
      (not (visited krakow ?d2))
    )
    :effect (and
      (visited krakow ?d2)
      (not (need_krakow_2))
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action fly_frankfurt_to_krakow_first_day
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (trip_started)
      (current_day ?d1)
      (next ?d1 ?d2)
      (at frankfurt)
      (direct frankfurt krakow)
      (need_krakow_1)
      (not (visited krakow ?d2))
    )
    :effect (and
      (not (at frankfurt))
      (at krakow)
      (visited krakow ?d2)
      (not (need_krakow_1))
      (need_krakow_2)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action fly_frankfurt_to_dubrovnik_first_day
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (trip_started)
      (current_day ?d1)
      (next ?d1 ?d2)
      (at frankfurt)
      (direct frankfurt dubrovnik)
      (need_dubrovnik_1)
      (not (visited dubrovnik ?d2))
    )
    :effect (and
      (not (at frankfurt))
      (at dubrovnik)
      (visited dubrovnik ?d2)
      (not (need_dubrovnik_1))
      (need_dubrovnik_2)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action fly_krakow_to_frankfurt_first_day
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (trip_started)
      (current_day ?d1)
      (next ?d1 ?d2)
      (at krakow)
      (direct krakow frankfurt)
      (need_frankfurt_1)
      (not (visited frankfurt ?d2))
    )
    :effect (and
      (not (at krakow))
      (at frankfurt)
      (visited frankfurt ?d2)
      (not (need_frankfurt_1))
      (need_frankfurt_2)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action fly_dubrovnik_to_frankfurt_first_day
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (trip_started)
      (current_day ?d1)
      (next ?d1 ?d2)
      (at dubrovnik)
      (direct dubrovnik frankfurt)
      (need_frankfurt_1)
      (not (visited frankfurt ?d2))
    )
    :effect (and
      (not (at dubrovnik))
      (at frankfurt)
      (visited frankfurt ?d2)
      (not (need_frankfurt_1))
      (need_frankfurt_2)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action fly_frankfurt_to_krakow_after_frankfurt_done
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (trip_started)
      (current_day ?d1)
      (next ?d1 ?d2)
      (at frankfurt)
      (direct frankfurt krakow)
      (not (need_frankfurt_1))
      (not (need_frankfurt_2))
      (not (need_frankfurt_3))
      (need_krakow_1)
      (not (visited krakow ?d2))
    )
    :effect (and
      (not (at frankfurt))
      (at krakow)
      (visited krakow ?d2)
      (not (need_krakow_1))
      (need_krakow_2)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action fly_frankfurt_to_dubrovnik_after_frankfurt_done
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (trip_started)
      (current_day ?d1)
      (next ?d1 ?d2)
      (at frankfurt)
      (direct frankfurt dubrovnik)
      (not (need_frankfurt_1))
      (not (need_frankfurt_2))
      (not (need_frankfurt_3))
      (need_dubrovnik_1)
      (not (visited dubrovnik ?d2))
    )
    :effect (and
      (not (at frankfurt))
      (at dubrovnik)
      (visited dubrovnik ?d2)
      (not (need_dubrovnik_1))
      (need_dubrovnik_2)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action fly_krakow_to_frankfurt_after_krakow_done
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (trip_started)
      (current_day ?d1)
      (next ?d1 ?d2)
      (at krakow)
      (direct krakow frankfurt)
      (not (need_krakow_1))
      (not (need_krakow_2))
      (need_frankfurt_1)
      (not (visited frankfurt ?d2))
    )
    :effect (and
      (not (at krakow))
      (at frankfurt)
      (visited frankfurt ?d2)
      (not (need_frankfurt_1))
      (need_frankfurt_2)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action fly_dubrovnik_to_frankfurt_after_dubrovnik_done
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (trip_started)
      (current_day ?d1)
      (next ?d1 ?d2)
      (at dubrovnik)
      (direct dubrovnik frankfurt)
      (not (need_dubrovnik_1))
      (not (need_dubrovnik_2))
      (not (need_dubrovnik_3))
      (not (need_dubrovnik_4))
      (not (need_dubrovnik_5))
      (not (need_dubrovnik_6))
      (not (need_dubrovnik_7))
      (need_frankfurt_1)
      (not (visited frankfurt ?d2))
    )
    :effect (and
      (not (at dubrovnik))
      (at frankfurt)
      (visited frankfurt ?d2)
      (not (need_frankfurt_1))
      (need_frankfurt_2)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action fly_frankfurt_to_krakow_after_dubrovnik_and_frankfurt_done
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (trip_started)
      (current_day ?d1)
      (next ?d1 ?d2)
      (at frankfurt)
      (direct frankfurt krakow)
      (not (need_frankfurt_1))
      (not (need_frankfurt_2))
      (not (need_frankfurt_3))
      (not (need_dubrovnik_1))
      (not (need_dubrovnik_2))
      (not (need_dubrovnik_3))
      (not (need_dubrovnik_4))
      (not (need_dubrovnik_5))
      (not (need_dubrovnik_6))
      (not (need_dubrovnik_7))
      (need_krakow_1)
      (not (visited krakow ?d2))
    )
    :effect (and
      (not (at frankfurt))
      (at krakow)
      (visited krakow ?d2)
      (not (need_krakow_1))
      (need_krakow_2)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )
)