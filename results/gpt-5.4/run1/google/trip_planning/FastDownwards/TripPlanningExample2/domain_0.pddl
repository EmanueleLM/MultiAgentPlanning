(define (domain european_trip_11_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city day
  )

  (:predicates
    (at ?c - city ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (direct_flight ?from - city ?to - city)
    (advanced_from ?d - day)

    (start_unassigned)

    (counted_reykjavik ?d - day)
    (counted_vienna ?d - day)
    (counted_venice ?d - day)

    (r_count_0)
    (r_count_1)
    (r_count_2)

    (v_count_0)
    (v_count_1)
    (v_count_2)
    (v_count_3)
    (v_count_4)
    (v_count_5)
    (v_count_6)
    (v_count_7)

    (ve_count_0)
    (ve_count_1)
    (ve_count_2)
    (ve_count_3)
    (ve_count_4)

    (attended_wedding_window)
  )

  (:action choose_start_reykjavik
    :parameters ()
    :precondition (start_unassigned)
    :effect (and
      (at reykjavik day_1)
      (not (start_unassigned))
    )
  )

  (:action choose_start_vienna
    :parameters ()
    :precondition (start_unassigned)
    :effect (and
      (at vienna day_1)
      (not (start_unassigned))
    )
  )

  (:action choose_start_venice
    :parameters ()
    :precondition (start_unassigned)
    :effect (and
      (at venice day_1)
      (not (start_unassigned))
    )
  )

  (:action stay_to_next_day
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?c ?d1)
      (next_day ?d1 ?d2)
      (not (advanced_from ?d1))
    )
    :effect (and
      (at ?c ?d2)
      (advanced_from ?d1)
    )
  )

  (:action fly_to_next_day
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?from ?d1)
      (next_day ?d1 ?d2)
      (direct_flight ?from ?to)
      (not (advanced_from ?d1))
    )
    :effect (and
      (at ?to ?d2)
      (advanced_from ?d1)
    )
  )

  (:action count_reykjavik_day_0_1
    :parameters (?d - day)
    :precondition (and
      (at reykjavik ?d)
      (r_count_0)
      (not (counted_reykjavik ?d))
    )
    :effect (and
      (counted_reykjavik ?d)
      (r_count_1)
      (not (r_count_0))
    )
  )

  (:action count_reykjavik_day_1_2
    :parameters (?d - day)
    :precondition (and
      (at reykjavik ?d)
      (r_count_1)
      (not (counted_reykjavik ?d))
    )
    :effect (and
      (counted_reykjavik ?d)
      (r_count_2)
      (not (r_count_1))
    )
  )

  (:action count_vienna_day_0_1
    :parameters (?d - day)
    :precondition (and
      (at vienna ?d)
      (v_count_0)
      (not (counted_vienna ?d))
    )
    :effect (and
      (counted_vienna ?d)
      (v_count_1)
      (not (v_count_0))
    )
  )

  (:action count_vienna_day_1_2
    :parameters (?d - day)
    :precondition (and
      (at vienna ?d)
      (v_count_1)
      (not (counted_vienna ?d))
    )
    :effect (and
      (counted_vienna ?d)
      (v_count_2)
      (not (v_count_1))
    )
  )

  (:action count_vienna_day_2_3
    :parameters (?d - day)
    :precondition (and
      (at vienna ?d)
      (v_count_2)
      (not (counted_vienna ?d))
    )
    :effect (and
      (counted_vienna ?d)
      (v_count_3)
      (not (v_count_2))
    )
  )

  (:action count_vienna_day_3_4
    :parameters (?d - day)
    :precondition (and
      (at vienna ?d)
      (v_count_3)
      (not (counted_vienna ?d))
    )
    :effect (and
      (counted_vienna ?d)
      (v_count_4)
      (not (v_count_3))
    )
  )

  (:action count_vienna_day_4_5
    :parameters (?d - day)
    :precondition (and
      (at vienna ?d)
      (v_count_4)
      (not (counted_vienna ?d))
    )
    :effect (and
      (counted_vienna ?d)
      (v_count_5)
      (not (v_count_4))
    )
  )

  (:action count_vienna_day_5_6
    :parameters (?d - day)
    :precondition (and
      (at vienna ?d)
      (v_count_5)
      (not (counted_vienna ?d))
    )
    :effect (and
      (counted_vienna ?d)
      (v_count_6)
      (not (v_count_5))
    )
  )

  (:action count_vienna_day_6_7
    :parameters (?d - day)
    :precondition (and
      (at vienna ?d)
      (v_count_6)
      (not (counted_vienna ?d))
    )
    :effect (and
      (counted_vienna ?d)
      (v_count_7)
      (not (v_count_6))
    )
  )

  (:action count_venice_day_0_1
    :parameters (?d - day)
    :precondition (and
      (at venice ?d)
      (ve_count_0)
      (not (counted_venice ?d))
    )
    :effect (and
      (counted_venice ?d)
      (ve_count_1)
      (not (ve_count_0))
    )
  )

  (:action count_venice_day_1_2
    :parameters (?d - day)
    :precondition (and
      (at venice ?d)
      (ve_count_1)
      (not (counted_venice ?d))
    )
    :effect (and
      (counted_venice ?d)
      (ve_count_2)
      (not (ve_count_1))
    )
  )

  (:action count_venice_day_2_3
    :parameters (?d - day)
    :precondition (and
      (at venice ?d)
      (ve_count_2)
      (not (counted_venice ?d))
    )
    :effect (and
      (counted_venice ?d)
      (ve_count_3)
      (not (ve_count_2))
    )
  )

  (:action count_venice_day_3_4
    :parameters (?d - day)
    :precondition (and
      (at venice ?d)
      (ve_count_3)
      (not (counted_venice ?d))
    )
    :effect (and
      (counted_venice ?d)
      (ve_count_4)
      (not (ve_count_3))
    )
  )

  (:action mark_wedding_day_8
    :parameters ()
    :precondition (and
      (at venice day_8)
      (not (attended_wedding_window))
    )
    :effect (attended_wedding_window)
  )

  (:action mark_wedding_day_9
    :parameters ()
    :precondition (and
      (at venice day_9)
      (not (attended_wedding_window))
    )
    :effect (attended_wedding_window)
  )

  (:action mark_wedding_day_10
    :parameters ()
    :precondition (and
      (at venice day_10)
      (not (attended_wedding_window))
    )
    :effect (attended_wedding_window)
  )

  (:action mark_wedding_day_11
    :parameters ()
    :precondition (and
      (at venice day_11)
      (not (attended_wedding_window))
    )
    :effect (attended_wedding_window)
  )
)