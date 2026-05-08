(define (domain european_trip_10_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types city day)

  (:predicates
    (direct ?from - city ?to - city)
    (next_day ?d1 - day ?d2 - day)
    (current_day ?d - day)
    (at ?c - city ?d - day)
    (assigned ?d - day)

    (lyon_count_0)
    (lyon_count_1)
    (lyon_count_2)
    (lyon_count_3)
    (lyon_count_4)
    (lyon_count_5)
    (lyon_count_6)
    (lyon_count_7)

    (frankfurt_count_0)
    (frankfurt_count_1)
    (frankfurt_count_2)

    (krakow_count_0)
    (krakow_count_1)
    (krakow_count_2)
    (krakow_count_3)
  )

  (:action choose_start_lyon
    :parameters ()
    :precondition (and
      (current_day day_1)
      (not (assigned day_1))
      (lyon_count_0)
    )
    :effect (and
      (at lyon day_1)
      (assigned day_1)
      (not (lyon_count_0))
      (lyon_count_1)
    )
  )

  (:action choose_start_frankfurt
    :parameters ()
    :precondition (and
      (current_day day_1)
      (not (assigned day_1))
      (frankfurt_count_0)
    )
    :effect (and
      (at frankfurt day_1)
      (assigned day_1)
      (not (frankfurt_count_0))
      (frankfurt_count_1)
    )
  )

  (:action choose_start_krakow
    :parameters ()
    :precondition (and
      (current_day day_1)
      (not (assigned day_1))
      (krakow_count_0)
    )
    :effect (and
      (at krakow day_1)
      (assigned day_1)
      (not (krakow_count_0))
      (krakow_count_1)
    )
  )

  (:action stay_lyon_0_1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (not (assigned ?d2))
      (at lyon ?d1)
      (lyon_count_0)
    )
    :effect (and
      (at lyon ?d2)
      (assigned ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (lyon_count_0))
      (lyon_count_1)
    )
  )

  (:action stay_lyon_1_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (not (assigned ?d2))
      (at lyon ?d1)
      (lyon_count_1)
    )
    :effect (and
      (at lyon ?d2)
      (assigned ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (lyon_count_1))
      (lyon_count_2)
    )
  )

  (:action stay_lyon_2_3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (not (assigned ?d2))
      (at lyon ?d1)
      (lyon_count_2)
    )
    :effect (and
      (at lyon ?d2)
      (assigned ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (lyon_count_2))
      (lyon_count_3)
    )
  )

  (:action stay_lyon_3_4
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (not (assigned ?d2))
      (at lyon ?d1)
      (lyon_count_3)
    )
    :effect (and
      (at lyon ?d2)
      (assigned ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (lyon_count_3))
      (lyon_count_4)
    )
  )

  (:action stay_lyon_4_5
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (not (assigned ?d2))
      (at lyon ?d1)
      (lyon_count_4)
    )
    :effect (and
      (at lyon ?d2)
      (assigned ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (lyon_count_4))
      (lyon_count_5)
    )
  )

  (:action stay_lyon_5_6
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (not (assigned ?d2))
      (at lyon ?d1)
      (lyon_count_5)
    )
    :effect (and
      (at lyon ?d2)
      (assigned ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (lyon_count_5))
      (lyon_count_6)
    )
  )

  (:action stay_lyon_6_7
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (not (assigned ?d2))
      (at lyon ?d1)
      (lyon_count_6)
    )
    :effect (and
      (at lyon ?d2)
      (assigned ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (lyon_count_6))
      (lyon_count_7)
    )
  )

  (:action stay_frankfurt_0_1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (not (assigned ?d2))
      (at frankfurt ?d1)
      (frankfurt_count_0)
    )
    :effect (and
      (at frankfurt ?d2)
      (assigned ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (frankfurt_count_0))
      (frankfurt_count_1)
    )
  )

  (:action stay_frankfurt_1_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (not (assigned ?d2))
      (at frankfurt ?d1)
      (frankfurt_count_1)
    )
    :effect (and
      (at frankfurt ?d2)
      (assigned ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (frankfurt_count_1))
      (frankfurt_count_2)
    )
  )

  (:action stay_krakow_0_1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (not (assigned ?d2))
      (at krakow ?d1)
      (krakow_count_0)
    )
    :effect (and
      (at krakow ?d2)
      (assigned ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (krakow_count_0))
      (krakow_count_1)
    )
  )

  (:action stay_krakow_1_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (not (assigned ?d2))
      (at krakow ?d1)
      (krakow_count_1)
    )
    :effect (and
      (at krakow ?d2)
      (assigned ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (krakow_count_1))
      (krakow_count_2)
    )
  )

  (:action stay_krakow_2_3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (not (assigned ?d2))
      (at krakow ?d1)
      (krakow_count_2)
    )
    :effect (and
      (at krakow ?d2)
      (assigned ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (krakow_count_2))
      (krakow_count_3)
    )
  )

  (:action fly_lyon_to_frankfurt_0_1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (not (assigned ?d2))
      (at lyon ?d1)
      (direct lyon frankfurt)
      (frankfurt_count_0)
    )
    :effect (and
      (at frankfurt ?d2)
      (assigned ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (frankfurt_count_0))
      (frankfurt_count_1)
    )
  )

  (:action fly_lyon_to_frankfurt_1_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (not (assigned ?d2))
      (at lyon ?d1)
      (direct lyon frankfurt)
      (frankfurt_count_1)
    )
    :effect (and
      (at frankfurt ?d2)
      (assigned ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (frankfurt_count_1))
      (frankfurt_count_2)
    )
  )

  (:action fly_frankfurt_to_lyon_0_1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (not (assigned ?d2))
      (at frankfurt ?d1)
      (direct frankfurt lyon)
      (lyon_count_0)
    )
    :effect (and
      (at lyon ?d2)
      (assigned ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (lyon_count_0))
      (lyon_count_1)
    )
  )

  (:action fly_frankfurt_to_lyon_1_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (not (assigned ?d2))
      (at frankfurt ?d1)
      (direct frankfurt lyon)
      (lyon_count_1)
    )
    :effect (and
      (at lyon ?d2)
      (assigned ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (lyon_count_1))
      (lyon_count_2)
    )
  )

  (:action fly_frankfurt_to_lyon_2_3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (not (assigned ?d2))
      (at frankfurt ?d1)
      (direct frankfurt lyon)
      (lyon_count_2)
    )
    :effect (and
      (at lyon ?d2)
      (assigned ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (lyon_count_2))
      (lyon_count_3)
    )
  )

  (:action fly_frankfurt_to_lyon_3_4
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (not (assigned ?d2))
      (at frankfurt ?d1)
      (direct frankfurt lyon)
      (lyon_count_3)
    )
    :effect (and
      (at lyon ?d2)
      (assigned ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (lyon_count_3))
      (lyon_count_4)
    )
  )

  (:action fly_frankfurt_to_lyon_4_5
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (not (assigned ?d2))
      (at frankfurt ?d1)
      (direct frankfurt lyon)
      (lyon_count_4)
    )
    :effect (and
      (at lyon ?d2)
      (assigned ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (lyon_count_4))
      (lyon_count_5)
    )
  )

  (:action fly_frankfurt_to_lyon_5_6
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (not (assigned ?d2))
      (at frankfurt ?d1)
      (direct frankfurt lyon)
      (lyon_count_5)
    )
    :effect (and
      (at lyon ?d2)
      (assigned ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (lyon_count_5))
      (lyon_count_6)
    )
  )

  (:action fly_frankfurt_to_lyon_6_7
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (not (assigned ?d2))
      (at frankfurt ?d1)
      (direct frankfurt lyon)
      (lyon_count_6)
    )
    :effect (and
      (at lyon ?d2)
      (assigned ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (lyon_count_6))
      (lyon_count_7)
    )
  )

  (:action fly_frankfurt_to_krakow_0_1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (not (assigned ?d2))
      (at frankfurt ?d1)
      (direct frankfurt krakow)
      (krakow_count_0)
    )
    :effect (and
      (at krakow ?d2)
      (assigned ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (krakow_count_0))
      (krakow_count_1)
    )
  )

  (:action fly_frankfurt_to_krakow_1_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (not (assigned ?d2))
      (at frankfurt ?d1)
      (direct frankfurt krakow)
      (krakow_count_1)
    )
    :effect (and
      (at krakow ?d2)
      (assigned ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (krakow_count_1))
      (krakow_count_2)
    )
  )

  (:action fly_frankfurt_to_krakow_2_3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (not (assigned ?d2))
      (at frankfurt ?d1)
      (direct frankfurt krakow)
      (krakow_count_2)
    )
    :effect (and
      (at krakow ?d2)
      (assigned ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (krakow_count_2))
      (krakow_count_3)
    )
  )

  (:action fly_krakow_to_frankfurt_0_1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (not (assigned ?d2))
      (at krakow ?d1)
      (direct krakow frankfurt)
      (frankfurt_count_0)
    )
    :effect (and
      (at frankfurt ?d2)
      (assigned ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (frankfurt_count_0))
      (frankfurt_count_1)
    )
  )

  (:action fly_krakow_to_frankfurt_1_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (not (assigned ?d2))
      (at krakow ?d1)
      (direct krakow frankfurt)
      (frankfurt_count_1)
    )
    :effect (and
      (at frankfurt ?d2)
      (assigned ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (frankfurt_count_1))
      (frankfurt_count_2)
    )
  )
)