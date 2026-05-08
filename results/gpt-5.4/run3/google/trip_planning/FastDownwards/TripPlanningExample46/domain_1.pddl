(define (domain european_trip_11_days)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (at ?c - city)
    (direct_flight ?from - city ?to - city)
    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (occupied ?d - day ?c - city)

    (seville_count_0)
    (seville_count_1)
    (seville_count_2)
    (seville_count_3)
    (seville_count_4)
    (seville_count_5)

    (manchester_count_0)
    (manchester_count_1)
    (manchester_count_2)
    (manchester_count_3)
    (manchester_count_4)
    (manchester_count_5)

    (stockholm_count_0)
    (stockholm_count_1)
    (stockholm_count_2)
    (stockholm_count_3)
  )

  (:action stay_seville_0
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at seville)
      (seville_count_0)
    )
    :effect (and
      (occupied ?d seville)
      (not (current_day ?d))
      (current_day ?d_next)
      (not (seville_count_0))
      (seville_count_1)
    )
  )

  (:action stay_seville_1
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at seville)
      (seville_count_1)
    )
    :effect (and
      (occupied ?d seville)
      (not (current_day ?d))
      (current_day ?d_next)
      (not (seville_count_1))
      (seville_count_2)
    )
  )

  (:action stay_seville_2
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at seville)
      (seville_count_2)
    )
    :effect (and
      (occupied ?d seville)
      (not (current_day ?d))
      (current_day ?d_next)
      (not (seville_count_2))
      (seville_count_3)
    )
  )

  (:action stay_seville_3
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at seville)
      (seville_count_3)
    )
    :effect (and
      (occupied ?d seville)
      (not (current_day ?d))
      (current_day ?d_next)
      (not (seville_count_3))
      (seville_count_4)
    )
  )

  (:action stay_seville_4
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at seville)
      (seville_count_4)
    )
    :effect (and
      (occupied ?d seville)
      (not (current_day ?d))
      (current_day ?d_next)
      (not (seville_count_4))
      (seville_count_5)
    )
  )

  (:action stay_manchester_0
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at manchester)
      (manchester_count_0)
    )
    :effect (and
      (occupied ?d manchester)
      (not (current_day ?d))
      (current_day ?d_next)
      (not (manchester_count_0))
      (manchester_count_1)
    )
  )

  (:action stay_manchester_1
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at manchester)
      (manchester_count_1)
    )
    :effect (and
      (occupied ?d manchester)
      (not (current_day ?d))
      (current_day ?d_next)
      (not (manchester_count_1))
      (manchester_count_2)
    )
  )

  (:action stay_manchester_2
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at manchester)
      (manchester_count_2)
    )
    :effect (and
      (occupied ?d manchester)
      (not (current_day ?d))
      (current_day ?d_next)
      (not (manchester_count_2))
      (manchester_count_3)
    )
  )

  (:action stay_manchester_3
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at manchester)
      (manchester_count_3)
    )
    :effect (and
      (occupied ?d manchester)
      (not (current_day ?d))
      (current_day ?d_next)
      (not (manchester_count_3))
      (manchester_count_4)
    )
  )

  (:action stay_manchester_4
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at manchester)
      (manchester_count_4)
    )
    :effect (and
      (occupied ?d manchester)
      (not (current_day ?d))
      (current_day ?d_next)
      (not (manchester_count_4))
      (manchester_count_5)
    )
  )

  (:action stay_stockholm_0
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at stockholm)
      (stockholm_count_0)
      (not (current_day day_3))
      (not (current_day day_1))
    )
    :effect (and
      (occupied ?d stockholm)
      (not (current_day ?d))
      (current_day ?d_next)
      (not (stockholm_count_0))
      (stockholm_count_1)
    )
  )

  (:action stay_stockholm_1
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at stockholm)
      (stockholm_count_1)
      (not (current_day day_3))
      (not (current_day day_1))
    )
    :effect (and
      (occupied ?d stockholm)
      (not (current_day ?d))
      (current_day ?d_next)
      (not (stockholm_count_1))
      (stockholm_count_2)
    )
  )

  (:action stay_stockholm_2
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at stockholm)
      (stockholm_count_2)
      (not (current_day day_3))
      (not (current_day day_1))
    )
    :effect (and
      (occupied ?d stockholm)
      (not (current_day ?d))
      (current_day ?d_next)
      (not (stockholm_count_2))
      (stockholm_count_3)
    )
  )

  (:action stay_stockholm_day1_0
    :parameters (?d_next - day)
    :precondition (and
      (current_day day_1)
      (next_day day_1 ?d_next)
      (at stockholm)
      (stockholm_count_0)
    )
    :effect (and
      (occupied day_1 stockholm)
      (not (current_day day_1))
      (current_day ?d_next)
      (not (stockholm_count_0))
      (stockholm_count_1)
    )
  )

  (:action stay_stockholm_day1_1
    :parameters (?d_next - day)
    :precondition (and
      (current_day day_1)
      (next_day day_1 ?d_next)
      (at stockholm)
      (stockholm_count_1)
    )
    :effect (and
      (occupied day_1 stockholm)
      (not (current_day day_1))
      (current_day ?d_next)
      (not (stockholm_count_1))
      (stockholm_count_2)
    )
  )

  (:action stay_stockholm_day1_2
    :parameters (?d_next - day)
    :precondition (and
      (current_day day_1)
      (next_day day_1 ?d_next)
      (at stockholm)
      (stockholm_count_2)
    )
    :effect (and
      (occupied day_1 stockholm)
      (not (current_day day_1))
      (current_day ?d_next)
      (not (stockholm_count_2))
      (stockholm_count_3)
    )
  )

  (:action stay_stockholm_day3_0
    :parameters (?d_next - day)
    :precondition (and
      (current_day day_3)
      (next_day day_3 ?d_next)
      (at stockholm)
      (stockholm_count_0)
    )
    :effect (and
      (occupied day_3 stockholm)
      (not (current_day day_3))
      (current_day ?d_next)
      (not (stockholm_count_0))
      (stockholm_count_1)
    )
  )

  (:action stay_stockholm_day3_1
    :parameters (?d_next - day)
    :precondition (and
      (current_day day_3)
      (next_day day_3 ?d_next)
      (at stockholm)
      (stockholm_count_1)
    )
    :effect (and
      (occupied day_3 stockholm)
      (not (current_day day_3))
      (current_day ?d_next)
      (not (stockholm_count_1))
      (stockholm_count_2)
    )
  )

  (:action stay_stockholm_day3_2
    :parameters (?d_next - day)
    :precondition (and
      (current_day day_3)
      (next_day day_3 ?d_next)
      (at stockholm)
      (stockholm_count_2)
    )
    :effect (and
      (occupied day_3 stockholm)
      (not (current_day day_3))
      (current_day ?d_next)
      (not (stockholm_count_2))
      (stockholm_count_3)
    )
  )

  (:action fly_seville_to_manchester_0
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at seville)
      (direct_flight seville manchester)
      (seville_count_0)
    )
    :effect (and
      (occupied ?d seville)
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at seville))
      (at manchester)
      (not (seville_count_0))
      (seville_count_1)
    )
  )

  (:action fly_seville_to_manchester_1
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at seville)
      (direct_flight seville manchester)
      (seville_count_1)
    )
    :effect (and
      (occupied ?d seville)
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at seville))
      (at manchester)
      (not (seville_count_1))
      (seville_count_2)
    )
  )

  (:action fly_seville_to_manchester_2
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at seville)
      (direct_flight seville manchester)
      (seville_count_2)
    )
    :effect (and
      (occupied ?d seville)
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at seville))
      (at manchester)
      (not (seville_count_2))
      (seville_count_3)
    )
  )

  (:action fly_seville_to_manchester_3
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at seville)
      (direct_flight seville manchester)
      (seville_count_3)
    )
    :effect (and
      (occupied ?d seville)
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at seville))
      (at manchester)
      (not (seville_count_3))
      (seville_count_4)
    )
  )

  (:action fly_seville_to_manchester_4
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at seville)
      (direct_flight seville manchester)
      (seville_count_4)
    )
    :effect (and
      (occupied ?d seville)
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at seville))
      (at manchester)
      (not (seville_count_4))
      (seville_count_5)
    )
  )

  (:action fly_manchester_to_seville_0
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at manchester)
      (direct_flight manchester seville)
      (manchester_count_0)
      (not (current_day day_3))
    )
    :effect (and
      (occupied ?d manchester)
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at manchester))
      (at seville)
      (not (manchester_count_0))
      (manchester_count_1)
    )
  )

  (:action fly_manchester_to_seville_1
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at manchester)
      (direct_flight manchester seville)
      (manchester_count_1)
      (not (current_day day_3))
    )
    :effect (and
      (occupied ?d manchester)
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at manchester))
      (at seville)
      (not (manchester_count_1))
      (manchester_count_2)
    )
  )

  (:action fly_manchester_to_seville_2
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at manchester)
      (direct_flight manchester seville)
      (manchester_count_2)
      (not (current_day day_3))
    )
    :effect (and
      (occupied ?d manchester)
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at manchester))
      (at seville)
      (not (manchester_count_2))
      (manchester_count_3)
    )
  )

  (:action fly_manchester_to_seville_3
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at manchester)
      (direct_flight manchester seville)
      (manchester_count_3)
      (not (current_day day_3))
    )
    :effect (and
      (occupied ?d manchester)
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at manchester))
      (at seville)
      (not (manchester_count_3))
      (manchester_count_4)
    )
  )

  (:action fly_manchester_to_seville_4
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at manchester)
      (direct_flight manchester seville)
      (manchester_count_4)
      (not (current_day day_3))
    )
    :effect (and
      (occupied ?d manchester)
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at manchester))
      (at seville)
      (not (manchester_count_4))
      (manchester_count_5)
    )
  )

  (:action fly_manchester_to_stockholm_0
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at manchester)
      (direct_flight manchester stockholm)
      (manchester_count_0)
      (not (current_day day_3))
    )
    :effect (and
      (occupied ?d manchester)
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at manchester))
      (at stockholm)
      (not (manchester_count_0))
      (manchester_count_1)
    )
  )

  (:action fly_manchester_to_stockholm_1
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at manchester)
      (direct_flight manchester stockholm)
      (manchester_count_1)
      (not (current_day day_3))
    )
    :effect (and
      (occupied ?d manchester)
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at manchester))
      (at stockholm)
      (not (manchester_count_1))
      (manchester_count_2)
    )
  )

  (:action fly_manchester_to_stockholm_2
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at manchester)
      (direct_flight manchester stockholm)
      (manchester_count_2)
      (not (current_day day_3))
    )
    :effect (and
      (occupied ?d manchester)
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at manchester))
      (at stockholm)
      (not (manchester_count_2))
      (manchester_count_3)
    )
  )

  (:action fly_manchester_to_stockholm_3
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at manchester)
      (direct_flight manchester stockholm)
      (manchester_count_3)
      (not (current_day day_3))
    )
    :effect (and
      (occupied ?d manchester)
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at manchester))
      (at stockholm)
      (not (manchester_count_3))
      (manchester_count_4)
    )
  )

  (:action fly_manchester_to_stockholm_4
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at manchester)
      (direct_flight manchester stockholm)
      (manchester_count_4)
      (not (current_day day_3))
    )
    :effect (and
      (occupied ?d manchester)
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at manchester))
      (at stockholm)
      (not (manchester_count_4))
      (manchester_count_5)
    )
  )

  (:action fly_stockholm_to_manchester_0
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at stockholm)
      (direct_flight stockholm manchester)
      (stockholm_count_0)
      (not (current_day day_3))
      (not (current_day day_1))
    )
    :effect (and
      (occupied ?d stockholm)
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at stockholm))
      (at manchester)
      (not (stockholm_count_0))
      (stockholm_count_1)
    )
  )

  (:action fly_stockholm_to_manchester_1
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at stockholm)
      (direct_flight stockholm manchester)
      (stockholm_count_1)
      (not (current_day day_3))
      (not (current_day day_1))
    )
    :effect (and
      (occupied ?d stockholm)
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at stockholm))
      (at manchester)
      (not (stockholm_count_1))
      (stockholm_count_2)
    )
  )

  (:action fly_stockholm_to_manchester_2
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at stockholm)
      (direct_flight stockholm manchester)
      (stockholm_count_2)
      (not (current_day day_3))
      (not (current_day day_1))
    )
    :effect (and
      (occupied ?d stockholm)
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at stockholm))
      (at manchester)
      (not (stockholm_count_2))
      (stockholm_count_3)
    )
  )

  (:action stay_last_seville_0
    :parameters ()
    :precondition (and
      (current_day day_11)
      (at seville)
      (seville_count_0)
    )
    :effect (and
      (occupied day_11 seville)
      (not (current_day day_11))
      (not (seville_count_0))
      (seville_count_1)
    )
  )

  (:action stay_last_seville_1
    :parameters ()
    :precondition (and
      (current_day day_11)
      (at seville)
      (seville_count_1)
    )
    :effect (and
      (occupied day_11 seville)
      (not (current_day day_11))
      (not (seville_count_1))
      (seville_count_2)
    )
  )

  (:action stay_last_seville_2
    :parameters ()
    :precondition (and
      (current_day day_11)
      (at seville)
      (seville_count_2)
    )
    :effect (and
      (occupied day_11 seville)
      (not (current_day day_11))
      (not (seville_count_2))
      (seville_count_3)
    )
  )

  (:action stay_last_seville_3
    :parameters ()
    :precondition (and
      (current_day day_11)
      (at seville)
      (seville_count_3)
    )
    :effect (and
      (occupied day_11 seville)
      (not (current_day day_11))
      (not (seville_count_3))
      (seville_count_4)
    )
  )

  (:action stay_last_seville_4
    :parameters ()
    :precondition (and
      (current_day day_11)
      (at seville)
      (seville_count_4)
    )
    :effect (and
      (occupied day_11 seville)
      (not (current_day day_11))
      (not (seville_count_4))
      (seville_count_5)
    )
  )

  (:action stay_last_manchester_0
    :parameters ()
    :precondition (and
      (current_day day_11)
      (at manchester)
      (manchester_count_0)
    )
    :effect (and
      (occupied day_11 manchester)
      (not (current_day day_11))
      (not (manchester_count_0))
      (manchester_count_1)
    )
  )

  (:action stay_last_manchester_1
    :parameters ()
    :precondition (and
      (current_day day_11)
      (at manchester)
      (manchester_count_1)
    )
    :effect (and
      (occupied day_11 manchester)
      (not (current_day day_11))
      (not (manchester_count_1))
      (manchester_count_2)
    )
  )

  (:action stay_last_manchester_2
    :parameters ()
    :precondition (and
      (current_day day_11)
      (at manchester)
      (manchester_count_2)
    )
    :effect (and
      (occupied day_11 manchester)
      (not (current_day day_11))
      (not (manchester_count_2))
      (manchester_count_3)
    )
  )

  (:action stay_last_manchester_3
    :parameters ()
    :precondition (and
      (current_day day_11)
      (at manchester)
      (manchester_count_3)
    )
    :effect (and
      (occupied day_11 manchester)
      (not (current_day day_11))
      (not (manchester_count_3))
      (manchester_count_4)
    )
  )

  (:action stay_last_manchester_4
    :parameters ()
    :precondition (and
      (current_day day_11)
      (at manchester)
      (manchester_count_4)
    )
    :effect (and
      (occupied day_11 manchester)
      (not (current_day day_11))
      (not (manchester_count_4))
      (manchester_count_5)
    )
  )

  (:action stay_last_stockholm_0
    :parameters ()
    :precondition (and
      (current_day day_11)
      (at stockholm)
      (stockholm_count_0)
    )
    :effect (and
      (occupied day_11 stockholm)
      (not (current_day day_11))
      (not (stockholm_count_0))
      (stockholm_count_1)
    )
  )

  (:action stay_last_stockholm_1
    :parameters ()
    :precondition (and
      (current_day day_11)
      (at stockholm)
      (stockholm_count_1)
    )
    :effect (and
      (occupied day_11 stockholm)
      (not (current_day day_11))
      (not (stockholm_count_1))
      (stockholm_count_2)
    )
  )

  (:action stay_last_stockholm_2
    :parameters ()
    :precondition (and
      (current_day day_11)
      (at stockholm)
      (stockholm_count_2)
    )
    :effect (and
      (occupied day_11 stockholm)
      (not (current_day day_11))
      (not (stockholm_count_2))
      (stockholm_count_3)
    )
  )
)