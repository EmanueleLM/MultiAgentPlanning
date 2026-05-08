(define (domain european_trip_10_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (in ?c - city)
    (direct_flight ?from - city ?to - city)
    (next_day ?d1 - day ?d2 - day)
    (current_day ?d - day)
    (on_day ?d - day)

    (visited_reykjavik_1)
    (visited_reykjavik_2)
    (visited_reykjavik_3)
    (visited_reykjavik_4)
    (visited_reykjavik_5)

    (visited_riga_1)
    (visited_riga_2)
    (visited_riga_3)

    (visited_paris_1)
    (visited_paris_2)
    (visited_paris_3)
    (visited_paris_4)

    (start_chosen)
  )

  (:action choose_start_reykjavik
    :parameters ()
    :precondition (and
      (current_day day_1)
      (not (start_chosen))
      (not (in reykjavik))
      (not (in riga))
      (not (in paris))
    )
    :effect (and
      (start_chosen)
      (in reykjavik)
      (on_day day_1)
      (visited_reykjavik_1)
    )
  )

  (:action choose_start_riga
    :parameters ()
    :precondition (and
      (current_day day_1)
      (not (start_chosen))
      (not (in reykjavik))
      (not (in riga))
      (not (in paris))
    )
    :effect (and
      (start_chosen)
      (in riga)
      (on_day day_1)
      (visited_riga_1)
    )
  )

  (:action choose_start_paris
    :parameters ()
    :precondition (and
      (current_day day_1)
      (not (start_chosen))
      (not (in reykjavik))
      (not (in riga))
      (not (in paris))
    )
    :effect (and
      (start_chosen)
      (in paris)
      (on_day day_1)
      (visited_paris_1)
    )
  )

  (:action stay_reykjavik_1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (in reykjavik)
      (visited_reykjavik_1)
    )
    :effect (and
      (on_day ?d2)
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
      (in reykjavik)
      (visited_reykjavik_2)
    )
    :effect (and
      (on_day ?d2)
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
      (in reykjavik)
      (visited_reykjavik_3)
    )
    :effect (and
      (on_day ?d2)
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
      (in reykjavik)
      (visited_reykjavik_4)
    )
    :effect (and
      (on_day ?d2)
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
      (in riga)
      (visited_riga_1)
    )
    :effect (and
      (on_day ?d2)
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
      (in riga)
      (visited_riga_2)
    )
    :effect (and
      (on_day ?d2)
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
      (in paris)
      (visited_paris_1)
    )
    :effect (and
      (on_day ?d2)
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
      (in paris)
      (visited_paris_2)
    )
    :effect (and
      (on_day ?d2)
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
      (in paris)
      (visited_paris_3)
    )
    :effect (and
      (on_day ?d2)
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
      (in paris)
      (direct_flight paris reykjavik)
      (not (visited_reykjavik_1))
    )
    :effect (and
      (not (in paris))
      (in reykjavik)
      (on_day ?d2)
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
      (in paris)
      (direct_flight paris reykjavik)
      (visited_reykjavik_1)
      (not (visited_reykjavik_2))
    )
    :effect (and
      (not (in paris))
      (in reykjavik)
      (on_day ?d2)
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
      (in paris)
      (direct_flight paris reykjavik)
      (visited_reykjavik_2)
      (not (visited_reykjavik_3))
    )
    :effect (and
      (not (in paris))
      (in reykjavik)
      (on_day ?d2)
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
      (in paris)
      (direct_flight paris reykjavik)
      (visited_reykjavik_3)
      (not (visited_reykjavik_4))
    )
    :effect (and
      (not (in paris))
      (in reykjavik)
      (on_day ?d2)
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
      (in paris)
      (direct_flight paris reykjavik)
      (visited_reykjavik_4)
      (not (visited_reykjavik_5))
    )
    :effect (and
      (not (in paris))
      (in reykjavik)
      (on_day ?d2)
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
      (in reykjavik)
      (direct_flight reykjavik paris)
      (not (visited_paris_1))
    )
    :effect (and
      (not (in reykjavik))
      (in paris)
      (on_day ?d2)
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
      (in reykjavik)
      (direct_flight reykjavik paris)
      (visited_paris_1)
      (not (visited_paris_2))
    )
    :effect (and
      (not (in reykjavik))
      (in paris)
      (on_day ?d2)
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
      (in reykjavik)
      (direct_flight reykjavik paris)
      (visited_paris_2)
      (not (visited_paris_3))
    )
    :effect (and
      (not (in reykjavik))
      (in paris)
      (on_day ?d2)
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
      (in reykjavik)
      (direct_flight reykjavik paris)
      (visited_paris_3)
      (not (visited_paris_4))
    )
    :effect (and
      (not (in reykjavik))
      (in paris)
      (on_day ?d2)
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
      (in paris)
      (direct_flight paris riga)
      (not (visited_riga_1))
    )
    :effect (and
      (not (in paris))
      (in riga)
      (on_day ?d2)
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
      (in paris)
      (direct_flight paris riga)
      (visited_riga_1)
      (not (visited_riga_2))
    )
    :effect (and
      (not (in paris))
      (in riga)
      (on_day ?d2)
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
      (in paris)
      (direct_flight paris riga)
      (visited_riga_2)
      (not (visited_riga_3))
    )
    :effect (and
      (not (in paris))
      (in riga)
      (on_day ?d2)
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
      (in riga)
      (direct_flight riga paris)
      (not (visited_paris_1))
    )
    :effect (and
      (not (in riga))
      (in paris)
      (on_day ?d2)
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
      (in riga)
      (direct_flight riga paris)
      (visited_paris_1)
      (not (visited_paris_2))
    )
    :effect (and
      (not (in riga))
      (in paris)
      (on_day ?d2)
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
      (in riga)
      (direct_flight riga paris)
      (visited_paris_2)
      (not (visited_paris_3))
    )
    :effect (and
      (not (in riga))
      (in paris)
      (on_day ?d2)
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
      (in riga)
      (direct_flight riga paris)
      (visited_paris_3)
      (not (visited_paris_4))
    )
    :effect (and
      (not (in riga))
      (in paris)
      (on_day ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (visited_paris_3))
      (visited_paris_4)
    )
  )
)