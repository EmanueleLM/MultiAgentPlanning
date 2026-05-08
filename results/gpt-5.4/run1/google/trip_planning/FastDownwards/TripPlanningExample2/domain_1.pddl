(define (domain european_trip_11_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (direct_flight ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)

    (at ?c - city ?d - day)
    (used_day ?d - day)

    (start_unassigned)

    (need_reykjavik_2)
    (need_reykjavik_1)
    (done_reykjavik)

    (need_vienna_7)
    (need_vienna_6)
    (need_vienna_5)
    (need_vienna_4)
    (need_vienna_3)
    (need_vienna_2)
    (need_vienna_1)
    (done_vienna)

    (need_venice_4)
    (need_venice_3)
    (need_venice_2)
    (need_venice_1)
    (done_venice)

    (wedding_attended)
  )

  (:action choose_start
    :parameters (?c - city)
    :precondition (and
      (start_unassigned)
    )
    :effect (and
      (at ?c day_1)
      (used_day day_1)
      (not (start_unassigned))
    )
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?c ?d1)
      (used_day ?d1)
      (next ?d1 ?d2)
      (not (used_day ?d2))
    )
    :effect (and
      (at ?c ?d2)
      (used_day ?d2)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?from ?d1)
      (used_day ?d1)
      (next ?d1 ?d2)
      (direct_flight ?from ?to)
      (not (used_day ?d2))
    )
    :effect (and
      (at ?to ?d2)
      (used_day ?d2)
    )
  )

  (:action count_reykjavik_2_to_1
    :parameters (?d - day)
    :precondition (and
      (at reykjavik ?d)
      (used_day ?d)
      (need_reykjavik_2)
    )
    :effect (and
      (need_reykjavik_1)
      (not (need_reykjavik_2))
    )
  )

  (:action count_reykjavik_1_to_done
    :parameters (?d - day)
    :precondition (and
      (at reykjavik ?d)
      (used_day ?d)
      (need_reykjavik_1)
    )
    :effect (and
      (done_reykjavik)
      (not (need_reykjavik_1))
    )
  )

  (:action count_vienna_7_to_6
    :parameters (?d - day)
    :precondition (and
      (at vienna ?d)
      (used_day ?d)
      (need_vienna_7)
    )
    :effect (and
      (need_vienna_6)
      (not (need_vienna_7))
    )
  )

  (:action count_vienna_6_to_5
    :parameters (?d - day)
    :precondition (and
      (at vienna ?d)
      (used_day ?d)
      (need_vienna_6)
    )
    :effect (and
      (need_vienna_5)
      (not (need_vienna_6))
    )
  )

  (:action count_vienna_5_to_4
    :parameters (?d - day)
    :precondition (and
      (at vienna ?d)
      (used_day ?d)
      (need_vienna_5)
    )
    :effect (and
      (need_vienna_4)
      (not (need_vienna_5))
    )
  )

  (:action count_vienna_4_to_3
    :parameters (?d - day)
    :precondition (and
      (at vienna ?d)
      (used_day ?d)
      (need_vienna_4)
    )
    :effect (and
      (need_vienna_3)
      (not (need_vienna_4))
    )
  )

  (:action count_vienna_3_to_2
    :parameters (?d - day)
    :precondition (and
      (at vienna ?d)
      (used_day ?d)
      (need_vienna_3)
    )
    :effect (and
      (need_vienna_2)
      (not (need_vienna_3))
    )
  )

  (:action count_vienna_2_to_1
    :parameters (?d - day)
    :precondition (and
      (at vienna ?d)
      (used_day ?d)
      (need_vienna_2)
    )
    :effect (and
      (need_vienna_1)
      (not (need_vienna_2))
    )
  )

  (:action count_vienna_1_to_done
    :parameters (?d - day)
    :precondition (and
      (at vienna ?d)
      (used_day ?d)
      (need_vienna_1)
    )
    :effect (and
      (done_vienna)
      (not (need_vienna_1))
    )
  )

  (:action count_venice_4_to_3
    :parameters (?d - day)
    :precondition (and
      (at venice ?d)
      (used_day ?d)
      (need_venice_4)
    )
    :effect (and
      (need_venice_3)
      (not (need_venice_4))
    )
  )

  (:action count_venice_3_to_2
    :parameters (?d - day)
    :precondition (and
      (at venice ?d)
      (used_day ?d)
      (need_venice_3)
    )
    :effect (and
      (need_venice_2)
      (not (need_venice_3))
    )
  )

  (:action count_venice_2_to_1
    :parameters (?d - day)
    :precondition (and
      (at venice ?d)
      (used_day ?d)
      (need_venice_2)
    )
    :effect (and
      (need_venice_1)
      (not (need_venice_2))
    )
  )

  (:action count_venice_1_to_done
    :parameters (?d - day)
    :precondition (and
      (at venice ?d)
      (used_day ?d)
      (need_venice_1)
    )
    :effect (and
      (done_venice)
      (not (need_venice_1))
    )
  )

  (:action attend_wedding_day_8
    :parameters ()
    :precondition (and
      (at venice day_8)
      (used_day day_8)
      (not (wedding_attended))
    )
    :effect (wedding_attended)
  )

  (:action attend_wedding_day_9
    :parameters ()
    :precondition (and
      (at venice day_9)
      (used_day day_9)
      (not (wedding_attended))
    )
    :effect (wedding_attended)
  )

  (:action attend_wedding_day_10
    :parameters ()
    :precondition (and
      (at venice day_10)
      (used_day day_10)
      (not (wedding_attended))
    )
    :effect (wedding_attended)
  )

  (:action attend_wedding_day_11
    :parameters ()
    :precondition (and
      (at venice day_11)
      (used_day day_11)
      (not (wedding_attended))
    )
    :effect (wedding_attended)
  )
)