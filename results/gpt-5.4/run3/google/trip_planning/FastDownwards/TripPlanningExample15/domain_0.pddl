(define (domain european_trip_11_days_unsat)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (connected ?from - city ?to - city)
    (next_day ?d1 - day ?d2 - day)
    (at ?d - day ?c - city)
    (assigned ?d - day)

    (berlin_count_0)
    (berlin_count_1)
    (berlin_count_2)
    (berlin_count_3)
    (berlin_count_4)
    (berlin_count_5)
    (berlin_count_6)

    (porto_count_0)
    (porto_count_1)
    (porto_count_2)

    (krakow_count_0)
    (krakow_count_1)
    (krakow_count_2)
    (krakow_count_3)
    (krakow_count_4)
    (krakow_count_5)
  )

  (:action seed_start_day_berlin
    :precondition (and
      (not (assigned day_1))
      (berlin_count_0)
    )
    :effect (and
      (at day_1 berlin)
      (assigned day_1)
      (not (berlin_count_0))
      (berlin_count_1)
    )
  )

  (:action seed_start_day_porto
    :precondition (and
      (not (assigned day_1))
      (porto_count_0)
    )
    :effect (and
      (at day_1 porto)
      (assigned day_1)
      (not (porto_count_0))
      (porto_count_1)
    )
  )

  (:action seed_start_day_krakow
    :precondition (and
      (not (assigned day_1))
      (krakow_count_0)
    )
    :effect (and
      (at day_1 krakow)
      (assigned day_1)
      (not (krakow_count_0))
      (krakow_count_1)
    )
  )

  (:action stay_next_day_berlin_b0_b1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (at ?d1 berlin)
      (not (assigned ?d2))
      (berlin_count_0)
    )
    :effect (and
      (at ?d2 berlin)
      (assigned ?d2)
      (not (berlin_count_0))
      (berlin_count_1)
    )
  )

  (:action stay_next_day_berlin_b1_b2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (at ?d1 berlin)
      (not (assigned ?d2))
      (berlin_count_1)
    )
    :effect (and
      (at ?d2 berlin)
      (assigned ?d2)
      (not (berlin_count_1))
      (berlin_count_2)
    )
  )

  (:action stay_next_day_berlin_b2_b3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (at ?d1 berlin)
      (not (assigned ?d2))
      (berlin_count_2)
    )
    :effect (and
      (at ?d2 berlin)
      (assigned ?d2)
      (not (berlin_count_2))
      (berlin_count_3)
    )
  )

  (:action stay_next_day_berlin_b3_b4
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (at ?d1 berlin)
      (not (assigned ?d2))
      (berlin_count_3)
    )
    :effect (and
      (at ?d2 berlin)
      (assigned ?d2)
      (not (berlin_count_3))
      (berlin_count_4)
    )
  )

  (:action stay_next_day_berlin_b4_b5
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (at ?d1 berlin)
      (not (assigned ?d2))
      (berlin_count_4)
    )
    :effect (and
      (at ?d2 berlin)
      (assigned ?d2)
      (not (berlin_count_4))
      (berlin_count_5)
    )
  )

  (:action stay_next_day_berlin_b5_b6
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (at ?d1 berlin)
      (not (assigned ?d2))
      (berlin_count_5)
    )
    :effect (and
      (at ?d2 berlin)
      (assigned ?d2)
      (not (berlin_count_5))
      (berlin_count_6)
    )
  )

  (:action stay_next_day_porto_p0_p1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (at ?d1 porto)
      (not (assigned ?d2))
      (porto_count_0)
    )
    :effect (and
      (at ?d2 porto)
      (assigned ?d2)
      (not (porto_count_0))
      (porto_count_1)
    )
  )

  (:action stay_next_day_porto_p1_p2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (at ?d1 porto)
      (not (assigned ?d2))
      (porto_count_1)
    )
    :effect (and
      (at ?d2 porto)
      (assigned ?d2)
      (not (porto_count_1))
      (porto_count_2)
    )
  )

  (:action stay_next_day_krakow_k0_k1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (at ?d1 krakow)
      (not (assigned ?d2))
      (krakow_count_0)
    )
    :effect (and
      (at ?d2 krakow)
      (assigned ?d2)
      (not (krakow_count_0))
      (krakow_count_1)
    )
  )

  (:action stay_next_day_krakow_k1_k2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (at ?d1 krakow)
      (not (assigned ?d2))
      (krakow_count_1)
    )
    :effect (and
      (at ?d2 krakow)
      (assigned ?d2)
      (not (krakow_count_1))
      (krakow_count_2)
    )
  )

  (:action stay_next_day_krakow_k2_k3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (at ?d1 krakow)
      (not (assigned ?d2))
      (krakow_count_2)
    )
    :effect (and
      (at ?d2 krakow)
      (assigned ?d2)
      (not (krakow_count_2))
      (krakow_count_3)
    )
  )

  (:action stay_next_day_krakow_k3_k4
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (at ?d1 krakow)
      (not (assigned ?d2))
      (krakow_count_3)
    )
    :effect (and
      (at ?d2 krakow)
      (assigned ?d2)
      (not (krakow_count_3))
      (krakow_count_4)
    )
  )

  (:action stay_next_day_krakow_k4_k5
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (at ?d1 krakow)
      (not (assigned ?d2))
      (krakow_count_4)
    )
    :effect (and
      (at ?d2 krakow)
      (assigned ?d2)
      (not (krakow_count_4))
      (krakow_count_5)
    )
  )

  (:action fly_next_day_berlin_to_porto_b0_b1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (at ?d1 berlin)
      (connected berlin porto)
      (not (assigned ?d2))
      (porto_count_0)
    )
    :effect (and
      (at ?d2 porto)
      (assigned ?d2)
      (not (porto_count_0))
      (porto_count_1)
    )
  )

  (:action fly_next_day_berlin_to_porto_b1_b2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (at ?d1 berlin)
      (connected berlin porto)
      (not (assigned ?d2))
      (porto_count_1)
    )
    :effect (and
      (at ?d2 porto)
      (assigned ?d2)
      (not (porto_count_1))
      (porto_count_2)
    )
  )

  (:action fly_next_day_porto_to_berlin_p0_p1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (at ?d1 porto)
      (connected porto berlin)
      (not (assigned ?d2))
      (berlin_count_0)
    )
    :effect (and
      (at ?d2 berlin)
      (assigned ?d2)
      (not (berlin_count_0))
      (berlin_count_1)
    )
  )

  (:action fly_next_day_porto_to_berlin_p1_p2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (at ?d1 porto)
      (connected porto berlin)
      (not (assigned ?d2))
      (berlin_count_1)
    )
    :effect (and
      (at ?d2 berlin)
      (assigned ?d2)
      (not (berlin_count_1))
      (berlin_count_2)
    )
  )

  (:action fly_next_day_porto_to_berlin_p2_p3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (at ?d1 porto)
      (connected porto berlin)
      (not (assigned ?d2))
      (berlin_count_2)
    )
    :effect (and
      (at ?d2 berlin)
      (assigned ?d2)
      (not (berlin_count_2))
      (berlin_count_3)
    )
  )

  (:action fly_next_day_porto_to_berlin_p3_p4
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (at ?d1 porto)
      (connected porto berlin)
      (not (assigned ?d2))
      (berlin_count_3)
    )
    :effect (and
      (at ?d2 berlin)
      (assigned ?d2)
      (not (berlin_count_3))
      (berlin_count_4)
    )
  )

  (:action fly_next_day_porto_to_berlin_p4_p5
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (at ?d1 porto)
      (connected porto berlin)
      (not (assigned ?d2))
      (berlin_count_4)
    )
    :effect (and
      (at ?d2 berlin)
      (assigned ?d2)
      (not (berlin_count_4))
      (berlin_count_5)
    )
  )

  (:action fly_next_day_porto_to_berlin_p5_p6
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (at ?d1 porto)
      (connected porto berlin)
      (not (assigned ?d2))
      (berlin_count_5)
    )
    :effect (and
      (at ?d2 berlin)
      (assigned ?d2)
      (not (berlin_count_5))
      (berlin_count_6)
    )
  )

  (:action fly_next_day_berlin_to_krakow_b0_b1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (at ?d1 berlin)
      (connected berlin krakow)
      (not (assigned ?d2))
      (krakow_count_0)
    )
    :effect (and
      (at ?d2 krakow)
      (assigned ?d2)
      (not (krakow_count_0))
      (krakow_count_1)
    )
  )

  (:action fly_next_day_berlin_to_krakow_b1_b2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (at ?d1 berlin)
      (connected berlin krakow)
      (not (assigned ?d2))
      (krakow_count_1)
    )
    :effect (and
      (at ?d2 krakow)
      (assigned ?d2)
      (not (krakow_count_1))
      (krakow_count_2)
    )
  )

  (:action fly_next_day_berlin_to_krakow_b2_b3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (at ?d1 berlin)
      (connected berlin krakow)
      (not (assigned ?d2))
      (krakow_count_2)
    )
    :effect (and
      (at ?d2 krakow)
      (assigned ?d2)
      (not (krakow_count_2))
      (krakow_count_3)
    )
  )

  (:action fly_next_day_berlin_to_krakow_b3_b4
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (at ?d1 berlin)
      (connected berlin krakow)
      (not (assigned ?d2))
      (krakow_count_3)
    )
    :effect (and
      (at ?d2 krakow)
      (assigned ?d2)
      (not (krakow_count_3))
      (krakow_count_4)
    )
  )

  (:action fly_next_day_berlin_to_krakow_b4_b5
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (at ?d1 berlin)
      (connected berlin krakow)
      (not (assigned ?d2))
      (krakow_count_4)
    )
    :effect (and
      (at ?d2 krakow)
      (assigned ?d2)
      (not (krakow_count_4))
      (krakow_count_5)
    )
  )

  (:action fly_next_day_krakow_to_berlin_k0_k1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (at ?d1 krakow)
      (connected krakow berlin)
      (not (assigned ?d2))
      (berlin_count_0)
    )
    :effect (and
      (at ?d2 berlin)
      (assigned ?d2)
      (not (berlin_count_0))
      (berlin_count_1)
    )
  )

  (:action fly_next_day_krakow_to_berlin_k1_k2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (at ?d1 krakow)
      (connected krakow berlin)
      (not (assigned ?d2))
      (berlin_count_1)
    )
    :effect (and
      (at ?d2 berlin)
      (assigned ?d2)
      (not (berlin_count_1))
      (berlin_count_2)
    )
  )

  (:action fly_next_day_krakow_to_berlin_k2_k3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (at ?d1 krakow)
      (connected krakow berlin)
      (not (assigned ?d2))
      (berlin_count_2)
    )
    :effect (and
      (at ?d2 berlin)
      (assigned ?d2)
      (not (berlin_count_2))
      (berlin_count_3)
    )
  )

  (:action fly_next_day_krakow_to_berlin_k3_k4
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (at ?d1 krakow)
      (connected krakow berlin)
      (not (assigned ?d2))
      (berlin_count_3)
    )
    :effect (and
      (at ?d2 berlin)
      (assigned ?d2)
      (not (berlin_count_3))
      (berlin_count_4)
    )
  )

  (:action fly_next_day_krakow_to_berlin_k4_k5
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (at ?d1 krakow)
      (connected krakow berlin)
      (not (assigned ?d2))
      (berlin_count_4)
    )
    :effect (and
      (at ?d2 berlin)
      (assigned ?d2)
      (not (berlin_count_4))
      (berlin_count_5)
    )
  )

  (:action fly_next_day_krakow_to_berlin_k5_k6
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (at ?d1 krakow)
      (connected krakow berlin)
      (not (assigned ?d2))
      (berlin_count_5)
    )
    :effect (and
      (at ?d2 berlin)
      (assigned ?d2)
      (not (berlin_count_5))
      (berlin_count_6)
    )
  )
)