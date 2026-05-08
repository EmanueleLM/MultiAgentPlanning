(define (domain european_trip_10_days)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (at ?d - day ?c - city)
    (day_assigned ?d - day)
    (direct_flight ?from - city ?to - city)

    (counted_lyon ?d - day)
    (counted_frankfurt ?d - day)
    (counted_krakow ?d - day)

    (lyon_0)
    (lyon_1)
    (lyon_2)
    (lyon_3)
    (lyon_4)
    (lyon_5)

    (frankfurt_0)
    (frankfurt_1)
    (frankfurt_2)

    (krakow_0)
    (krakow_1)
    (krakow_2)
    (krakow_3)
  )

  (:action assign_start_day
    :parameters (?c - city)
    :precondition (and
      (current_day d1)
      (not (day_assigned d1))
    )
    :effect (and
      (at d1 ?c)
      (day_assigned d1)
    )
  )

  (:action stay_to_next_day
    :parameters (?d1 - day ?d2 - day ?c - city)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (day_assigned ?d1)
      (at ?d1 ?c)
      (not (day_assigned ?d2))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at ?d2 ?c)
      (day_assigned ?d2)
    )
  )

  (:action fly_lyon_to_frankfurt
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (day_assigned ?d1)
      (at ?d1 lyon)
      (not (day_assigned ?d2))
      (direct_flight lyon frankfurt)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at ?d2 frankfurt)
      (day_assigned ?d2)
    )
  )

  (:action fly_frankfurt_to_lyon
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (day_assigned ?d1)
      (at ?d1 frankfurt)
      (not (day_assigned ?d2))
      (direct_flight frankfurt lyon)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at ?d2 lyon)
      (day_assigned ?d2)
    )
  )

  (:action fly_frankfurt_to_krakow
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (day_assigned ?d1)
      (at ?d1 frankfurt)
      (not (day_assigned ?d2))
      (direct_flight frankfurt krakow)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at ?d2 krakow)
      (day_assigned ?d2)
    )
  )

  (:action fly_krakow_to_frankfurt
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (day_assigned ?d1)
      (at ?d1 krakow)
      (not (day_assigned ?d2))
      (direct_flight krakow frankfurt)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at ?d2 frankfurt)
      (day_assigned ?d2)
    )
  )

  (:action count_day_lyon_0_1
    :parameters (?d - day)
    :precondition (and
      (at ?d lyon)
      (not (counted_lyon ?d))
      (lyon_0)
    )
    :effect (and
      (counted_lyon ?d)
      (not (lyon_0))
      (lyon_1)
    )
  )

  (:action count_day_lyon_1_2
    :parameters (?d - day)
    :precondition (and
      (at ?d lyon)
      (not (counted_lyon ?d))
      (lyon_1)
    )
    :effect (and
      (counted_lyon ?d)
      (not (lyon_1))
      (lyon_2)
    )
  )

  (:action count_day_lyon_2_3
    :parameters (?d - day)
    :precondition (and
      (at ?d lyon)
      (not (counted_lyon ?d))
      (lyon_2)
    )
    :effect (and
      (counted_lyon ?d)
      (not (lyon_2))
      (lyon_3)
    )
  )

  (:action count_day_lyon_3_4
    :parameters (?d - day)
    :precondition (and
      (at ?d lyon)
      (not (counted_lyon ?d))
      (lyon_3)
    )
    :effect (and
      (counted_lyon ?d)
      (not (lyon_3))
      (lyon_4)
    )
  )

  (:action count_day_lyon_4_5
    :parameters (?d - day)
    :precondition (and
      (at ?d lyon)
      (not (counted_lyon ?d))
      (lyon_4)
    )
    :effect (and
      (counted_lyon ?d)
      (not (lyon_4))
      (lyon_5)
    )
  )

  (:action count_day_frankfurt_0_1
    :parameters (?d - day)
    :precondition (and
      (at ?d frankfurt)
      (not (counted_frankfurt ?d))
      (frankfurt_0)
    )
    :effect (and
      (counted_frankfurt ?d)
      (not (frankfurt_0))
      (frankfurt_1)
    )
  )

  (:action count_day_frankfurt_1_2
    :parameters (?d - day)
    :precondition (and
      (at ?d frankfurt)
      (not (counted_frankfurt ?d))
      (frankfurt_1)
    )
    :effect (and
      (counted_frankfurt ?d)
      (not (frankfurt_1))
      (frankfurt_2)
    )
  )

  (:action count_day_krakow_0_1
    :parameters (?d - day)
    :precondition (and
      (at ?d krakow)
      (not (counted_krakow ?d))
      (krakow_0)
    )
    :effect (and
      (counted_krakow ?d)
      (not (krakow_0))
      (krakow_1)
    )
  )

  (:action count_day_krakow_1_2
    :parameters (?d - day)
    :precondition (and
      (at ?d krakow)
      (not (counted_krakow ?d))
      (krakow_1)
    )
    :effect (and
      (counted_krakow ?d)
      (not (krakow_1))
      (krakow_2)
    )
  )

  (:action count_day_krakow_2_3
    :parameters (?d - day)
    :precondition (and
      (at ?d krakow)
      (not (counted_krakow ?d))
      (krakow_2)
    )
    :effect (and
      (counted_krakow ?d)
      (not (krakow_2))
      (krakow_3)
    )
  )
)