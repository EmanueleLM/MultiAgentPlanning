(define (domain european_trip_10_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city day
  )

  (:predicates
    (next_day ?d1 - day ?d2 - day)
    (direct_flight ?from - city ?to - city)
    (at ?c - city ?d - day)
    (current_day ?d - day)
    (visited_riga_0)
    (visited_riga_1)
    (visited_riga_2)
    (visited_riga_3)
    (visited_paris_0)
    (visited_paris_1)
    (visited_paris_2)
    (visited_paris_3)
    (visited_paris_4)
    (visited_reykjavik_0)
    (visited_reykjavik_1)
    (visited_reykjavik_2)
    (visited_reykjavik_3)
    (visited_reykjavik_4)
    (visited_reykjavik_5)
  )

  (:action start_in_riga
    :parameters ()
    :precondition (and
      (current_day day_1)
      (visited_riga_0)
      (visited_paris_0)
      (visited_reykjavik_0)
    )
    :effect (and
      (at riga day_1)
      (not (visited_riga_0))
      (visited_riga_1)
    )
  )

  (:action start_in_paris
    :parameters ()
    :precondition (and
      (current_day day_1)
      (visited_riga_0)
      (visited_paris_0)
      (visited_reykjavik_0)
    )
    :effect (and
      (at paris day_1)
      (not (visited_paris_0))
      (visited_paris_1)
    )
  )

  (:action start_in_reykjavik
    :parameters ()
    :precondition (and
      (current_day day_1)
      (visited_riga_0)
      (visited_paris_0)
      (visited_reykjavik_0)
    )
    :effect (and
      (at reykjavik day_1)
      (not (visited_reykjavik_0))
      (visited_reykjavik_1)
    )
  )

  (:action stay_riga_1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at riga ?d1)
      (visited_riga_1)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at riga ?d2)
      (not (visited_riga_1))
      (visited_riga_2)
    )
  )

  (:action stay_riga_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at riga ?d1)
      (visited_riga_2)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at riga ?d2)
      (not (visited_riga_2))
      (visited_riga_3)
    )
  )

  (:action stay_riga_3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at riga ?d1)
      (visited_riga_3)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at riga ?d2)
    )
  )

  (:action stay_paris_1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at paris ?d1)
      (visited_paris_1)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at paris ?d2)
      (not (visited_paris_1))
      (visited_paris_2)
    )
  )

  (:action stay_paris_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at paris ?d1)
      (visited_paris_2)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at paris ?d2)
      (not (visited_paris_2))
      (visited_paris_3)
    )
  )

  (:action stay_paris_3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at paris ?d1)
      (visited_paris_3)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at paris ?d2)
      (not (visited_paris_3))
      (visited_paris_4)
    )
  )

  (:action stay_paris_4
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at paris ?d1)
      (visited_paris_4)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at paris ?d2)
    )
  )

  (:action stay_reykjavik_1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at reykjavik ?d1)
      (visited_reykjavik_1)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at reykjavik ?d2)
      (not (visited_reykjavik_1))
      (visited_reykjavik_2)
    )
  )

  (:action stay_reykjavik_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at reykjavik ?d1)
      (visited_reykjavik_2)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at reykjavik ?d2)
      (not (visited_reykjavik_2))
      (visited_reykjavik_3)
    )
  )

  (:action stay_reykjavik_3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at reykjavik ?d1)
      (visited_reykjavik_3)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at reykjavik ?d2)
      (not (visited_reykjavik_3))
      (visited_reykjavik_4)
    )
  )

  (:action stay_reykjavik_4
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at reykjavik ?d1)
      (visited_reykjavik_4)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at reykjavik ?d2)
      (not (visited_reykjavik_4))
      (visited_reykjavik_5)
    )
  )

  (:action stay_reykjavik_5
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at reykjavik ?d1)
      (visited_reykjavik_5)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at reykjavik ?d2)
    )
  )

  (:action fly_riga_to_paris_0_0
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at riga ?d1)
      (direct_flight riga paris)
      (visited_riga_0)
      (visited_paris_0)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at paris ?d2)
      (not (visited_paris_0))
      (visited_paris_1)
    )
  )

  (:action fly_riga_to_paris_0_1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at riga ?d1)
      (direct_flight riga paris)
      (visited_riga_0)
      (visited_paris_1)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at paris ?d2)
      (not (visited_paris_1))
      (visited_paris_2)
    )
  )

  (:action fly_riga_to_paris_0_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at riga ?d1)
      (direct_flight riga paris)
      (visited_riga_0)
      (visited_paris_2)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at paris ?d2)
      (not (visited_paris_2))
      (visited_paris_3)
    )
  )

  (:action fly_riga_to_paris_0_3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at riga ?d1)
      (direct_flight riga paris)
      (visited_riga_0)
      (visited_paris_3)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at paris ?d2)
      (not (visited_paris_3))
      (visited_paris_4)
    )
  )

  (:action fly_riga_to_paris_0_4
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at riga ?d1)
      (direct_flight riga paris)
      (visited_riga_0)
      (visited_paris_4)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at paris ?d2)
    )
  )

  (:action fly_riga_to_paris_1_0
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at riga ?d1)
      (direct_flight riga paris)
      (visited_riga_1)
      (visited_paris_0)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at paris ?d2)
      (not (visited_paris_0))
      (visited_paris_1)
    )
  )

  (:action fly_riga_to_paris_1_1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at riga ?d1)
      (direct_flight riga paris)
      (visited_riga_1)
      (visited_paris_1)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at paris ?d2)
      (not (visited_paris_1))
      (visited_paris_2)
    )
  )

  (:action fly_riga_to_paris_1_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at riga ?d1)
      (direct_flight riga paris)
      (visited_riga_1)
      (visited_paris_2)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at paris ?d2)
      (not (visited_paris_2))
      (visited_paris_3)
    )
  )

  (:action fly_riga_to_paris_1_3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at riga ?d1)
      (direct_flight riga paris)
      (visited_riga_1)
      (visited_paris_3)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at paris ?d2)
      (not (visited_paris_3))
      (visited_paris_4)
    )
  )

  (:action fly_riga_to_paris_1_4
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at riga ?d1)
      (direct_flight riga paris)
      (visited_riga_1)
      (visited_paris_4)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at paris ?d2)
    )
  )

  (:action fly_riga_to_paris_2_0
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at riga ?d1)
      (direct_flight riga paris)
      (visited_riga_2)
      (visited_paris_0)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at paris ?d2)
      (not (visited_paris_0))
      (visited_paris_1)
    )
  )

  (:action fly_riga_to_paris_2_1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at riga ?d1)
      (direct_flight riga paris)
      (visited_riga_2)
      (visited_paris_1)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at paris ?d2)
      (not (visited_paris_1))
      (visited_paris_2)
    )
  )

  (:action fly_riga_to_paris_2_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at riga ?d1)
      (direct_flight riga paris)
      (visited_riga_2)
      (visited_paris_2)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at paris ?d2)
      (not (visited_paris_2))
      (visited_paris_3)
    )
  )

  (:action fly_riga_to_paris_2_3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at riga ?d1)
      (direct_flight riga paris)
      (visited_riga_2)
      (visited_paris_3)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at paris ?d2)
      (not (visited_paris_3))
      (visited_paris_4)
    )
  )

  (:action fly_riga_to_paris_2_4
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at riga ?d1)
      (direct_flight riga paris)
      (visited_riga_2)
      (visited_paris_4)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at paris ?d2)
    )
  )

  (:action fly_riga_to_paris_3_0
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at riga ?d1)
      (direct_flight riga paris)
      (visited_riga_3)
      (visited_paris_0)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at paris ?d2)
      (not (visited_paris_0))
      (visited_paris_1)
    )
  )

  (:action fly_riga_to_paris_3_1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at riga ?d1)
      (direct_flight riga paris)
      (visited_riga_3)
      (visited_paris_1)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at paris ?d2)
      (not (visited_paris_1))
      (visited_paris_2)
    )
  )

  (:action fly_riga_to_paris_3_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at riga ?d1)
      (direct_flight riga paris)
      (visited_riga_3)
      (visited_paris_2)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at paris ?d2)
      (not (visited_paris_2))
      (visited_paris_3)
    )
  )

  (:action fly_riga_to_paris_3_3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at riga ?d1)
      (direct_flight riga paris)
      (visited_riga_3)
      (visited_paris_3)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at paris ?d2)
      (not (visited_paris_3))
      (visited_paris_4)
    )
  )

  (:action fly_riga_to_paris_3_4
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at riga ?d1)
      (direct_flight riga paris)
      (visited_riga_3)
      (visited_paris_4)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at paris ?d2)
    )
  )

  (:action fly_paris_to_riga_0_0
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at paris ?d1)
      (direct_flight paris riga)
      (visited_paris_0)
      (visited_riga_0)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at riga ?d2)
      (not (visited_riga_0))
      (visited_riga_1)
    )
  )

  (:action fly_paris_to_riga_0_1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at paris ?d1)
      (direct_flight paris riga)
      (visited_paris_0)
      (visited_riga_1)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at riga ?d2)
      (not (visited_riga_1))
      (visited_riga_2)
    )
  )

  (:action fly_paris_to_riga_0_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at paris ?d1)
      (direct_flight paris riga)
      (visited_paris_0)
      (visited_riga_2)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at riga ?d2)
      (not (visited_riga_2))
      (visited_riga_3)
    )
  )

  (:action fly_paris_to_riga_0_3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at paris ?d1)
      (direct_flight paris riga)
      (visited_paris_0)
      (visited_riga_3)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at riga ?d2)
    )
  )

  (:action fly_paris_to_riga_1_0
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at paris ?d1)
      (direct_flight paris riga)
      (visited_paris_1)
      (visited_riga_0)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at riga ?d2)
      (not (visited_riga_0))
      (visited_riga_1)
    )
  )

  (:action fly_paris_to_riga_1_1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at paris ?d1)
      (direct_flight paris riga)
      (visited_paris_1)
      (visited_riga_1)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at riga ?d2)
      (not (visited_riga_1))
      (visited_riga_2)
    )
  )

  (:action fly_paris_to_riga_1_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at paris ?d1)
      (direct_flight paris riga)
      (visited_paris_1)
      (visited_riga_2)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at riga ?d2)
      (not (visited_riga_2))
      (visited_riga_3)
    )
  )

  (:action fly_paris_to_riga_1_3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at paris ?d1)
      (direct_flight paris riga)
      (visited_paris_1)
      (visited_riga_3)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at riga ?d2)
    )
  )

  (:action fly_paris_to_riga_2_0
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at paris ?d1)
      (direct_flight paris riga)
      (visited_paris_2)
      (visited_riga_0)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at riga ?d2)
      (not (visited_riga_0))
      (visited_riga_1)
    )
  )

  (:action fly_paris_to_riga_2_1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at paris ?d1)
      (direct_flight paris riga)
      (visited_paris_2)
      (visited_riga_1)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at riga ?d2)
      (not (visited_riga_1))
      (visited_riga_2)
    )
  )

  (:action fly_paris_to_riga_2_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at paris ?d1)
      (direct_flight paris riga)
      (visited_paris_2)
      (visited_riga_2)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at riga ?d2)
      (not (visited_riga_2))
      (visited_riga_3)
    )
  )

  (:action fly_paris_to_riga_2_3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at paris ?d1)
      (direct_flight paris riga)
      (visited_paris_2)
      (visited_riga_3)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at riga ?d2)
    )
  )

  (:action fly_paris_to_riga_3_0
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at paris ?d1)
      (direct_flight paris riga)
      (visited_paris_3)
      (visited_riga_0)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at riga ?d2)
      (not (visited_riga_0))
      (visited_riga_1)
    )
  )

  (:action fly_paris_to_riga_3_1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at paris ?d1)
      (direct_flight paris riga)
      (visited_paris_3)
      (visited_riga_1)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at riga ?d2)
      (not (visited_riga_1))
      (visited_riga_2)
    )
  )

  (:action fly_paris_to_riga_3_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at paris ?d1)
      (direct_flight paris riga)
      (visited_paris_3)
      (visited_riga_2)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at riga ?d2)
      (not (visited_riga_2))
      (visited_riga_3)
    )
  )

  (:action fly_paris_to_riga_3_3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at paris ?d1)
      (direct_flight paris riga)
      (visited_paris_3)
      (visited_riga_3)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at riga ?d2)
    )
  )

  (:action fly_paris_to_riga_4_0
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at paris ?d1)
      (direct_flight paris riga)
      (visited_paris_4)
      (visited_riga_0)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at riga ?d2)
      (not (visited_riga_0))
      (visited_riga_1)
    )
  )

  (:action fly_paris_to_riga_4_1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at paris ?d1)
      (direct_flight paris riga)
      (visited_paris_4)
      (visited_riga_1)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at riga ?d2)
      (not (visited_riga_1))
      (visited_riga_2)
    )
  )

  (:action fly_paris_to_riga_4_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at paris ?d1)
      (direct_flight paris riga)
      (visited_paris_4)
      (visited_riga_2)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at riga ?d2)
      (not (visited_riga_2))
      (visited_riga_3)
    )
  )

  (:action fly_paris_to_riga_4_3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at paris ?d1)
      (direct_flight paris riga)
      (visited_paris_4)
      (visited_riga_3)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at riga ?d2)
    )
  )

  (:action fly_paris_to_reykjavik_0_0
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at paris ?d1)
      (direct_flight paris reykjavik)
      (visited_paris_0)
      (visited_reykjavik_0)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at reykjavik ?d2)
      (not (visited_reykjavik_0))
      (visited_reykjavik_1)
    )
  )

  (:action fly_paris_to_reykjavik_0_1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at paris ?d1)
      (direct_flight paris reykjavik)
      (visited_paris_0)
      (visited_reykjavik_1)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at reykjavik ?d2)
      (not (visited_reykjavik_1))
      (visited_reykjavik_2)
    )
  )

  (:action fly_paris_to_reykjavik_0_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at paris ?d1)
      (direct_flight paris reykjavik)
      (visited_paris_0)
      (visited_reykjavik_2)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at reykjavik ?d2)
      (not (visited_reykjavik_2))
      (visited_reykjavik_3)
    )
  )

  (:action fly_paris_to_reykjavik_0_3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at paris ?d1)
      (direct_flight paris reykjavik)
      (visited_paris_0)
      (visited_reykjavik_3)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at reykjavik ?d2)
      (not (visited_reykjavik_3))
      (visited_reykjavik_4)
    )
  )

  (:action fly_paris_to_reykjavik_0_4
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at paris ?d1)
      (direct_flight paris reykjavik)
      (visited_paris_0)
      (visited_reykjavik_4)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at reykjavik ?d2)
      (not (visited_reykjavik_4))
      (visited_reykjavik_5)
    )
  )

  (:action fly_paris_to_reykjavik_0_5
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at paris ?d1)
      (direct_flight paris reykjavik)
      (visited_paris_0)
      (visited_reykjavik_5)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at reykjavik ?d2)
    )
  )

  (:action fly_paris_to_reykjavik_1_0
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at paris ?d1)
      (direct_flight paris reykjavik)
      (visited_paris_1)
      (visited_reykjavik_0)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at reykjavik ?d2)
      (not (visited_reykjavik_0))
      (visited_reykjavik_1)
    )
  )

  (:action fly_paris_to_reykjavik_1_1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at paris ?d1)
      (direct_flight paris reykjavik)
      (visited_paris_1)
      (visited_reykjavik_1)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at reykjavik ?d2)
      (not (visited_reykjavik_1))
      (visited_reykjavik_2)
    )
  )

  (:action fly_paris_to_reykjavik_1_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at paris ?d1)
      (direct_flight paris reykjavik)
      (visited_paris_1)
      (visited_reykjavik_2)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at reykjavik ?d2)
      (not (visited_reykjavik_2))
      (visited_reykjavik_3)
    )
  )

  (:action fly_paris_to_reykjavik_1_3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at paris ?d1)
      (direct_flight paris reykjavik)
      (visited_paris_1)
      (visited_reykjavik_3)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at reykjavik ?d2)
      (not (visited_reykjavik_3))
      (visited_reykjavik_4)
    )
  )

  (:action fly_paris_to_reykjavik_1_4
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at paris ?d1)
      (direct_flight paris reykjavik)
      (visited_paris_1)
      (visited_reykjavik_4)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at reykjavik ?d2)
      (not (visited_reykjavik_4))
      (visited_reykjavik_5)
    )
  )

  (:action fly_paris_to_reykjavik_1_5
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at paris ?d1)
      (direct_flight paris reykjavik)
      (visited_paris_1)
      (visited_reykjavik_5)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at reykjavik ?d2)
    )
  )

  (:action fly_paris_to_reykjavik_2_0
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at paris ?d1)
      (direct_flight paris reykjavik)
      (visited_paris_2)
      (visited_reykjavik_0)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at reykjavik ?d2)
      (not (visited_reykjavik_0))
      (visited_reykjavik_1)
    )
  )

  (:action fly_paris_to_reykjavik_2_1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at paris ?d1)
      (direct_flight paris reykjavik)
      (visited_paris_2)
      (visited_reykjavik_1)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at reykjavik ?d2)
      (not (visited_reykjavik_1))
      (visited_reykjavik_2)
    )
  )

  (:action fly_paris_to_reykjavik_2_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at paris ?d1)
      (direct_flight paris reykjavik)
      (visited_paris_2)
      (visited_reykjavik_2)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at reykjavik ?d2)
      (not (visited_reykjavik_2))
      (visited_reykjavik_3)
    )
  )

  (:action fly_paris_to_reykjavik_2_3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at paris ?d1)
      (direct_flight paris reykjavik)
      (visited_paris_2)
      (visited_reykjavik_3)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at reykjavik ?d2)
      (not (visited_reykjavik_3))
      (visited_reykjavik_4)
    )
  )

  (:action fly_paris_to_reykjavik_2_4
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at paris ?d1)
      (direct_flight paris reykjavik)
      (visited_paris_2)
      (visited_reykjavik_4)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at reykjavik ?d2)
      (not (visited_reykjavik_4))
      (visited_reykjavik_5)
    )
  )

  (:action fly_paris_to_reykjavik_2_5
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at paris ?d1)
      (direct_flight paris reykjavik)
      (visited_paris_2)
      (visited_reykjavik_5)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at reykjavik ?d2)
    )
  )

  (:action fly_paris_to_reykjavik_3_0
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at paris ?d1)
      (direct_flight paris reykjavik)
      (visited_paris_3)
      (visited_reykjavik_0)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at reykjavik ?d2)
      (not (visited_reykjavik_0))
      (visited_reykjavik_1)
    )
  )

  (:action fly_paris_to_reykjavik_3_1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at paris ?d1)
      (direct_flight paris reykjavik)
      (visited_paris_3)
      (visited_reykjavik_1)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at reykjavik ?d2)
      (not (visited_reykjavik_1))
      (visited_reykjavik_2)
    )
  )

  (:action fly_paris_to_reykjavik_3_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at paris ?d1)
      (direct_flight paris reykjavik)
      (visited_paris_3)
      (visited_reykjavik_2)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at reykjavik ?d2)
      (not (visited_reykjavik_2))
      (visited_reykjavik_3)
    )
  )

  (:action fly_paris_to_reykjavik_3_3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at paris ?d1)
      (direct_flight paris reykjavik)
      (visited_paris_3)
      (visited_reykjavik_3)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at reykjavik ?d2)
      (not (visited_reykjavik_3))
      (visited_reykjavik_4)
    )
  )

  (:action fly_paris_to_reykjavik_3_4
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at paris ?d1)
      (direct_flight paris reykjavik)
      (visited_paris_3)
      (visited_reykjavik_4)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at reykjavik ?d2)
      (not (visited_reykjavik_4))
      (visited_reykjavik_5)
    )
  )

  (:action fly_paris_to_reykjavik_3_5
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at paris ?d1)
      (direct_flight paris reykjavik)
      (visited_paris_3)
      (visited_reykjavik_5)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at reykjavik ?d2)
    )
  )

  (:action fly_paris_to_reykjavik_4_0
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at paris ?d1)
      (direct_flight paris reykjavik)
      (visited_paris_4)
      (visited_reykjavik_0)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at reykjavik ?d2)
      (not (visited_reykjavik_0))
      (visited_reykjavik_1)
    )
  )

  (:action fly_paris_to_reykjavik_4_1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at paris ?d1)
      (direct_flight paris reykjavik)
      (visited_paris_4)
      (visited_reykjavik_1)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at reykjavik ?d2)
      (not (visited_reykjavik_1))
      (visited_reykjavik_2)
    )
  )

  (:action fly_paris_to_reykjavik_4_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at paris ?d1)
      (direct_flight paris reykjavik)
      (visited_paris_4)
      (visited_reykjavik_2)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at reykjavik ?d2)
      (not (visited_reykjavik_2))
      (visited_reykjavik_3)
    )
  )

  (:action fly_paris_to_reykjavik_4_3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at paris ?d1)
      (direct_flight paris reykjavik)
      (visited_paris_4)
      (visited_reykjavik_3)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at reykjavik ?d2)
      (not (visited_reykjavik_3))
      (visited_reykjavik_4)
    )
  )

  (:action fly_paris_to_reykjavik_4_4
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at paris ?d1)
      (direct_flight paris reykjavik)
      (visited_paris_4)
      (visited_reykjavik_4)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at reykjavik ?d2)
      (not (visited_reykjavik_4))
      (visited_reykjavik_5)
    )
  )

  (:action fly_paris_to_reykjavik_4_5
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at paris ?d1)
      (direct_flight paris reykjavik)
      (visited_paris_4)
      (visited_reykjavik_5)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at reykjavik ?d2)
    )
  )

  (:action fly_reykjavik_to_paris_0_0
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at reykjavik ?d1)
      (direct_flight reykjavik paris)
      (visited_reykjavik_0)
      (visited_paris_0)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at paris ?d2)
      (not (visited_paris_0))
      (visited_paris_1)
    )
  )

  (:action fly_reykjavik_to_paris_0_1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at reykjavik ?d1)
      (direct_flight reykjavik paris)
      (visited_reykjavik_0)
      (visited_paris_1)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at paris ?d2)
      (not (visited_paris_1))
      (visited_paris_2)
    )
  )

  (:action fly_reykjavik_to_paris_0_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at reykjavik ?d1)
      (direct_flight reykjavik paris)
      (visited_reykjavik_0)
      (visited_paris_2)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at paris ?d2)
      (not (visited_paris_2))
      (visited_paris_3)
    )
  )

  (:action fly_reykjavik_to_paris_0_3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at reykjavik ?d1)
      (direct_flight reykjavik paris)
      (visited_reykjavik_0)
      (visited_paris_3)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at paris ?d2)
      (not (visited_paris_3))
      (visited_paris_4)
    )
  )

  (:action fly_reykjavik_to_paris_0_4
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at reykjavik ?d1)
      (direct_flight reykjavik paris)
      (visited_reykjavik_0)
      (visited_paris_4)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at paris ?d2)
    )
  )

  (:action fly_reykjavik_to_paris_1_0
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at reykjavik ?d1)
      (direct_flight reykjavik paris)
      (visited_reykjavik_1)
      (visited_paris_0)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at paris ?d2)
      (not (visited_paris_0))
      (visited_paris_1)
    )
  )

  (:action fly_reykjavik_to_paris_1_1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at reykjavik ?d1)
      (direct_flight reykjavik paris)
      (visited_reykjavik_1)
      (visited_paris_1)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at paris ?d2)
      (not (visited_paris_1))
      (visited_paris_2)
    )
  )

  (:action fly_reykjavik_to_paris_1_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at reykjavik ?d1)
      (direct_flight reykjavik paris)
      (visited_reykjavik_1)
      (visited_paris_2)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at paris ?d2)
      (not (visited_paris_2))
      (visited_paris_3)
    )
  )

  (:action fly_reykjavik_to_paris_1_3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at reykjavik ?d1)
      (direct_flight reykjavik paris)
      (visited_reykjavik_1)
      (visited_paris_3)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at paris ?d2)
      (not (visited_paris_3))
      (visited_paris_4)
    )
  )

  (:action fly_reykjavik_to_paris_1_4
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at reykjavik ?d1)
      (direct_flight reykjavik paris)
      (visited_reykjavik_1)
      (visited_paris_4)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at paris ?d2)
    )
  )

  (:action fly_reykjavik_to_paris_2_0
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at reykjavik ?d1)
      (direct_flight reykjavik paris)
      (visited_reykjavik_2)
      (visited_paris_0)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at paris ?d2)
      (not (visited_paris_0))
      (visited_paris_1)
    )
  )

  (:action fly_reykjavik_to_paris_2_1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at reykjavik ?d1)
      (direct_flight reykjavik paris)
      (visited_reykjavik_2)
      (visited_paris_1)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at paris ?d2)
      (not (visited_paris_1))
      (visited_paris_2)
    )
  )

  (:action fly_reykjavik_to_paris_2_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at reykjavik ?d1)
      (direct_flight reykjavik paris)
      (visited_reykjavik_2)
      (visited_paris_2)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at paris ?d2)
      (not (visited_paris_2))
      (visited_paris_3)
    )
  )

  (:action fly_reykjavik_to_paris_2_3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at reykjavik ?d1)
      (direct_flight reykjavik paris)
      (visited_reykjavik_2)
      (visited_paris_3)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at paris ?d2)
      (not (visited_paris_3))
      (visited_paris_4)
    )
  )

  (:action fly_reykjavik_to_paris_2_4
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at reykjavik ?d1)
      (direct_flight reykjavik paris)
      (visited_reykjavik_2)
      (visited_paris_4)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at paris ?d2)
    )
  )

  (:action fly_reykjavik_to_paris_3_0
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at reykjavik ?d1)
      (direct_flight reykjavik paris)
      (visited_reykjavik_3)
      (visited_paris_0)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at paris ?d2)
      (not (visited_paris_0))
      (visited_paris_1)
    )
  )

  (:action fly_reykjavik_to_paris_3_1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at reykjavik ?d1)
      (direct_flight reykjavik paris)
      (visited_reykjavik_3)
      (visited_paris_1)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at paris ?d2)
      (not (visited_paris_1))
      (visited_paris_2)
    )
  )

  (:action fly_reykjavik_to_paris_3_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at reykjavik ?d1)
      (direct_flight reykjavik paris)
      (visited_reykjavik_3)
      (visited_paris_2)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at paris ?d2)
      (not (visited_paris_2))
      (visited_paris_3)
    )
  )

  (:action fly_reykjavik_to_paris_3_3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at reykjavik ?d1)
      (direct_flight reykjavik paris)
      (visited_reykjavik_3)
      (visited_paris_3)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at paris ?d2)
      (not (visited_paris_3))
      (visited_paris_4)
    )
  )

  (:action fly_reykjavik_to_paris_3_4
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at reykjavik ?d1)
      (direct_flight reykjavik paris)
      (visited_reykjavik_3)
      (visited_paris_4)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at paris ?d2)
    )
  )

  (:action fly_reykjavik_to_paris_4_0
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at reykjavik ?d1)
      (direct_flight reykjavik paris)
      (visited_reykjavik_4)
      (visited_paris_0)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at paris ?d2)
      (not (visited_paris_0))
      (visited_paris_1)
    )
  )

  (:action fly_reykjavik_to_paris_4_1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at reykjavik ?d1)
      (direct_flight reykjavik paris)
      (visited_reykjavik_4)
      (visited_paris_1)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at paris ?d2)
      (not (visited_paris_1))
      (visited_paris_2)
    )
  )

  (:action fly_reykjavik_to_paris_4_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at reykjavik ?d1)
      (direct_flight reykjavik paris)
      (visited_reykjavik_4)
      (visited_paris_2)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at paris ?d2)
      (not (visited_paris_2))
      (visited_paris_3)
    )
  )

  (:action fly_reykjavik_to_paris_4_3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at reykjavik ?d1)
      (direct_flight reykjavik paris)
      (visited_reykjavik_4)
      (visited_paris_3)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at paris ?d2)
      (not (visited_paris_3))
      (visited_paris_4)
    )
  )

  (:action fly_reykjavik_to_paris_4_4
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at reykjavik ?d1)
      (direct_flight reykjavik paris)
      (visited_reykjavik_4)
      (visited_paris_4)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at paris ?d2)
    )
  )

  (:action fly_reykjavik_to_paris_5_0
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at reykjavik ?d1)
      (direct_flight reykjavik paris)
      (visited_reykjavik_5)
      (visited_paris_0)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at paris ?d2)
      (not (visited_paris_0))
      (visited_paris_1)
    )
  )

  (:action fly_reykjavik_to_paris_5_1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at reykjavik ?d1)
      (direct_flight reykjavik paris)
      (visited_reykjavik_5)
      (visited_paris_1)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at paris ?d2)
      (not (visited_paris_1))
      (visited_paris_2)
    )
  )

  (:action fly_reykjavik_to_paris_5_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at reykjavik ?d1)
      (direct_flight reykjavik paris)
      (visited_reykjavik_5)
      (visited_paris_2)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at paris ?d2)
      (not (visited_paris_2))
      (visited_paris_3)
    )
  )

  (:action fly_reykjavik_to_paris_5_3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at reykjavik ?d1)
      (direct_flight reykjavik paris)
      (visited_reykjavik_5)
      (visited_paris_3)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at paris ?d2)
      (not (visited_paris_3))
      (visited_paris_4)
    )
  )

  (:action fly_reykjavik_to_paris_5_4
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at reykjavik ?d1)
      (direct_flight reykjavik paris)
      (visited_reykjavik_5)
      (visited_paris_4)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at paris ?d2)
    )
  )
)