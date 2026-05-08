(define (domain european_trip_10_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (at ?c - city ?d - day)
    (direct_flight ?from - city ?to - city)
    (next_day ?d1 - day ?d2 - day)
    (current_day ?d - day)

    (visited_reykjavik_1) (visited_reykjavik_2) (visited_reykjavik_3) (visited_reykjavik_4) (visited_reykjavik_5)
    (visited_riga_1) (visited_riga_2) (visited_riga_3)
    (visited_paris_1) (visited_paris_2) (visited_paris_3) (visited_paris_4)

    (start_chosen)
    (trip_finished)
  )

  (:action choose_start_reykjavik
    :parameters ()
    :precondition (and
      (current_day day_1)
      (not (start_chosen))
      (not (at reykjavik day_1))
      (not (at riga day_1))
      (not (at paris day_1))
    )
    :effect (and
      (start_chosen)
      (at reykjavik day_1)
      (visited_reykjavik_1)
    )
  )

  (:action choose_start_riga
    :parameters ()
    :precondition (and
      (current_day day_1)
      (not (start_chosen))
      (not (at reykjavik day_1))
      (not (at riga day_1))
      (not (at paris day_1))
    )
    :effect (and
      (start_chosen)
      (at riga day_1)
      (visited_riga_1)
    )
  )

  (:action choose_start_paris
    :parameters ()
    :precondition (and
      (current_day day_1)
      (not (start_chosen))
      (not (at reykjavik day_1))
      (not (at riga day_1))
      (not (at paris day_1))
    )
    :effect (and
      (start_chosen)
      (at paris day_1)
      (visited_paris_1)
    )
  )

  (:action stay_reykjavik_1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at reykjavik ?d1)
      (visited_reykjavik_1)
      (not (at reykjavik ?d2))
      (not (at riga ?d2))
      (not (at paris ?d2))
    )
    :effect (and
      (at reykjavik ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
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
      (not (at reykjavik ?d2))
      (not (at riga ?d2))
      (not (at paris ?d2))
    )
    :effect (and
      (at reykjavik ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
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
      (not (at reykjavik ?d2))
      (not (at riga ?d2))
      (not (at paris ?d2))
    )
    :effect (and
      (at reykjavik ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
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
      (not (at reykjavik ?d2))
      (not (at riga ?d2))
      (not (at paris ?d2))
    )
    :effect (and
      (at reykjavik ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (visited_reykjavik_4))
      (visited_reykjavik_5)
    )
  )

  (:action stay_riga_1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at riga ?d1)
      (visited_riga_1)
      (not (at reykjavik ?d2))
      (not (at riga ?d2))
      (not (at paris ?d2))
    )
    :effect (and
      (at riga ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
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
      (not (at reykjavik ?d2))
      (not (at riga ?d2))
      (not (at paris ?d2))
    )
    :effect (and
      (at riga ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (visited_riga_2))
      (visited_riga_3)
    )
  )

  (:action stay_paris_1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at paris ?d1)
      (visited_paris_1)
      (not (at reykjavik ?d2))
      (not (at riga ?d2))
      (not (at paris ?d2))
    )
    :effect (and
      (at paris ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
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
      (not (at reykjavik ?d2))
      (not (at riga ?d2))
      (not (at paris ?d2))
    )
    :effect (and
      (at paris ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
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
      (not (at reykjavik ?d2))
      (not (at riga ?d2))
      (not (at paris ?d2))
    )
    :effect (and
      (at paris ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (visited_paris_3))
      (visited_paris_4)
    )
  )

  (:action fly_paris_to_reykjavik_new
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at paris ?d1)
      (direct_flight paris reykjavik)
      (not (visited_reykjavik_1))
      (not (at reykjavik ?d2))
      (not (at riga ?d2))
      (not (at paris ?d2))
    )
    :effect (and
      (at reykjavik ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (visited_reykjavik_1)
    )
  )

  (:action fly_paris_to_reykjavik_after_1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at paris ?d1)
      (direct_flight paris reykjavik)
      (visited_reykjavik_1)
      (not (visited_reykjavik_2))
      (not (at reykjavik ?d2))
      (not (at riga ?d2))
      (not (at paris ?d2))
    )
    :effect (and
      (at reykjavik ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (visited_reykjavik_1))
      (visited_reykjavik_2)
    )
  )

  (:action fly_paris_to_reykjavik_after_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at paris ?d1)
      (direct_flight paris reykjavik)
      (visited_reykjavik_2)
      (not (visited_reykjavik_3))
      (not (at reykjavik ?d2))
      (not (at riga ?d2))
      (not (at paris ?d2))
    )
    :effect (and
      (at reykjavik ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (visited_reykjavik_2))
      (visited_reykjavik_3)
    )
  )

  (:action fly_paris_to_reykjavik_after_3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at paris ?d1)
      (direct_flight paris reykjavik)
      (visited_reykjavik_3)
      (not (visited_reykjavik_4))
      (not (at reykjavik ?d2))
      (not (at riga ?d2))
      (not (at paris ?d2))
    )
    :effect (and
      (at reykjavik ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (visited_reykjavik_3))
      (visited_reykjavik_4)
    )
  )

  (:action fly_paris_to_reykjavik_after_4
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at paris ?d1)
      (direct_flight paris reykjavik)
      (visited_reykjavik_4)
      (not (visited_reykjavik_5))
      (not (at reykjavik ?d2))
      (not (at riga ?d2))
      (not (at paris ?d2))
    )
    :effect (and
      (at reykjavik ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (visited_reykjavik_4))
      (visited_reykjavik_5)
    )
  )

  (:action fly_reykjavik_to_paris_new
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at reykjavik ?d1)
      (direct_flight reykjavik paris)
      (not (visited_paris_1))
      (not (at reykjavik ?d2))
      (not (at riga ?d2))
      (not (at paris ?d2))
    )
    :effect (and
      (at paris ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (visited_paris_1)
    )
  )

  (:action fly_reykjavik_to_paris_after_1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at reykjavik ?d1)
      (direct_flight reykjavik paris)
      (visited_paris_1)
      (not (visited_paris_2))
      (not (at reykjavik ?d2))
      (not (at riga ?d2))
      (not (at paris ?d2))
    )
    :effect (and
      (at paris ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (visited_paris_1))
      (visited_paris_2)
    )
  )

  (:action fly_reykjavik_to_paris_after_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at reykjavik ?d1)
      (direct_flight reykjavik paris)
      (visited_paris_2)
      (not (visited_paris_3))
      (not (at reykjavik ?d2))
      (not (at riga ?d2))
      (not (at paris ?d2))
    )
    :effect (and
      (at paris ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (visited_paris_2))
      (visited_paris_3)
    )
  )

  (:action fly_reykjavik_to_paris_after_3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at reykjavik ?d1)
      (direct_flight reykjavik paris)
      (visited_paris_3)
      (not (visited_paris_4))
      (not (at reykjavik ?d2))
      (not (at riga ?d2))
      (not (at paris ?d2))
    )
    :effect (and
      (at paris ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (visited_paris_3))
      (visited_paris_4)
    )
  )

  (:action fly_paris_to_riga_new
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at paris ?d1)
      (direct_flight paris riga)
      (not (visited_riga_1))
      (not (at reykjavik ?d2))
      (not (at riga ?d2))
      (not (at paris ?d2))
    )
    :effect (and
      (at riga ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (visited_riga_1)
    )
  )

  (:action fly_paris_to_riga_after_1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at paris ?d1)
      (direct_flight paris riga)
      (visited_riga_1)
      (not (visited_riga_2))
      (not (at reykjavik ?d2))
      (not (at riga ?d2))
      (not (at paris ?d2))
    )
    :effect (and
      (at riga ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (visited_riga_1))
      (visited_riga_2)
    )
  )

  (:action fly_paris_to_riga_after_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at paris ?d1)
      (direct_flight paris riga)
      (visited_riga_2)
      (not (visited_riga_3))
      (not (at reykjavik ?d2))
      (not (at riga ?d2))
      (not (at paris ?d2))
    )
    :effect (and
      (at riga ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (visited_riga_2))
      (visited_riga_3)
    )
  )

  (:action fly_riga_to_paris_new
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at riga ?d1)
      (direct_flight riga paris)
      (not (visited_paris_1))
      (not (at reykjavik ?d2))
      (not (at riga ?d2))
      (not (at paris ?d2))
    )
    :effect (and
      (at paris ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (visited_paris_1)
    )
  )

  (:action fly_riga_to_paris_after_1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at riga ?d1)
      (direct_flight riga paris)
      (visited_paris_1)
      (not (visited_paris_2))
      (not (at reykjavik ?d2))
      (not (at riga ?d2))
      (not (at paris ?d2))
    )
    :effect (and
      (at paris ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (visited_paris_1))
      (visited_paris_2)
    )
  )

  (:action fly_riga_to_paris_after_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at riga ?d1)
      (direct_flight riga paris)
      (visited_paris_2)
      (not (visited_paris_3))
      (not (at reykjavik ?d2))
      (not (at riga ?d2))
      (not (at paris ?d2))
    )
    :effect (and
      (at paris ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (visited_paris_2))
      (visited_paris_3)
    )
  )

  (:action fly_riga_to_paris_after_3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at riga ?d1)
      (direct_flight riga paris)
      (visited_paris_3)
      (not (visited_paris_4))
      (not (at reykjavik ?d2))
      (not (at riga ?d2))
      (not (at paris ?d2))
    )
    :effect (and
      (at paris ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (visited_paris_3))
      (visited_paris_4)
    )
  )

  (:action finish_trip
    :parameters ()
    :precondition (and
      (current_day day_10)
      (at reykjavik day_10)
      (at reykjavik day_6)
      (at reykjavik day_7)
      (at reykjavik day_8)
      (at reykjavik day_9)
      (visited_reykjavik_5)
      (visited_riga_3)
      (visited_paris_4)
    )
    :effect (and
      (trip_finished)
    )
  )
)