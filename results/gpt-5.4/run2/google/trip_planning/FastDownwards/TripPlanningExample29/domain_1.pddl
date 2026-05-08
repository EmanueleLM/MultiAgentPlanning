(define (domain european_trip_10_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (direct_flight ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)

    (current_day ?d - day)
    (at ?c - city)

    (visited ?c - city ?d - day)

    (count_krakow_1)
    (count_krakow_2)

    (count_frankfurt_1)
    (count_frankfurt_2)
    (count_frankfurt_3)

    (count_dubrovnik_1)
    (count_dubrovnik_2)
    (count_dubrovnik_3)
    (count_dubrovnik_4)
    (count_dubrovnik_5)
    (count_dubrovnik_6)
    (count_dubrovnik_7)
  )

  (:action start_in_krakow
    :parameters ()
    :precondition (and
      (current_day day_1)
      (not (at krakow))
      (not (at frankfurt))
      (not (at dubrovnik))
      (not (visited krakow day_1))
      (not (count_krakow_1))
    )
    :effect (and
      (at krakow)
      (visited krakow day_1)
      (count_krakow_1))
  )

  (:action start_in_frankfurt
    :parameters ()
    :precondition (and
      (current_day day_1)
      (not (at krakow))
      (not (at frankfurt))
      (not (at dubrovnik))
      (not (visited frankfurt day_1))
      (not (count_frankfurt_1))
    )
    :effect (and
      (at frankfurt)
      (visited frankfurt day_1)
      (count_frankfurt_1))
  )

  (:action start_in_dubrovnik
    :parameters ()
    :precondition (and
      (current_day day_1)
      (not (at krakow))
      (not (at frankfurt))
      (not (at dubrovnik))
      (not (visited dubrovnik day_1))
      (not (count_dubrovnik_1))
    )
    :effect (and
      (at dubrovnik)
      (visited dubrovnik day_1)
      (count_dubrovnik_1))
  )

  (:action stay_krakow_advance
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at krakow)
      (not (visited krakow ?d2))
      (count_krakow_1)
      (not (count_krakow_2))
    )
    :effect (and
      (visited krakow ?d2)
      (count_krakow_2)
      (not (current_day ?d1))
      (current_day ?d2))
  )

  (:action stay_frankfurt_advance_1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at frankfurt)
      (not (visited frankfurt ?d2))
      (count_frankfurt_1)
      (not (count_frankfurt_2))
    )
    :effect (and
      (visited frankfurt ?d2)
      (count_frankfurt_2)
      (not (current_day ?d1))
      (current_day ?d2))
  )

  (:action stay_frankfurt_advance_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at frankfurt)
      (not (visited frankfurt ?d2))
      (count_frankfurt_2)
      (not (count_frankfurt_3))
    )
    :effect (and
      (visited frankfurt ?d2)
      (count_frankfurt_3)
      (not (current_day ?d1))
      (current_day ?d2))
  )

  (:action stay_dubrovnik_advance_1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at dubrovnik)
      (not (visited dubrovnik ?d2))
      (count_dubrovnik_1)
      (not (count_dubrovnik_2))
    )
    :effect (and
      (visited dubrovnik ?d2)
      (count_dubrovnik_2)
      (not (current_day ?d1))
      (current_day ?d2))
  )

  (:action stay_dubrovnik_advance_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at dubrovnik)
      (not (visited dubrovnik ?d2))
      (count_dubrovnik_2)
      (not (count_dubrovnik_3))
    )
    :effect (and
      (visited dubrovnik ?d2)
      (count_dubrovnik_3)
      (not (current_day ?d1))
      (current_day ?d2))
  )

  (:action stay_dubrovnik_advance_3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at dubrovnik)
      (not (visited dubrovnik ?d2))
      (count_dubrovnik_3)
      (not (count_dubrovnik_4))
    )
    :effect (and
      (visited dubrovnik ?d2)
      (count_dubrovnik_4)
      (not (current_day ?d1))
      (current_day ?d2))
  )

  (:action stay_dubrovnik_advance_4
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at dubrovnik)
      (not (visited dubrovnik ?d2))
      (count_dubrovnik_4)
      (not (count_dubrovnik_5))
    )
    :effect (and
      (visited dubrovnik ?d2)
      (count_dubrovnik_5)
      (not (current_day ?d1))
      (current_day ?d2))
  )

  (:action stay_dubrovnik_advance_5
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at dubrovnik)
      (not (visited dubrovnik ?d2))
      (count_dubrovnik_5)
      (not (count_dubrovnik_6))
    )
    :effect (and
      (visited dubrovnik ?d2)
      (count_dubrovnik_6)
      (not (current_day ?d1))
      (current_day ?d2))
  )

  (:action stay_dubrovnik_advance_6
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at dubrovnik)
      (not (visited dubrovnik ?d2))
      (count_dubrovnik_6)
      (not (count_dubrovnik_7))
    )
    :effect (and
      (visited dubrovnik ?d2)
      (count_dubrovnik_7)
      (not (current_day ?d1))
      (current_day ?d2))
  )

  (:action fly_krakow_to_frankfurt
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at krakow)
      (direct_flight krakow frankfurt)
      (not (visited frankfurt ?d2))
      (not (count_frankfurt_1))
    )
    :effect (and
      (not (at krakow))
      (at frankfurt)
      (visited frankfurt ?d2)
      (count_frankfurt_1)
      (not (current_day ?d1))
      (current_day ?d2))
  )

  (:action fly_frankfurt_to_krakow
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at frankfurt)
      (direct_flight frankfurt krakow)
      (not (visited krakow ?d2))
      (count_krakow_1)
      (not (count_krakow_2))
    )
    :effect (and
      (not (at frankfurt))
      (at krakow)
      (visited krakow ?d2)
      (count_krakow_2)
      (not (current_day ?d1))
      (current_day ?d2))
  )

  (:action fly_frankfurt_to_dubrovnik
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at frankfurt)
      (direct_flight frankfurt dubrovnik)
      (not (visited dubrovnik ?d2))
      (not (count_dubrovnik_1))
    )
    :effect (and
      (not (at frankfurt))
      (at dubrovnik)
      (visited dubrovnik ?d2)
      (count_dubrovnik_1)
      (not (current_day ?d1))
      (current_day ?d2))
  )

  (:action fly_dubrovnik_to_frankfurt
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at dubrovnik)
      (direct_flight dubrovnik frankfurt)
      (not (visited frankfurt ?d2))
      (count_frankfurt_1)
      (not (count_frankfurt_2))
    )
    :effect (and
      (not (at dubrovnik))
      (at frankfurt)
      (visited frankfurt ?d2)
      (count_frankfurt_2)
      (not (current_day ?d1))
      (current_day ?d2))
  )
)