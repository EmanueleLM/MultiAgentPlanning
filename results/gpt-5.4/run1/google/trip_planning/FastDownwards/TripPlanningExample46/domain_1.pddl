(define (domain european_trip_11_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city day
  )

  (:constants
    seville manchester stockholm - city
  )

  (:predicates
    (at_day ?d - day ?c - city)
    (next_day ?d1 - day ?d2 - day)
    (direct ?from - city ?to - city)
    (day_open ?d - day)
    (advanced_from ?d - day)

    (sev_count_0)
    (sev_count_1)
    (sev_count_2)
    (sev_count_3)
    (sev_count_4)
    (sev_count_5)

    (man_count_0)
    (man_count_1)
    (man_count_2)
    (man_count_3)
    (man_count_4)
    (man_count_5)

    (sto_count_1)
    (sto_count_2)
    (sto_count_3)
  )

  (:action advance_stay_seville_0_1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (next_day ?d1 ?d2)
      (at_day ?d1 seville)
      (day_open ?d2)
      (not (advanced_from ?d1))
      (sev_count_0)
    )
    :effect (and
      (at_day ?d2 seville)
      (advanced_from ?d1)
      (not (day_open ?d2))
      (not (sev_count_0))
      (sev_count_1)
    )
  )

  (:action advance_stay_seville_1_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (next_day ?d1 ?d2)
      (at_day ?d1 seville)
      (day_open ?d2)
      (not (advanced_from ?d1))
      (sev_count_1)
    )
    :effect (and
      (at_day ?d2 seville)
      (advanced_from ?d1)
      (not (day_open ?d2))
      (not (sev_count_1))
      (sev_count_2)
    )
  )

  (:action advance_stay_seville_2_3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (next_day ?d1 ?d2)
      (at_day ?d1 seville)
      (day_open ?d2)
      (not (advanced_from ?d1))
      (sev_count_2)
    )
    :effect (and
      (at_day ?d2 seville)
      (advanced_from ?d1)
      (not (day_open ?d2))
      (not (sev_count_2))
      (sev_count_3)
    )
  )

  (:action advance_stay_seville_3_4
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (next_day ?d1 ?d2)
      (at_day ?d1 seville)
      (day_open ?d2)
      (not (advanced_from ?d1))
      (sev_count_3)
    )
    :effect (and
      (at_day ?d2 seville)
      (advanced_from ?d1)
      (not (day_open ?d2))
      (not (sev_count_3))
      (sev_count_4)
    )
  )

  (:action advance_stay_seville_4_5
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (next_day ?d1 ?d2)
      (at_day ?d1 seville)
      (day_open ?d2)
      (not (advanced_from ?d1))
      (sev_count_4)
    )
    :effect (and
      (at_day ?d2 seville)
      (advanced_from ?d1)
      (not (day_open ?d2))
      (not (sev_count_4))
      (sev_count_5)
    )
  )

  (:action advance_stay_manchester_0_1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (next_day ?d1 ?d2)
      (at_day ?d1 manchester)
      (day_open ?d2)
      (not (advanced_from ?d1))
      (man_count_0)
    )
    :effect (and
      (at_day ?d2 manchester)
      (advanced_from ?d1)
      (not (day_open ?d2))
      (not (man_count_0))
      (man_count_1)
    )
  )

  (:action advance_stay_manchester_1_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (next_day ?d1 ?d2)
      (at_day ?d1 manchester)
      (day_open ?d2)
      (not (advanced_from ?d1))
      (man_count_1)
    )
    :effect (and
      (at_day ?d2 manchester)
      (advanced_from ?d1)
      (not (day_open ?d2))
      (not (man_count_1))
      (man_count_2)
    )
  )

  (:action advance_stay_manchester_2_3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (next_day ?d1 ?d2)
      (at_day ?d1 manchester)
      (day_open ?d2)
      (not (advanced_from ?d1))
      (man_count_2)
    )
    :effect (and
      (at_day ?d2 manchester)
      (advanced_from ?d1)
      (not (day_open ?d2))
      (not (man_count_2))
      (man_count_3)
    )
  )

  (:action advance_stay_manchester_3_4
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (next_day ?d1 ?d2)
      (at_day ?d1 manchester)
      (day_open ?d2)
      (not (advanced_from ?d1))
      (man_count_3)
    )
    :effect (and
      (at_day ?d2 manchester)
      (advanced_from ?d1)
      (not (day_open ?d2))
      (not (man_count_3))
      (man_count_4)
    )
  )

  (:action advance_stay_manchester_4_5
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (next_day ?d1 ?d2)
      (at_day ?d1 manchester)
      (day_open ?d2)
      (not (advanced_from ?d1))
      (man_count_4)
    )
    :effect (and
      (at_day ?d2 manchester)
      (advanced_from ?d1)
      (not (day_open ?d2))
      (not (man_count_4))
      (man_count_5)
    )
  )

  (:action advance_stay_stockholm_1_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (next_day ?d1 ?d2)
      (at_day ?d1 stockholm)
      (day_open ?d2)
      (not (advanced_from ?d1))
      (sto_count_1)
    )
    :effect (and
      (at_day ?d2 stockholm)
      (advanced_from ?d1)
      (not (day_open ?d2))
      (not (sto_count_1))
      (sto_count_2)
    )
  )

  (:action advance_stay_stockholm_2_3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (next_day ?d1 ?d2)
      (at_day ?d1 stockholm)
      (day_open ?d2)
      (not (advanced_from ?d1))
      (sto_count_2)
    )
    :effect (and
      (at_day ?d2 stockholm)
      (advanced_from ?d1)
      (not (day_open ?d2))
      (not (sto_count_2))
      (sto_count_3)
    )
  )

  (:action advance_fly_seville_to_manchester_0_1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (next_day ?d1 ?d2)
      (at_day ?d1 seville)
      (direct seville manchester)
      (day_open ?d2)
      (not (advanced_from ?d1))
      (man_count_0)
    )
    :effect (and
      (at_day ?d2 manchester)
      (advanced_from ?d1)
      (not (day_open ?d2))
      (not (man_count_0))
      (man_count_1)
    )
  )

  (:action advance_fly_seville_to_manchester_1_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (next_day ?d1 ?d2)
      (at_day ?d1 seville)
      (direct seville manchester)
      (day_open ?d2)
      (not (advanced_from ?d1))
      (man_count_1)
    )
    :effect (and
      (at_day ?d2 manchester)
      (advanced_from ?d1)
      (not (day_open ?d2))
      (not (man_count_1))
      (man_count_2)
    )
  )

  (:action advance_fly_seville_to_manchester_2_3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (next_day ?d1 ?d2)
      (at_day ?d1 seville)
      (direct seville manchester)
      (day_open ?d2)
      (not (advanced_from ?d1))
      (man_count_2)
    )
    :effect (and
      (at_day ?d2 manchester)
      (advanced_from ?d1)
      (not (day_open ?d2))
      (not (man_count_2))
      (man_count_3)
    )
  )

  (:action advance_fly_seville_to_manchester_3_4
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (next_day ?d1 ?d2)
      (at_day ?d1 seville)
      (direct seville manchester)
      (day_open ?d2)
      (not (advanced_from ?d1))
      (man_count_3)
    )
    :effect (and
      (at_day ?d2 manchester)
      (advanced_from ?d1)
      (not (day_open ?d2))
      (not (man_count_3))
      (man_count_4)
    )
  )

  (:action advance_fly_seville_to_manchester_4_5
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (next_day ?d1 ?d2)
      (at_day ?d1 seville)
      (direct seville manchester)
      (day_open ?d2)
      (not (advanced_from ?d1))
      (man_count_4)
    )
    :effect (and
      (at_day ?d2 manchester)
      (advanced_from ?d1)
      (not (day_open ?d2))
      (not (man_count_4))
      (man_count_5)
    )
  )

  (:action advance_fly_manchester_to_seville_0_1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (next_day ?d1 ?d2)
      (at_day ?d1 manchester)
      (direct manchester seville)
      (day_open ?d2)
      (not (advanced_from ?d1))
      (sev_count_0)
    )
    :effect (and
      (at_day ?d2 seville)
      (advanced_from ?d1)
      (not (day_open ?d2))
      (not (sev_count_0))
      (sev_count_1)
    )
  )

  (:action advance_fly_manchester_to_seville_1_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (next_day ?d1 ?d2)
      (at_day ?d1 manchester)
      (direct manchester seville)
      (day_open ?d2)
      (not (advanced_from ?d1))
      (sev_count_1)
    )
    :effect (and
      (at_day ?d2 seville)
      (advanced_from ?d1)
      (not (day_open ?d2))
      (not (sev_count_1))
      (sev_count_2)
    )
  )

  (:action advance_fly_manchester_to_seville_2_3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (next_day ?d1 ?d2)
      (at_day ?d1 manchester)
      (direct manchester seville)
      (day_open ?d2)
      (not (advanced_from ?d1))
      (sev_count_2)
    )
    :effect (and
      (at_day ?d2 seville)
      (advanced_from ?d1)
      (not (day_open ?d2))
      (not (sev_count_2))
      (sev_count_3)
    )
  )

  (:action advance_fly_manchester_to_seville_3_4
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (next_day ?d1 ?d2)
      (at_day ?d1 manchester)
      (direct manchester seville)
      (day_open ?d2)
      (not (advanced_from ?d1))
      (sev_count_3)
    )
    :effect (and
      (at_day ?d2 seville)
      (advanced_from ?d1)
      (not (day_open ?d2))
      (not (sev_count_3))
      (sev_count_4)
    )
  )

  (:action advance_fly_manchester_to_seville_4_5
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (next_day ?d1 ?d2)
      (at_day ?d1 manchester)
      (direct manchester seville)
      (day_open ?d2)
      (not (advanced_from ?d1))
      (sev_count_4)
    )
    :effect (and
      (at_day ?d2 seville)
      (advanced_from ?d1)
      (not (day_open ?d2))
      (not (sev_count_4))
      (sev_count_5)
    )
  )

  (:action advance_fly_manchester_to_stockholm_1_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (next_day ?d1 ?d2)
      (at_day ?d1 manchester)
      (direct manchester stockholm)
      (day_open ?d2)
      (not (advanced_from ?d1))
      (sto_count_1)
    )
    :effect (and
      (at_day ?d2 stockholm)
      (advanced_from ?d1)
      (not (day_open ?d2))
      (not (sto_count_1))
      (sto_count_2)
    )
  )

  (:action advance_fly_manchester_to_stockholm_2_3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (next_day ?d1 ?d2)
      (at_day ?d1 manchester)
      (direct manchester stockholm)
      (day_open ?d2)
      (not (advanced_from ?d1))
      (sto_count_2)
    )
    :effect (and
      (at_day ?d2 stockholm)
      (advanced_from ?d1)
      (not (day_open ?d2))
      (not (sto_count_2))
      (sto_count_3)
    )
  )

  (:action advance_fly_stockholm_to_manchester_0_1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (next_day ?d1 ?d2)
      (at_day ?d1 stockholm)
      (direct stockholm manchester)
      (day_open ?d2)
      (not (advanced_from ?d1))
      (man_count_0)
    )
    :effect (and
      (at_day ?d2 manchester)
      (advanced_from ?d1)
      (not (day_open ?d2))
      (not (man_count_0))
      (man_count_1)
    )
  )

  (:action advance_fly_stockholm_to_manchester_1_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (next_day ?d1 ?d2)
      (at_day ?d1 stockholm)
      (direct stockholm manchester)
      (day_open ?d2)
      (not (advanced_from ?d1))
      (man_count_1)
    )
    :effect (and
      (at_day ?d2 manchester)
      (advanced_from ?d1)
      (not (day_open ?d2))
      (not (man_count_1))
      (man_count_2)
    )
  )

  (:action advance_fly_stockholm_to_manchester_2_3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (next_day ?d1 ?d2)
      (at_day ?d1 stockholm)
      (direct stockholm manchester)
      (day_open ?d2)
      (not (advanced_from ?d1))
      (man_count_2)
    )
    :effect (and
      (at_day ?d2 manchester)
      (advanced_from ?d1)
      (not (day_open ?d2))
      (not (man_count_2))
      (man_count_3)
    )
  )

  (:action advance_fly_stockholm_to_manchester_3_4
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (next_day ?d1 ?d2)
      (at_day ?d1 stockholm)
      (direct stockholm manchester)
      (day_open ?d2)
      (not (advanced_from ?d1))
      (man_count_3)
    )
    :effect (and
      (at_day ?d2 manchester)
      (advanced_from ?d1)
      (not (day_open ?d2))
      (not (man_count_3))
      (man_count_4)
    )
  )

  (:action advance_fly_stockholm_to_manchester_4_5
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (next_day ?d1 ?d2)
      (at_day ?d1 stockholm)
      (direct stockholm manchester)
      (day_open ?d2)
      (not (advanced_from ?d1))
      (man_count_4)
    )
    :effect (and
      (at_day ?d2 manchester)
      (advanced_from ?d1)
      (not (day_open ?d2))
      (not (man_count_4))
      (man_count_5)
    )
  )
)