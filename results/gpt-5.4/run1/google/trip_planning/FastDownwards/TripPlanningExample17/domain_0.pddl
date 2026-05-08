(define (domain european_trip_11_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
    copenhagen_count
    vienna_count
    lyon_count
  )

  (:predicates
    (next_day ?d1 - day ?d2 - day)
    (last_day ?d - day)

    (trip_started)
    (current_day ?d - day)
    (occupied ?d - day ?c - city)

    (direct_flight ?from - city ?to - city)

    (cph_count_at ?n - copenhagen_count)
    (cph_next ?n1 - copenhagen_count ?n2 - copenhagen_count)

    (vie_count_at ?n - vienna_count)
    (vie_next ?n1 - vienna_count ?n2 - vienna_count)

    (lyo_count_at ?n - lyon_count)
    (lyo_next ?n1 - lyon_count ?n2 - lyon_count)
  )

  (:action start_in_copenhagen
    :parameters (?n1 - copenhagen_count ?n2 - copenhagen_count)
    :precondition (and
      (not (trip_started))
      (cph_count_at ?n1)
      (cph_next ?n1 ?n2)
    )
    :effect (and
      (trip_started)
      (occupied day_1 copenhagen)
      (current_day day_1)
      (not (cph_count_at ?n1))
      (cph_count_at ?n2)
    )
  )

  (:action start_in_vienna
    :parameters (?n1 - vienna_count ?n2 - vienna_count)
    :precondition (and
      (not (trip_started))
      (vie_count_at ?n1)
      (vie_next ?n1 ?n2)
    )
    :effect (and
      (trip_started)
      (occupied day_1 vienna)
      (current_day day_1)
      (not (vie_count_at ?n1))
      (vie_count_at ?n2)
    )
  )

  (:action start_in_lyon
    :parameters (?n1 - lyon_count ?n2 - lyon_count)
    :precondition (and
      (not (trip_started))
      (lyo_count_at ?n1)
      (lyo_next ?n1 ?n2)
    )
    :effect (and
      (trip_started)
      (occupied day_1 lyon)
      (current_day day_1)
      (not (lyo_count_at ?n1))
      (lyo_count_at ?n2)
    )
  )

  (:action stay_copenhagen
    :parameters (?d1 - day ?d2 - day ?n1 - copenhagen_count ?n2 - copenhagen_count)
    :precondition (and
      (trip_started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (occupied ?d1 copenhagen)
      (cph_count_at ?n1)
      (cph_next ?n1 ?n2)
    )
    :effect (and
      (occupied ?d2 copenhagen)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (cph_count_at ?n1))
      (cph_count_at ?n2)
    )
  )

  (:action stay_vienna
    :parameters (?d1 - day ?d2 - day ?n1 - vienna_count ?n2 - vienna_count)
    :precondition (and
      (trip_started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (occupied ?d1 vienna)
      (vie_count_at ?n1)
      (vie_next ?n1 ?n2)
    )
    :effect (and
      (occupied ?d2 vienna)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (vie_count_at ?n1))
      (vie_count_at ?n2)
    )
  )

  (:action stay_lyon
    :parameters (?d1 - day ?d2 - day ?n1 - lyon_count ?n2 - lyon_count)
    :precondition (and
      (trip_started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (occupied ?d1 lyon)
      (lyo_count_at ?n1)
      (lyo_next ?n1 ?n2)
    )
    :effect (and
      (occupied ?d2 lyon)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (lyo_count_at ?n1))
      (lyo_count_at ?n2)
    )
  )

  (:action fly_to_copenhagen_from_vienna
    :parameters (?d1 - day ?d2 - day ?n1 - copenhagen_count ?n2 - copenhagen_count)
    :precondition (and
      (trip_started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (occupied ?d1 vienna)
      (direct_flight vienna copenhagen)
      (cph_count_at ?n1)
      (cph_next ?n1 ?n2)
    )
    :effect (and
      (occupied ?d2 copenhagen)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (cph_count_at ?n1))
      (cph_count_at ?n2)
    )
  )

  (:action fly_to_vienna_from_copenhagen
    :parameters (?d1 - day ?d2 - day ?n1 - vienna_count ?n2 - vienna_count)
    :precondition (and
      (trip_started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (occupied ?d1 copenhagen)
      (direct_flight copenhagen vienna)
      (vie_count_at ?n1)
      (vie_next ?n1 ?n2)
    )
    :effect (and
      (occupied ?d2 vienna)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (vie_count_at ?n1))
      (vie_count_at ?n2)
    )
  )

  (:action fly_to_vienna_from_lyon
    :parameters (?d1 - day ?d2 - day ?n1 - vienna_count ?n2 - vienna_count)
    :precondition (and
      (trip_started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (occupied ?d1 lyon)
      (direct_flight lyon vienna)
      (vie_count_at ?n1)
      (vie_next ?n1 ?n2)
    )
    :effect (and
      (occupied ?d2 vienna)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (vie_count_at ?n1))
      (vie_count_at ?n2)
    )
  )

  (:action fly_to_lyon_from_vienna
    :parameters (?d1 - day ?d2 - day ?n1 - lyon_count ?n2 - lyon_count)
    :precondition (and
      (trip_started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (occupied ?d1 vienna)
      (direct_flight vienna lyon)
      (lyo_count_at ?n1)
      (lyo_next ?n1 ?n2)
    )
    :effect (and
      (occupied ?d2 lyon)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (lyo_count_at ?n1))
      (lyo_count_at ?n2)
    )
  )
)