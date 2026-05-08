(define (domain europe_trip_16_days_instance)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (direct ?from - city ?to - city)
    (next_day ?d1 - day ?d2 - day)

    (current_day ?d - day)
    (at ?c - city)
    (counted ?d - day)
    (spent_in ?c - city ?d - day)

    (start_unset)
    (krakow_count_0)
    (krakow_count_1)
    (krakow_count_2)
    (krakow_count_3)
    (krakow_count_4)
    (krakow_count_5)
    (krakow_count_6)

    (zurich_count_0)
    (zurich_count_1)
    (zurich_count_2)
    (zurich_count_3)
    (zurich_count_4)
    (zurich_count_5)
  )

  (:action choose_start_city
    :parameters (?c - city)
    :precondition (and
      (start_unset)
      (current_day day_1)
      (not (at athens))
      (not (at zurich))
      (not (at krakow))
      (not (counted day_1))
    )
    :effect (and
      (not (start_unset))
      (at ?c)
    )
  )

  (:action count_day_in_athens
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (at athens)
      (not (counted ?d))
    )
    :effect (and
      (counted ?d)
      (spent_in athens ?d)
    )
  )

  (:action count_day_in_krakow_0_1
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (at krakow)
      (not (counted ?d))
      (krakow_count_0)
    )
    :effect (and
      (counted ?d)
      (spent_in krakow ?d)
      (not (krakow_count_0))
      (krakow_count_1)
    )
  )

  (:action count_day_in_krakow_1_2
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (at krakow)
      (not (counted ?d))
      (krakow_count_1)
    )
    :effect (and
      (counted ?d)
      (spent_in krakow ?d)
      (not (krakow_count_1))
      (krakow_count_2)
    )
  )

  (:action count_day_in_krakow_2_3
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (at krakow)
      (not (counted ?d))
      (krakow_count_2)
    )
    :effect (and
      (counted ?d)
      (spent_in krakow ?d)
      (not (krakow_count_2))
      (krakow_count_3)
    )
  )

  (:action count_day_in_krakow_3_4
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (at krakow)
      (not (counted ?d))
      (krakow_count_3)
    )
    :effect (and
      (counted ?d)
      (spent_in krakow ?d)
      (not (krakow_count_3))
      (krakow_count_4)
    )
  )

  (:action count_day_in_krakow_4_5
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (at krakow)
      (not (counted ?d))
      (krakow_count_4)
    )
    :effect (and
      (counted ?d)
      (spent_in krakow ?d)
      (not (krakow_count_4))
      (krakow_count_5)
    )
  )

  (:action count_day_in_krakow_5_6
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (at krakow)
      (not (counted ?d))
      (krakow_count_5)
    )
    :effect (and
      (counted ?d)
      (spent_in krakow ?d)
      (not (krakow_count_5))
      (krakow_count_6)
    )
  )

  (:action count_day_in_zurich_0_1
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (at zurich)
      (not (counted ?d))
      (zurich_count_0)
    )
    :effect (and
      (counted ?d)
      (spent_in zurich ?d)
      (not (zurich_count_0))
      (zurich_count_1)
    )
  )

  (:action count_day_in_zurich_1_2
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (at zurich)
      (not (counted ?d))
      (zurich_count_1)
    )
    :effect (and
      (counted ?d)
      (spent_in zurich ?d)
      (not (zurich_count_1))
      (zurich_count_2)
    )
  )

  (:action count_day_in_zurich_2_3
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (at zurich)
      (not (counted ?d))
      (zurich_count_2)
    )
    :effect (and
      (counted ?d)
      (spent_in zurich ?d)
      (not (zurich_count_2))
      (zurich_count_3)
    )
  )

  (:action count_day_in_zurich_3_4
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (at zurich)
      (not (counted ?d))
      (zurich_count_3)
    )
    :effect (and
      (counted ?d)
      (spent_in zurich ?d)
      (not (zurich_count_3))
      (zurich_count_4)
    )
  )

  (:action count_day_in_zurich_4_5
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (at zurich)
      (not (counted ?d))
      (zurich_count_4)
    )
    :effect (and
      (counted ?d)
      (spent_in zurich ?d)
      (not (zurich_count_4))
      (zurich_count_5)
    )
  )

  (:action stay_to_next_day_in_athens
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at athens)
      (counted ?d1)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action stay_to_next_day_in_zurich
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at zurich)
      (counted ?d1)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action stay_to_next_day_in_krakow
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at krakow)
      (counted ?d1)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action fly_athens_to_zurich
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at athens)
      (direct athens zurich)
      (counted ?d1)
    )
    :effect (and
      (not (at athens))
      (at zurich)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action fly_zurich_to_athens
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at zurich)
      (direct zurich athens)
      (counted ?d1)
    )
    :effect (and
      (not (at zurich))
      (at athens)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action fly_zurich_to_krakow
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at zurich)
      (direct zurich krakow)
      (counted ?d1)
    )
    :effect (and
      (not (at zurich))
      (at krakow)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action fly_krakow_to_zurich
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at krakow)
      (direct krakow zurich)
      (counted ?d1)
    )
    :effect (and
      (not (at krakow))
      (at zurich)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )
)