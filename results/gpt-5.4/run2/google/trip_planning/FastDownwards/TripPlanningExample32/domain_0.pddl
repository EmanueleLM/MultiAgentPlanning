(define (domain european_trip_10_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city day count_riga count_paris count_reykjavik
  )

  (:predicates
    (next_day ?d1 - day ?d2 - day)
    (direct_flight ?from - city ?to - city)

    (ready_to_start)
    (started)

    (at ?c - city ?d - day)

    (riga_count_0)
    (riga_count_1)
    (riga_count_2)
    (riga_count_3)

    (paris_count_0)
    (paris_count_1)
    (paris_count_2)
    (paris_count_3)
    (paris_count_4)

    (reykjavik_count_0)
    (reykjavik_count_1)
    (reykjavik_count_2)
    (reykjavik_count_3)
    (reykjavik_count_4)
    (reykjavik_count_5)
  )

  (:action start_in_riga
    :parameters ()
    :precondition (and
      (ready_to_start)
      (not (started))
      (riga_count_0)
      (paris_count_0)
      (reykjavik_count_0)
    )
    :effect (and
      (started)
      (not (ready_to_start))
      (at riga day_1)
      (not (riga_count_0))
      (riga_count_1)
    )
  )

  (:action start_in_paris
    :parameters ()
    :precondition (and
      (ready_to_start)
      (not (started))
      (riga_count_0)
      (paris_count_0)
      (reykjavik_count_0)
    )
    :effect (and
      (started)
      (not (ready_to_start))
      (at paris day_1)
      (not (paris_count_0))
      (paris_count_1)
    )
  )

  (:action start_in_reykjavik
    :parameters ()
    :precondition (and
      (ready_to_start)
      (not (started))
      (riga_count_0)
      (paris_count_0)
      (reykjavik_count_0)
    )
    :effect (and
      (started)
      (not (ready_to_start))
      (at reykjavik day_1)
      (not (reykjavik_count_0))
      (reykjavik_count_1)
    )
  )

  (:action stay_riga_r0
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at riga ?d1)
      (next_day ?d1 ?d2)
      (riga_count_0)
    )
    :effect (and
      (at riga ?d2)
      (not (riga_count_0))
      (riga_count_1)
    )
  )

  (:action stay_riga_r1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at riga ?d1)
      (next_day ?d1 ?d2)
      (riga_count_1)
    )
    :effect (and
      (at riga ?d2)
      (not (riga_count_1))
      (riga_count_2)
    )
  )

  (:action stay_riga_r2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at riga ?d1)
      (next_day ?d1 ?d2)
      (riga_count_2)
    )
    :effect (and
      (at riga ?d2)
      (not (riga_count_2))
      (riga_count_3)
    )
  )

  (:action stay_riga_r3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at riga ?d1)
      (next_day ?d1 ?d2)
      (riga_count_3)
    )
    :effect (and
      (at riga ?d2)
    )
  )

  (:action stay_paris_p0
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at paris ?d1)
      (next_day ?d1 ?d2)
      (paris_count_0)
    )
    :effect (and
      (at paris ?d2)
      (not (paris_count_0))
      (paris_count_1)
    )
  )

  (:action stay_paris_p1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at paris ?d1)
      (next_day ?d1 ?d2)
      (paris_count_1)
    )
    :effect (and
      (at paris ?d2)
      (not (paris_count_1))
      (paris_count_2)
    )
  )

  (:action stay_paris_p2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at paris ?d1)
      (next_day ?d1 ?d2)
      (paris_count_2)
    )
    :effect (and
      (at paris ?d2)
      (not (paris_count_2))
      (paris_count_3)
    )
  )

  (:action stay_paris_p3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at paris ?d1)
      (next_day ?d1 ?d2)
      (paris_count_3)
    )
    :effect (and
      (at paris ?d2)
      (not (paris_count_3))
      (paris_count_4)
    )
  )

  (:action stay_paris_p4
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at paris ?d1)
      (next_day ?d1 ?d2)
      (paris_count_4)
    )
    :effect (and
      (at paris ?d2)
    )
  )

  (:action stay_reykjavik_k0
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at reykjavik ?d1)
      (next_day ?d1 ?d2)
      (reykjavik_count_0)
    )
    :effect (and
      (at reykjavik ?d2)
      (not (reykjavik_count_0))
      (reykjavik_count_1)
    )
  )

  (:action stay_reykjavik_k1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at reykjavik ?d1)
      (next_day ?d1 ?d2)
      (reykjavik_count_1)
    )
    :effect (and
      (at reykjavik ?d2)
      (not (reykjavik_count_1))
      (reykjavik_count_2)
    )
  )

  (:action stay_reykjavik_k2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at reykjavik ?d1)
      (next_day ?d1 ?d2)
      (reykjavik_count_2)
    )
    :effect (and
      (at reykjavik ?d2)
      (not (reykjavik_count_2))
      (reykjavik_count_3)
    )
  )

  (:action stay_reykjavik_k3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at reykjavik ?d1)
      (next_day ?d1 ?d2)
      (reykjavik_count_3)
    )
    :effect (and
      (at reykjavik ?d2)
      (not (reykjavik_count_3))
      (reykjavik_count_4)
    )
  )

  (:action stay_reykjavik_k4
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at reykjavik ?d1)
      (next_day ?d1 ?d2)
      (reykjavik_count_4)
    )
    :effect (and
      (at reykjavik ?d2)
      (not (reykjavik_count_4))
      (reykjavik_count_5)
    )
  )

  (:action stay_reykjavik_k5
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at reykjavik ?d1)
      (next_day ?d1 ?d2)
      (reykjavik_count_5)
    )
    :effect (and
      (at reykjavik ?d2)
    )
  )

  (:action fly_riga_to_paris_r0_p0
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at riga ?d1)
      (next_day ?d1 ?d2)
      (direct_flight riga paris)
      (riga_count_0)
      (paris_count_0)
    )
    :effect (and
      (at paris ?d2)
      (not (paris_count_0))
      (paris_count_1)
    )
  )

  (:action fly_riga_to_paris_r0_p1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at riga ?d1)
      (next_day ?d1 ?d2)
      (direct_flight riga paris)
      (riga_count_0)
      (paris_count_1)
    )
    :effect (and
      (at paris ?d2)
      (not (paris_count_1))
      (paris_count_2)
    )
  )

  (:action fly_riga_to_paris_r0_p2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at riga ?d1)
      (next_day ?d1 ?d2)
      (direct_flight riga paris)
      (riga_count_0)
      (paris_count_2)
    )
    :effect (and
      (at paris ?d2)
      (not (paris_count_2))
      (paris_count_3)
    )
  )

  (:action fly_riga_to_paris_r0_p3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at riga ?d1)
      (next_day ?d1 ?d2)
      (direct_flight riga paris)
      (riga_count_0)
      (paris_count_3)
    )
    :effect (and
      (at paris ?d2)
      (not (paris_count_3))
      (paris_count_4)
    )
  )

  (:action fly_riga_to_paris_r0_p4
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at riga ?d1)
      (next_day ?d1 ?d2)
      (direct_flight riga paris)
      (riga_count_0)
      (paris_count_4)
    )
    :effect (and
      (at paris ?d2)
    )
  )

  (:action fly_riga_to_paris_r1_p0
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at riga ?d1)
      (next_day ?d1 ?d2)
      (direct_flight riga paris)
      (riga_count_1)
      (paris_count_0)
    )
    :effect (and
      (at paris ?d2)
      (not (paris_count_0))
      (paris_count_1)
    )
  )

  (:action fly_riga_to_paris_r1_p1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at riga ?d1)
      (next_day ?d1 ?d2)
      (direct_flight riga paris)
      (riga_count_1)
      (paris_count_1)
    )
    :effect (and
      (at paris ?d2)
      (not (paris_count_1))
      (paris_count_2)
    )
  )

  (:action fly_riga_to_paris_r1_p2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at riga ?d1)
      (next_day ?d1 ?d2)
      (direct_flight riga paris)
      (riga_count_1)
      (paris_count_2)
    )
    :effect (and
      (at paris ?d2)
      (not (paris_count_2))
      (paris_count_3)
    )
  )

  (:action fly_riga_to_paris_r1_p3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at riga ?d1)
      (next_day ?d1 ?d2)
      (direct_flight riga paris)
      (riga_count_1)
      (paris_count_3)
    )
    :effect (and
      (at paris ?d2)
      (not (paris_count_3))
      (paris_count_4)
    )
  )

  (:action fly_riga_to_paris_r1_p4
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at riga ?d1)
      (next_day ?d1 ?d2)
      (direct_flight riga paris)
      (riga_count_1)
      (paris_count_4)
    )
    :effect (and
      (at paris ?d2)
    )
  )

  (:action fly_riga_to_paris_r2_p0
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at riga ?d1)
      (next_day ?d1 ?d2)
      (direct_flight riga paris)
      (riga_count_2)
      (paris_count_0)
    )
    :effect (and
      (at paris ?d2)
      (not (paris_count_0))
      (paris_count_1)
    )
  )

  (:action fly_riga_to_paris_r2_p1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at riga ?d1)
      (next_day ?d1 ?d2)
      (direct_flight riga paris)
      (riga_count_2)
      (paris_count_1)
    )
    :effect (and
      (at paris ?d2)
      (not (paris_count_1))
      (paris_count_2)
    )
  )

  (:action fly_riga_to_paris_r2_p2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at riga ?d1)
      (next_day ?d1 ?d2)
      (direct_flight riga paris)
      (riga_count_2)
      (paris_count_2)
    )
    :effect (and
      (at paris ?d2)
      (not (paris_count_2))
      (paris_count_3)
    )
  )

  (:action fly_riga_to_paris_r2_p3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at riga ?d1)
      (next_day ?d1 ?d2)
      (direct_flight riga paris)
      (riga_count_2)
      (paris_count_3)
    )
    :effect (and
      (at paris ?d2)
      (not (paris_count_3))
      (paris_count_4)
    )
  )

  (:action fly_riga_to_paris_r2_p4
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at riga ?d1)
      (next_day ?d1 ?d2)
      (direct_flight riga paris)
      (riga_count_2)
      (paris_count_4)
    )
    :effect (and
      (at paris ?d2)
    )
  )

  (:action fly_riga_to_paris_r3_p0
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at riga ?d1)
      (next_day ?d1 ?d2)
      (direct_flight riga paris)
      (riga_count_3)
      (paris_count_0)
    )
    :effect (and
      (at paris ?d2)
      (not (paris_count_0))
      (paris_count_1)
    )
  )

  (:action fly_riga_to_paris_r3_p1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at riga ?d1)
      (next_day ?d1 ?d2)
      (direct_flight riga paris)
      (riga_count_3)
      (paris_count_1)
    )
    :effect (and
      (at paris ?d2)
      (not (paris_count_1))
      (paris_count_2)
    )
  )

  (:action fly_riga_to_paris_r3_p2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at riga ?d1)
      (next_day ?d1 ?d2)
      (direct_flight riga paris)
      (riga_count_3)
      (paris_count_2)
    )
    :effect (and
      (at paris ?d2)
      (not (paris_count_2))
      (paris_count_3)
    )
  )

  (:action fly_riga_to_paris_r3_p3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at riga ?d1)
      (next_day ?d1 ?d2)
      (direct_flight riga paris)
      (riga_count_3)
      (paris_count_3)
    )
    :effect (and
      (at paris ?d2)
      (not (paris_count_3))
      (paris_count_4)
    )
  )

  (:action fly_riga_to_paris_r3_p4
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at riga ?d1)
      (next_day ?d1 ?d2)
      (direct_flight riga paris)
      (riga_count_3)
      (paris_count_4)
    )
    :effect (and
      (at paris ?d2)
    )
  )

  (:action fly_paris_to_riga_p0_r0
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at paris ?d1)
      (next_day ?d1 ?d2)
      (direct_flight paris riga)
      (paris_count_0)
      (riga_count_0)
    )
    :effect (and
      (at riga ?d2)
      (not (riga_count_0))
      (riga_count_1)
    )
  )

  (:action fly_paris_to_riga_p0_r1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at paris ?d1)
      (next_day ?d1 ?d2)
      (direct_flight paris riga)
      (paris_count_0)
      (riga_count_1)
    )
    :effect (and
      (at riga ?d2)
      (not (riga_count_1))
      (riga_count_2)
    )
  )

  (:action fly_paris_to_riga_p0_r2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at paris ?d1)
      (next_day ?d1 ?d2)
      (direct_flight paris riga)
      (paris_count_0)
      (riga_count_2)
    )
    :effect (and
      (at riga ?d2)
      (not (riga_count_2))
      (riga_count_3)
    )
  )

  (:action fly_paris_to_riga_p0_r3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at paris ?d1)
      (next_day ?d1 ?d2)
      (direct_flight paris riga)
      (paris_count_0)
      (riga_count_3)
    )
    :effect (and
      (at riga ?d2)
    )
  )

  (:action fly_paris_to_riga_p1_r0
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at paris ?d1)
      (next_day ?d1 ?d2)
      (direct_flight paris riga)
      (paris_count_1)
      (riga_count_0)
    )
    :effect (and
      (at riga ?d2)
      (not (riga_count_0))
      (riga_count_1)
    )
  )

  (:action fly_paris_to_riga_p1_r1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at paris ?d1)
      (next_day ?d1 ?d2)
      (direct_flight paris riga)
      (paris_count_1)
      (riga_count_1)
    )
    :effect (and
      (at riga ?d2)
      (not (riga_count_1))
      (riga_count_2)
    )
  )

  (:action fly_paris_to_riga_p1_r2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at paris ?d1)
      (next_day ?d1 ?d2)
      (direct_flight paris riga)
      (paris_count_1)
      (riga_count_2)
    )
    :effect (and
      (at riga ?d2)
      (not (riga_count_2))
      (riga_count_3)
    )
  )

  (:action fly_paris_to_riga_p1_r3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at paris ?d1)
      (next_day ?d1 ?d2)
      (direct_flight paris riga)
      (paris_count_1)
      (riga_count_3)
    )
    :effect (and
      (at riga ?d2)
    )
  )

  (:action fly_paris_to_riga_p2_r0
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at paris ?d1)
      (next_day ?d1 ?d2)
      (direct_flight paris riga)
      (paris_count_2)
      (riga_count_0)
    )
    :effect (and
      (at riga ?d2)
      (not (riga_count_0))
      (riga_count_1)
    )
  )

  (:action fly_paris_to_riga_p2_r1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at paris ?d1)
      (next_day ?d1 ?d2)
      (direct_flight paris riga)
      (paris_count_2)
      (riga_count_1)
    )
    :effect (and
      (at riga ?d2)
      (not (riga_count_1))
      (riga_count_2)
    )
  )

  (:action fly_paris_to_riga_p2_r2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at paris ?d1)
      (next_day ?d1 ?d2)
      (direct_flight paris riga)
      (paris_count_2)
      (riga_count_2)
    )
    :effect (and
      (at riga ?d2)
      (not (riga_count_2))
      (riga_count_3)
    )
  )

  (:action fly_paris_to_riga_p2_r3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at paris ?d1)
      (next_day ?d1 ?d2)
      (direct_flight paris riga)
      (paris_count_2)
      (riga_count_3)
    )
    :effect (and
      (at riga ?d2)
    )
  )

  (:action fly_paris_to_riga_p3_r0
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at paris ?d1)
      (next_day ?d1 ?d2)
      (direct_flight paris riga)
      (paris_count_3)
      (riga_count_0)
    )
    :effect (and
      (at riga ?d2)
      (not (riga_count_0))
      (riga_count_1)
    )
  )

  (:action fly_paris_to_riga_p3_r1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at paris ?d1)
      (next_day ?d1 ?d2)
      (direct_flight paris riga)
      (paris_count_3)
      (riga_count_1)
    )
    :effect (and
      (at riga ?d2)
      (not (riga_count_1))
      (riga_count_2)
    )
  )

  (:action fly_paris_to_riga_p3_r2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at paris ?d1)
      (next_day ?d1 ?d2)
      (direct_flight paris riga)
      (paris_count_3)
      (riga_count_2)
    )
    :effect (and
      (at riga ?d2)
      (not (riga_count_2))
      (riga_count_3)
    )
  )

  (:action fly_paris_to_riga_p3_r3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at paris ?d1)
      (next_day ?d1 ?d2)
      (direct_flight paris riga)
      (paris_count_3)
      (riga_count_3)
    )
    :effect (and
      (at riga ?d2)
    )
  )

  (:action fly_paris_to_riga_p4_r0
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at paris ?d1)
      (next_day ?d1 ?d2)
      (direct_flight paris riga)
      (paris_count_4)
      (riga_count_0)
    )
    :effect (and
      (at riga ?d2)
      (not (riga_count_0))
      (riga_count_1)
    )
  )

  (:action fly_paris_to_riga_p4_r1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at paris ?d1)
      (next_day ?d1 ?d2)
      (direct_flight paris riga)
      (paris_count_4)
      (riga_count_1)
    )
    :effect (and
      (at riga ?d2)
      (not (riga_count_1))
      (riga_count_2)
    )
  )

  (:action fly_paris_to_riga_p4_r2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at paris ?d1)
      (next_day ?d1 ?d2)
      (direct_flight paris riga)
      (paris_count_4)
      (riga_count_2)
    )
    :effect (and
      (at riga ?d2)
      (not (riga_count_2))
      (riga_count_3)
    )
  )

  (:action fly_paris_to_riga_p4_r3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at paris ?d1)
      (next_day ?d1 ?d2)
      (direct_flight paris riga)
      (paris_count_4)
      (riga_count_3)
    )
    :effect (and
      (at riga ?d2)
    )
  )

  (:action fly_paris_to_reykjavik_p0_k0
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at paris ?d1)
      (next_day ?d1 ?d2)
      (direct_flight paris reykjavik)
      (paris_count_0)
      (reykjavik_count_0)
    )
    :effect (and
      (at reykjavik ?d2)
      (not (reykjavik_count_0))
      (reykjavik_count_1)
    )
  )

  (:action fly_paris_to_reykjavik_p0_k1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at paris ?d1)
      (next_day ?d1 ?d2)
      (direct_flight paris reykjavik)
      (paris_count_0)
      (reykjavik_count_1)
    )
    :effect (and
      (at reykjavik ?d2)
      (not (reykjavik_count_1))
      (reykjavik_count_2)
    )
  )

  (:action fly_paris_to_reykjavik_p0_k2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at paris ?d1)
      (next_day ?d1 ?d2)
      (direct_flight paris reykjavik)
      (paris_count_0)
      (reykjavik_count_2)
    )
    :effect (and
      (at reykjavik ?d2)
      (not (reykjavik_count_2))
      (reykjavik_count_3)
    )
  )

  (:action fly_paris_to_reykjavik_p0_k3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at paris ?d1)
      (next_day ?d1 ?d2)
      (direct_flight paris reykjavik)
      (paris_count_0)
      (reykjavik_count_3)
    )
    :effect (and
      (at reykjavik ?d2)
      (not (reykjavik_count_3))
      (reykjavik_count_4)
    )
  )

  (:action fly_paris_to_reykjavik_p0_k4
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at paris ?d1)
      (next_day ?d1 ?d2)
      (direct_flight paris reykjavik)
      (paris_count_0)
      (reykjavik_count_4)
    )
    :effect (and
      (at reykjavik ?d2)
      (not (reykjavik_count_4))
      (reykjavik_count_5)
    )
  )

  (:action fly_paris_to_reykjavik_p0_k5
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at paris ?d1)
      (next_day ?d1 ?d2)
      (direct_flight paris reykjavik)
      (paris_count_0)
      (reykjavik_count_5)
    )
    :effect (and
      (at reykjavik ?d2)
    )
  )

  (:action fly_paris_to_reykjavik_p1_k0
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at paris ?d1)
      (next_day ?d1 ?d2)
      (direct_flight paris reykjavik)
      (paris_count_1)
      (reykjavik_count_0)
    )
    :effect (and
      (at reykjavik ?d2)
      (not (reykjavik_count_0))
      (reykjavik_count_1)
    )
  )

  (:action fly_paris_to_reykjavik_p1_k1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at paris ?d1)
      (next_day ?d1 ?d2)
      (direct_flight paris reykjavik)
      (paris_count_1)
      (reykjavik_count_1)
    )
    :effect (and
      (at reykjavik ?d2)
      (not (reykjavik_count_1))
      (reykjavik_count_2)
    )
  )

  (:action fly_paris_to_reykjavik_p1_k2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at paris ?d1)
      (next_day ?d1 ?d2)
      (direct_flight paris reykjavik)
      (paris_count_1)
      (reykjavik_count_2)
    )
    :effect (and
      (at reykjavik ?d2)
      (not (reykjavik_count_2))
      (reykjavik_count_3)
    )
  )

  (:action fly_paris_to_reykjavik_p1_k3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at paris ?d1)
      (next_day ?d1 ?d2)
      (direct_flight paris reykjavik)
      (paris_count_1)
      (reykjavik_count_3)
    )
    :effect (and
      (at reykjavik ?d2)
      (not (reykjavik_count_3))
      (reykjavik_count_4)
    )
  )

  (:action fly_paris_to_reykjavik_p1_k4
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at paris ?d1)
      (next_day ?d1 ?d2)
      (direct_flight paris reykjavik)
      (paris_count_1)
      (reykjavik_count_4)
    )
    :effect (and
      (at reykjavik ?d2)
      (not (reykjavik_count_4))
      (reykjavik_count_5)
    )
  )

  (:action fly_paris_to_reykjavik_p1_k5
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at paris ?d1)
      (next_day ?d1 ?d2)
      (direct_flight paris reykjavik)
      (paris_count_1)
      (reykjavik_count_5)
    )
    :effect (and
      (at reykjavik ?d2)
    )
  )

  (:action fly_paris_to_reykjavik_p2_k0
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at paris ?d1)
      (next_day ?d1 ?d2)
      (direct_flight paris reykjavik)
      (paris_count_2)
      (reykjavik_count_0)
    )
    :effect (and
      (at reykjavik ?d2)
      (not (reykjavik_count_0))
      (reykjavik_count_1)
    )
  )

  (:action fly_paris_to_reykjavik_p2_k1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at paris ?d1)
      (next_day ?d1 ?d2)
      (direct_flight paris reykjavik)
      (paris_count_2)
      (reykjavik_count_1)
    )
    :effect (and
      (at reykjavik ?d2)
      (not (reykjavik_count_1))
      (reykjavik_count_2)
    )
  )

  (:action fly_paris_to_reykjavik_p2_k2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at paris ?d1)
      (next_day ?d1 ?d2)
      (direct_flight paris reykjavik)
      (paris_count_2)
      (reykjavik_count_2)
    )
    :effect (and
      (at reykjavik ?d2)
      (not (reykjavik_count_2))
      (reykjavik_count_3)
    )
  )

  (:action fly_paris_to_reykjavik_p2_k3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at paris ?d1)
      (next_day ?d1 ?d2)
      (direct_flight paris reykjavik)
      (paris_count_2)
      (reykjavik_count_3)
    )
    :effect (and
      (at reykjavik ?d2)
      (not (reykjavik_count_3))
      (reykjavik_count_4)
    )
  )

  (:action fly_paris_to_reykjavik_p2_k4
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at paris ?d1)
      (next_day ?d1 ?d2)
      (direct_flight paris reykjavik)
      (paris_count_2)
      (reykjavik_count_4)
    )
    :effect (and
      (at reykjavik ?d2)
      (not (reykjavik_count_4))
      (reykjavik_count_5)
    )
  )

  (:action fly_paris_to_reykjavik_p2_k5
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at paris ?d1)
      (next_day ?d1 ?d2)
      (direct_flight paris reykjavik)
      (paris_count_2)
      (reykjavik_count_5)
    )
    :effect (and
      (at reykjavik ?d2)
    )
  )

  (:action fly_paris_to_reykjavik_p3_k0
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at paris ?d1)
      (next_day ?d1 ?d2)
      (direct_flight paris reykjavik)
      (paris_count_3)
      (reykjavik_count_0)
    )
    :effect (and
      (at reykjavik ?d2)
      (not (reykjavik_count_0))
      (reykjavik_count_1)
    )
  )

  (:action fly_paris_to_reykjavik_p3_k1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at paris ?d1)
      (next_day ?d1 ?d2)
      (direct_flight paris reykjavik)
      (paris_count_3)
      (reykjavik_count_1)
    )
    :effect (and
      (at reykjavik ?d2)
      (not (reykjavik_count_1))
      (reykjavik_count_2)
    )
  )

  (:action fly_paris_to_reykjavik_p3_k2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at paris ?d1)
      (next_day ?d1 ?d2)
      (direct_flight paris reykjavik)
      (paris_count_3)
      (reykjavik_count_2)
    )
    :effect (and
      (at reykjavik ?d2)
      (not (reykjavik_count_2))
      (reykjavik_count_3)
    )
  )

  (:action fly_paris_to_reykjavik_p3_k3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at paris ?d1)
      (next_day ?d1 ?d2)
      (direct_flight paris reykjavik)
      (paris_count_3)
      (reykjavik_count_3)
    )
    :effect (and
      (at reykjavik ?d2)
      (not (reykjavik_count_3))
      (reykjavik_count_4)
    )
  )

  (:action fly_paris_to_reykjavik_p3_k4
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at paris ?d1)
      (next_day ?d1 ?d2)
      (direct_flight paris reykjavik)
      (paris_count_3)
      (reykjavik_count_4)
    )
    :effect (and
      (at reykjavik ?d2)
      (not (reykjavik_count_4))
      (reykjavik_count_5)
    )
  )

  (:action fly_paris_to_reykjavik_p3_k5
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at paris ?d1)
      (next_day ?d1 ?d2)
      (direct_flight paris reykjavik)
      (paris_count_3)
      (reykjavik_count_5)
    )
    :effect (and
      (at reykjavik ?d2)
    )
  )

  (:action fly_paris_to_reykjavik_p4_k0
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at paris ?d1)
      (next_day ?d1 ?d2)
      (direct_flight paris reykjavik)
      (paris_count_4)
      (reykjavik_count_0)
    )
    :effect (and
      (at reykjavik ?d2)
      (not (reykjavik_count_0))
      (reykjavik_count_1)
    )
  )

  (:action fly_paris_to_reykjavik_p4_k1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at paris ?d1)
      (next_day ?d1 ?d2)
      (direct_flight paris reykjavik)
      (paris_count_4)
      (reykjavik_count_1)
    )
    :effect (and
      (at reykjavik ?d2)
      (not (reykjavik_count_1))
      (reykjavik_count_2)
    )
  )

  (:action fly_paris_to_reykjavik_p4_k2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at paris ?d1)
      (next_day ?d1 ?d2)
      (direct_flight paris reykjavik)
      (paris_count_4)
      (reykjavik_count_2)
    )
    :effect (and
      (at reykjavik ?d2)
      (not (reykjavik_count_2))
      (reykjavik_count_3)
    )
  )

  (:action fly_paris_to_reykjavik_p4_k3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at paris ?d1)
      (next_day ?d1 ?d2)
      (direct_flight paris reykjavik)
      (paris_count_4)
      (reykjavik_count_3)
    )
    :effect (and
      (at reykjavik ?d2)
      (not (reykjavik_count_3))
      (reykjavik_count_4)
    )
  )

  (:action fly_paris_to_reykjavik_p4_k4
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at paris ?d1)
      (next_day ?d1 ?d2)
      (direct_flight paris reykjavik)
      (paris_count_4)
      (reykjavik_count_4)
    )
    :effect (and
      (at reykjavik ?d2)
      (not (reykjavik_count_4))
      (reykjavik_count_5)
    )
  )

  (:action fly_paris_to_reykjavik_p4_k5
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at paris ?d1)
      (next_day ?d1 ?d2)
      (direct_flight paris reykjavik)
      (paris_count_4)
      (reykjavik_count_5)
    )
    :effect (and
      (at reykjavik ?d2)
    )
  )

  (:action fly_reykjavik_to_paris_k0_p0
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at reykjavik ?d1)
      (next_day ?d1 ?d2)
      (direct_flight reykjavik paris)
      (reykjavik_count_0)
      (paris_count_0)
    )
    :effect (and
      (at paris ?d2)
      (not (paris_count_0))
      (paris_count_1)
    )
  )

  (:action fly_reykjavik_to_paris_k0_p1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at reykjavik ?d1)
      (next_day ?d1 ?d2)
      (direct_flight reykjavik paris)
      (reykjavik_count_0)
      (paris_count_1)
    )
    :effect (and
      (at paris ?d2)
      (not (paris_count_1))
      (paris_count_2)
    )
  )

  (:action fly_reykjavik_to_paris_k0_p2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at reykjavik ?d1)
      (next_day ?d1 ?d2)
      (direct_flight reykjavik paris)
      (reykjavik_count_0)
      (paris_count_2)
    )
    :effect (and
      (at paris ?d2)
      (not (paris_count_2))
      (paris_count_3)
    )
  )

  (:action fly_reykjavik_to_paris_k0_p3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at reykjavik ?d1)
      (next_day ?d1 ?d2)
      (direct_flight reykjavik paris)
      (reykjavik_count_0)
      (paris_count_3)
    )
    :effect (and
      (at paris ?d2)
      (not (paris_count_3))
      (paris_count_4)
    )
  )

  (:action fly_reykjavik_to_paris_k0_p4
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at reykjavik ?d1)
      (next_day ?d1 ?d2)
      (direct_flight reykjavik paris)
      (reykjavik_count_0)
      (paris_count_4)
    )
    :effect (and
      (at paris ?d2)
    )
  )

  (:action fly_reykjavik_to_paris_k1_p0
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at reykjavik ?d1)
      (next_day ?d1 ?d2)
      (direct_flight reykjavik paris)
      (reykjavik_count_1)
      (paris_count_0)
    )
    :effect (and
      (at paris ?d2)
      (not (paris_count_0))
      (paris_count_1)
    )
  )

  (:action fly_reykjavik_to_paris_k1_p1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at reykjavik ?d1)
      (next_day ?d1 ?d2)
      (direct_flight reykjavik paris)
      (reykjavik_count_1)
      (paris_count_1)
    )
    :effect (and
      (at paris ?d2)
      (not (paris_count_1))
      (paris_count_2)
    )
  )

  (:action fly_reykjavik_to_paris_k1_p2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at reykjavik ?d1)
      (next_day ?d1 ?d2)
      (direct_flight reykjavik paris)
      (reykjavik_count_1)
      (paris_count_2)
    )
    :effect (and
      (at paris ?d2)
      (not (paris_count_2))
      (paris_count_3)
    )
  )

  (:action fly_reykjavik_to_paris_k1_p3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at reykjavik ?d1)
      (next_day ?d1 ?d2)
      (direct_flight reykjavik paris)
      (reykjavik_count_1)
      (paris_count_3)
    )
    :effect (and
      (at paris ?d2)
      (not (paris_count_3))
      (paris_count_4)
    )
  )

  (:action fly_reykjavik_to_paris_k1_p4
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at reykjavik ?d1)
      (next_day ?d1 ?d2)
      (direct_flight reykjavik paris)
      (reykjavik_count_1)
      (paris_count_4)
    )
    :effect (and
      (at paris ?d2)
    )
  )

  (:action fly_reykjavik_to_paris_k2_p0
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at reykjavik ?d1)
      (next_day ?d1 ?d2)
      (direct_flight reykjavik paris)
      (reykjavik_count_2)
      (paris_count_0)
    )
    :effect (and
      (at paris ?d2)
      (not (paris_count_0))
      (paris_count_1)
    )
  )

  (:action fly_reykjavik_to_paris_k2_p1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at reykjavik ?d1)
      (next_day ?d1 ?d2)
      (direct_flight reykjavik paris)
      (reykjavik_count_2)
      (paris_count_1)
    )
    :effect (and
      (at paris ?d2)
      (not (paris_count_1))
      (paris_count_2)
    )
  )

  (:action fly_reykjavik_to_paris_k2_p2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at reykjavik ?d1)
      (next_day ?d1 ?d2)
      (direct_flight reykjavik paris)
      (reykjavik_count_2)
      (paris_count_2)
    )
    :effect (and
      (at paris ?d2)
      (not (paris_count_2))
      (paris_count_3)
    )
  )

  (:action fly_reykjavik_to_paris_k2_p3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at reykjavik ?d1)
      (next_day ?d1 ?d2)
      (direct_flight reykjavik paris)
      (reykjavik_count_2)
      (paris_count_3)
    )
    :effect (and
      (at paris ?d2)
      (not (paris_count_3))
      (paris_count_4)
    )
  )

  (:action fly_reykjavik_to_paris_k2_p4
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at reykjavik ?d1)
      (next_day ?d1 ?d2)
      (direct_flight reykjavik paris)
      (reykjavik_count_2)
      (paris_count_4)
    )
    :effect (and
      (at paris ?d2)
    )
  )

  (:action fly_reykjavik_to_paris_k3_p0
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at reykjavik ?d1)
      (next_day ?d1 ?d2)
      (direct_flight reykjavik paris)
      (reykjavik_count_3)
      (paris_count_0)
    )
    :effect (and
      (at paris ?d2)
      (not (paris_count_0))
      (paris_count_1)
    )
  )

  (:action fly_reykjavik_to_paris_k3_p1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at reykjavik ?d1)
      (next_day ?d1 ?d2)
      (direct_flight reykjavik paris)
      (reykjavik_count_3)
      (paris_count_1)
    )
    :effect (and
      (at paris ?d2)
      (not (paris_count_1))
      (paris_count_2)
    )
  )

  (:action fly_reykjavik_to_paris_k3_p2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at reykjavik ?d1)
      (next_day ?d1 ?d2)
      (direct_flight reykjavik paris)
      (reykjavik_count_3)
      (paris_count_2)
    )
    :effect (and
      (at paris ?d2)
      (not (paris_count_2))
      (paris_count_3)
    )
  )

  (:action fly_reykjavik_to_paris_k3_p3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at reykjavik ?d1)
      (next_day ?d1 ?d2)
      (direct_flight reykjavik paris)
      (reykjavik_count_3)
      (paris_count_3)
    )
    :effect (and
      (at paris ?d2)
      (not (paris_count_3))
      (paris_count_4)
    )
  )

  (:action fly_reykjavik_to_paris_k3_p4
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at reykjavik ?d1)
      (next_day ?d1 ?d2)
      (direct_flight reykjavik paris)
      (reykjavik_count_3)
      (paris_count_4)
    )
    :effect (and
      (at paris ?d2)
    )
  )

  (:action fly_reykjavik_to_paris_k4_p0
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at reykjavik ?d1)
      (next_day ?d1 ?d2)
      (direct_flight reykjavik paris)
      (reykjavik_count_4)
      (paris_count_0)
    )
    :effect (and
      (at paris ?d2)
      (not (paris_count_0))
      (paris_count_1)
    )
  )

  (:action fly_reykjavik_to_paris_k4_p1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at reykjavik ?d1)
      (next_day ?d1 ?d2)
      (direct_flight reykjavik paris)
      (reykjavik_count_4)
      (paris_count_1)
    )
    :effect (and
      (at paris ?d2)
      (not (paris_count_1))
      (paris_count_2)
    )
  )

  (:action fly_reykjavik_to_paris_k4_p2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at reykjavik ?d1)
      (next_day ?d1 ?d2)
      (direct_flight reykjavik paris)
      (reykjavik_count_4)
      (paris_count_2)
    )
    :effect (and
      (at paris ?d2)
      (not (paris_count_2))
      (paris_count_3)
    )
  )

  (:action fly_reykjavik_to_paris_k4_p3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at reykjavik ?d1)
      (next_day ?d1 ?d2)
      (direct_flight reykjavik paris)
      (reykjavik_count_4)
      (paris_count_3)
    )
    :effect (and
      (at paris ?d2)
      (not (paris_count_3))
      (paris_count_4)
    )
  )

  (:action fly_reykjavik_to_paris_k4_p4
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at reykjavik ?d1)
      (next_day ?d1 ?d2)
      (direct_flight reykjavik paris)
      (reykjavik_count_4)
      (paris_count_4)
    )
    :effect (and
      (at paris ?d2)
    )
  )

  (:action fly_reykjavik_to_paris_k5_p0
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at reykjavik ?d1)
      (next_day ?d1 ?d2)
      (direct_flight reykjavik paris)
      (reykjavik_count_5)
      (paris_count_0)
    )
    :effect (and
      (at paris ?d2)
      (not (paris_count_0))
      (paris_count_1)
    )
  )

  (:action fly_reykjavik_to_paris_k5_p1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at reykjavik ?d1)
      (next_day ?d1 ?d2)
      (direct_flight reykjavik paris)
      (reykjavik_count_5)
      (paris_count_1)
    )
    :effect (and
      (at paris ?d2)
      (not (paris_count_1))
      (paris_count_2)
    )
  )

  (:action fly_reykjavik_to_paris_k5_p2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at reykjavik ?d1)
      (next_day ?d1 ?d2)
      (direct_flight reykjavik paris)
      (reykjavik_count_5)
      (paris_count_2)
    )
    :effect (and
      (at paris ?d2)
      (not (paris_count_2))
      (paris_count_3)
    )
  )

  (:action fly_reykjavik_to_paris_k5_p3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at reykjavik ?d1)
      (next_day ?d1 ?d2)
      (direct_flight reykjavik paris)
      (reykjavik_count_5)
      (paris_count_3)
    )
    :effect (and
      (at paris ?d2)
      (not (paris_count_3))
      (paris_count_4)
    )
  )

  (:action fly_reykjavik_to_paris_k5_p4
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at reykjavik ?d1)
      (next_day ?d1 ?d2)
      (direct_flight reykjavik paris)
      (reykjavik_count_5)
      (paris_count_4)
    )
    :effect (and
      (at paris ?d2)
    )
  )
)