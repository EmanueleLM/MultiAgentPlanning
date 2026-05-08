(define (domain european_trip_12_days_instance)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (at ?c - city)
    (visited ?c - city ?d - day)
    (direct_flight ?from - city ?to - city)
    (final_day ?d - day)

    (v_count_0)
    (v_count_1)
    (v_count_2)
    (v_count_3)
    (v_count_4)
    (v_count_5)
    (v_count_6)

    (f_count_0)
    (f_count_1)
    (f_count_2)
    (f_count_3)
    (f_count_4)
    (f_count_5)
    (f_count_6)

    (z_count_0)
    (z_count_1)
    (z_count_2)

    (trip_complete)
  )

  (:action stay_venice_v0
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at venice)
      (v_count_0))
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (visited venice ?d_next)
      (not (v_count_0))
      (v_count_1))
  )

  (:action stay_venice_v1
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at venice)
      (v_count_1))
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (visited venice ?d_next)
      (not (v_count_1))
      (v_count_2))
  )

  (:action stay_venice_v2
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at venice)
      (v_count_2))
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (visited venice ?d_next)
      (not (v_count_2))
      (v_count_3))
  )

  (:action stay_venice_v3
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at venice)
      (v_count_3))
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (visited venice ?d_next)
      (not (v_count_3))
      (v_count_4))
  )

  (:action stay_venice_v4
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at venice)
      (v_count_4))
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (visited venice ?d_next)
      (not (v_count_4))
      (v_count_5))
  )

  (:action stay_venice_v5
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at venice)
      (v_count_5))
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (visited venice ?d_next)
      (not (v_count_5))
      (v_count_6))
  )

  (:action stay_florence_f0
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at florence)
      (f_count_0))
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (visited florence ?d_next)
      (not (f_count_0))
      (f_count_1))
  )

  (:action stay_florence_f1
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at florence)
      (f_count_1))
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (visited florence ?d_next)
      (not (f_count_1))
      (f_count_2))
  )

  (:action stay_florence_f2
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at florence)
      (f_count_2))
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (visited florence ?d_next)
      (not (f_count_2))
      (f_count_3))
  )

  (:action stay_florence_f3
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at florence)
      (f_count_3))
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (visited florence ?d_next)
      (not (f_count_3))
      (f_count_4))
  )

  (:action stay_florence_f4
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at florence)
      (f_count_4))
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (visited florence ?d_next)
      (not (f_count_4))
      (f_count_5))
  )

  (:action stay_florence_f5
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at florence)
      (f_count_5))
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (visited florence ?d_next)
      (not (f_count_5))
      (f_count_6))
  )

  (:action stay_zurich_z0
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at zurich)
      (z_count_0))
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (visited zurich ?d_next)
      (not (z_count_0))
      (z_count_1))
  )

  (:action stay_zurich_z1
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at zurich)
      (z_count_1))
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (visited zurich ?d_next)
      (not (z_count_1))
      (z_count_2))
  )

  (:action fly_venice_to_zurich_v0_z0
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at venice)
      (direct_flight venice zurich)
      (v_count_0)
      (z_count_0))
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at venice))
      (at zurich)
      (visited zurich ?d_next)
      (not (z_count_0))
      (z_count_1))
  )

  (:action fly_venice_to_zurich_v0_z1
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at venice)
      (direct_flight venice zurich)
      (v_count_0)
      (z_count_1))
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at venice))
      (at zurich)
      (visited zurich ?d_next)
      (not (z_count_1))
      (z_count_2))
  )

  (:action fly_venice_to_zurich_v1_z0
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at venice)
      (direct_flight venice zurich)
      (v_count_1)
      (z_count_0))
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at venice))
      (at zurich)
      (visited zurich ?d_next)
      (not (z_count_0))
      (z_count_1))
  )

  (:action fly_venice_to_zurich_v1_z1
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at venice)
      (direct_flight venice zurich)
      (v_count_1)
      (z_count_1))
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at venice))
      (at zurich)
      (visited zurich ?d_next)
      (not (z_count_1))
      (z_count_2))
  )

  (:action fly_venice_to_zurich_v2_z0
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at venice)
      (direct_flight venice zurich)
      (v_count_2)
      (z_count_0))
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at venice))
      (at zurich)
      (visited zurich ?d_next)
      (not (z_count_0))
      (z_count_1))
  )

  (:action fly_venice_to_zurich_v2_z1
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at venice)
      (direct_flight venice zurich)
      (v_count_2)
      (z_count_1))
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at venice))
      (at zurich)
      (visited zurich ?d_next)
      (not (z_count_1))
      (z_count_2))
  )

  (:action fly_venice_to_zurich_v3_z0
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at venice)
      (direct_flight venice zurich)
      (v_count_3)
      (z_count_0))
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at venice))
      (at zurich)
      (visited zurich ?d_next)
      (not (z_count_0))
      (z_count_1))
  )

  (:action fly_venice_to_zurich_v3_z1
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at venice)
      (direct_flight venice zurich)
      (v_count_3)
      (z_count_1))
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at venice))
      (at zurich)
      (visited zurich ?d_next)
      (not (z_count_1))
      (z_count_2))
  )

  (:action fly_venice_to_zurich_v4_z0
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at venice)
      (direct_flight venice zurich)
      (v_count_4)
      (z_count_0))
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at venice))
      (at zurich)
      (visited zurich ?d_next)
      (not (z_count_0))
      (z_count_1))
  )

  (:action fly_venice_to_zurich_v4_z1
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at venice)
      (direct_flight venice zurich)
      (v_count_4)
      (z_count_1))
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at venice))
      (at zurich)
      (visited zurich ?d_next)
      (not (z_count_1))
      (z_count_2))
  )

  (:action fly_venice_to_zurich_v5_z0
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at venice)
      (direct_flight venice zurich)
      (v_count_5)
      (z_count_0))
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at venice))
      (at zurich)
      (visited zurich ?d_next)
      (not (z_count_0))
      (z_count_1))
  )

  (:action fly_venice_to_zurich_v5_z1
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at venice)
      (direct_flight venice zurich)
      (v_count_5)
      (z_count_1))
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at venice))
      (at zurich)
      (visited zurich ?d_next)
      (not (z_count_1))
      (z_count_2))
  )

  (:action fly_zurich_to_venice_z0_v0
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at zurich)
      (direct_flight zurich venice)
      (z_count_0)
      (v_count_0))
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at zurich))
      (at venice)
      (visited venice ?d_next)
      (not (v_count_0))
      (v_count_1))
  )

  (:action fly_zurich_to_venice_z0_v1
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at zurich)
      (direct_flight zurich venice)
      (z_count_0)
      (v_count_1))
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at zurich))
      (at venice)
      (visited venice ?d_next)
      (not (v_count_1))
      (v_count_2))
  )

  (:action fly_zurich_to_venice_z0_v2
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at zurich)
      (direct_flight zurich venice)
      (z_count_0)
      (v_count_2))
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at zurich))
      (at venice)
      (visited venice ?d_next)
      (not (v_count_2))
      (v_count_3))
  )

  (:action fly_zurich_to_venice_z0_v3
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at zurich)
      (direct_flight zurich venice)
      (z_count_0)
      (v_count_3))
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at zurich))
      (at venice)
      (visited venice ?d_next)
      (not (v_count_3))
      (v_count_4))
  )

  (:action fly_zurich_to_venice_z0_v4
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at zurich)
      (direct_flight zurich venice)
      (z_count_0)
      (v_count_4))
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at zurich))
      (at venice)
      (visited venice ?d_next)
      (not (v_count_4))
      (v_count_5))
  )

  (:action fly_zurich_to_venice_z0_v5
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at zurich)
      (direct_flight zurich venice)
      (z_count_0)
      (v_count_5))
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at zurich))
      (at venice)
      (visited venice ?d_next)
      (not (v_count_5))
      (v_count_6))
  )

  (:action fly_zurich_to_venice_z1_v0
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at zurich)
      (direct_flight zurich venice)
      (z_count_1)
      (v_count_0))
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at zurich))
      (at venice)
      (visited venice ?d_next)
      (not (v_count_0))
      (v_count_1))
  )

  (:action fly_zurich_to_venice_z1_v1
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at zurich)
      (direct_flight zurich venice)
      (z_count_1)
      (v_count_1))
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at zurich))
      (at venice)
      (visited venice ?d_next)
      (not (v_count_1))
      (v_count_2))
  )

  (:action fly_zurich_to_venice_z1_v2
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at zurich)
      (direct_flight zurich venice)
      (z_count_1)
      (v_count_2))
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at zurich))
      (at venice)
      (visited venice ?d_next)
      (not (v_count_2))
      (v_count_3))
  )

  (:action fly_zurich_to_venice_z1_v3
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at zurich)
      (direct_flight zurich venice)
      (z_count_1)
      (v_count_3))
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at zurich))
      (at venice)
      (visited venice ?d_next)
      (not (v_count_3))
      (v_count_4))
  )

  (:action fly_zurich_to_venice_z1_v4
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at zurich)
      (direct_flight zurich venice)
      (z_count_1)
      (v_count_4))
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at zurich))
      (at venice)
      (visited venice ?d_next)
      (not (v_count_4))
      (v_count_5))
  )

  (:action fly_zurich_to_venice_z1_v5
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at zurich)
      (direct_flight zurich venice)
      (z_count_1)
      (v_count_5))
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at zurich))
      (at venice)
      (visited venice ?d_next)
      (not (v_count_5))
      (v_count_6))
  )

  (:action fly_zurich_to_florence_z0_f0
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at zurich)
      (direct_flight zurich florence)
      (z_count_0)
      (f_count_0))
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at zurich))
      (at florence)
      (visited florence ?d_next)
      (not (f_count_0))
      (f_count_1))
  )

  (:action fly_zurich_to_florence_z0_f1
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at zurich)
      (direct_flight zurich florence)
      (z_count_0)
      (f_count_1))
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at zurich))
      (at florence)
      (visited florence ?d_next)
      (not (f_count_1))
      (f_count_2))
  )

  (:action fly_zurich_to_florence_z0_f2
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at zurich)
      (direct_flight zurich florence)
      (z_count_0)
      (f_count_2))
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at zurich))
      (at florence)
      (visited florence ?d_next)
      (not (f_count_2))
      (f_count_3))
  )

  (:action fly_zurich_to_florence_z0_f3
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at zurich)
      (direct_flight zurich florence)
      (z_count_0)
      (f_count_3))
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at zurich))
      (at florence)
      (visited florence ?d_next)
      (not (f_count_3))
      (f_count_4))
  )

  (:action fly_zurich_to_florence_z0_f4
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at zurich)
      (direct_flight zurich florence)
      (z_count_0)
      (f_count_4))
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at zurich))
      (at florence)
      (visited florence ?d_next)
      (not (f_count_4))
      (f_count_5))
  )

  (:action fly_zurich_to_florence_z0_f5
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at zurich)
      (direct_flight zurich florence)
      (z_count_0)
      (f_count_5))
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at zurich))
      (at florence)
      (visited florence ?d_next)
      (not (f_count_5))
      (f_count_6))
  )

  (:action fly_zurich_to_florence_z1_f0
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at zurich)
      (direct_flight zurich florence)
      (z_count_1)
      (f_count_0))
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at zurich))
      (at florence)
      (visited florence ?d_next)
      (not (f_count_0))
      (f_count_1))
  )

  (:action fly_zurich_to_florence_z1_f1
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at zurich)
      (direct_flight zurich florence)
      (z_count_1)
      (f_count_1))
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at zurich))
      (at florence)
      (visited florence ?d_next)
      (not (f_count_1))
      (f_count_2))
  )

  (:action fly_zurich_to_florence_z1_f2
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at zurich)
      (direct_flight zurich florence)
      (z_count_1)
      (f_count_2))
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at zurich))
      (at florence)
      (visited florence ?d_next)
      (not (f_count_2))
      (f_count_3))
  )

  (:action fly_zurich_to_florence_z1_f3
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at zurich)
      (direct_flight zurich florence)
      (z_count_1)
      (f_count_3))
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at zurich))
      (at florence)
      (visited florence ?d_next)
      (not (f_count_3))
      (f_count_4))
  )

  (:action fly_zurich_to_florence_z1_f4
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at zurich)
      (direct_flight zurich florence)
      (z_count_1)
      (f_count_4))
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at zurich))
      (at florence)
      (visited florence ?d_next)
      (not (f_count_4))
      (f_count_5))
  )

  (:action fly_zurich_to_florence_z1_f5
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at zurich)
      (direct_flight zurich florence)
      (z_count_1)
      (f_count_5))
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at zurich))
      (at florence)
      (visited florence ?d_next)
      (not (f_count_5))
      (f_count_6))
  )

  (:action complete_trip
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (final_day ?d)
      (v_count_6)
      (f_count_6)
      (z_count_2))
    :effect (and
      (trip_complete))
  )
)