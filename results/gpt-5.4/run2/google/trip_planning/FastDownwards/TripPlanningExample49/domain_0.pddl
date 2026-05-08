(define (domain european_trip_13_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city day
  )

  (:predicates
    (direct ?from - city ?to - city)
    (next_day ?d1 - day ?d2 - day)

    (current_day ?d - day)
    (trip_complete)
    (processed ?d - day)

    (at ?c - city ?d - day)

    (start_unset)
    (met_split_window)

    (need_reykjavik_day_1)
    (need_reykjavik_day_2)
    (need_reykjavik_day_3)
    (need_reykjavik_day_4)
    (need_reykjavik_day_5)

    (need_milan_day_1)
    (need_milan_day_2)
    (need_milan_day_3)
    (need_milan_day_4)
    (need_milan_day_5)
    (need_milan_day_6)
    (need_milan_day_7)

    (need_split_day_1)
    (need_split_day_2)
    (need_split_day_3)
  )

  (:action choose_start_reykjavik
    :parameters ()
    :precondition (and
      (start_unset)
      (current_day day_1)
      (not (at reykjavik day_1))
      (not (at milan day_1))
      (not (at split day_1))
    )
    :effect (and
      (at reykjavik day_1)
      (need_reykjavik_day_1)
      (not (start_unset))
    )
  )

  (:action choose_start_milan
    :parameters ()
    :precondition (and
      (start_unset)
      (current_day day_1)
      (not (at reykjavik day_1))
      (not (at milan day_1))
      (not (at split day_1))
    )
    :effect (and
      (at milan day_1)
      (need_milan_day_1)
      (not (start_unset))
    )
  )

  (:action choose_start_split
    :parameters ()
    :precondition (and
      (start_unset)
      (current_day day_1)
      (not (at reykjavik day_1))
      (not (at milan day_1))
      (not (at split day_1))
    )
    :effect (and
      (at split day_1)
      (need_split_day_1)
      (met_split_window)
      (not (start_unset))
    )
  )

  (:action stay_reykjavik_day_1_day_2
    :parameters ()
    :precondition (and
      (current_day day_1)
      (next_day day_1 day_2)
      (at reykjavik day_1)
      (not (processed day_1))
      (not (start_unset))
    )
    :effect (and
      (at reykjavik day_2)
      (need_reykjavik_day_2)
      (processed day_1)
      (not (current_day day_1))
      (current_day day_2)
    )
  )

  (:action stay_milan_day_1_day_2
    :parameters ()
    :precondition (and
      (current_day day_1)
      (next_day day_1 day_2)
      (at milan day_1)
      (not (processed day_1))
      (not (start_unset))
    )
    :effect (and
      (at milan day_2)
      (need_milan_day_2)
      (processed day_1)
      (not (current_day day_1))
      (current_day day_2)
    )
  )

  (:action stay_split_day_1_day_2
    :parameters ()
    :precondition (and
      (current_day day_1)
      (next_day day_1 day_2)
      (at split day_1)
      (not (processed day_1))
      (not (start_unset))
    )
    :effect (and
      (at split day_2)
      (need_split_day_2)
      (met_split_window)
      (processed day_1)
      (not (current_day day_1))
      (current_day day_2)
    )
  )

  (:action fly_reykjavik_to_milan_day_1_day_2
    :parameters ()
    :precondition (and
      (current_day day_1)
      (next_day day_1 day_2)
      (at reykjavik day_1)
      (direct reykjavik milan)
      (not (processed day_1))
      (not (start_unset))
    )
    :effect (and
      (at milan day_2)
      (need_milan_day_2)
      (processed day_1)
      (not (current_day day_1))
      (current_day day_2)
    )
  )

  (:action fly_milan_to_reykjavik_day_1_day_2
    :parameters ()
    :precondition (and
      (current_day day_1)
      (next_day day_1 day_2)
      (at milan day_1)
      (direct milan reykjavik)
      (not (processed day_1))
      (not (start_unset))
    )
    :effect (and
      (at reykjavik day_2)
      (need_reykjavik_day_2)
      (processed day_1)
      (not (current_day day_1))
      (current_day day_2)
    )
  )

  (:action fly_milan_to_split_day_1_day_2
    :parameters ()
    :precondition (and
      (current_day day_1)
      (next_day day_1 day_2)
      (at milan day_1)
      (direct milan split)
      (not (processed day_1))
      (not (start_unset))
    )
    :effect (and
      (at split day_2)
      (need_split_day_2)
      (met_split_window)
      (processed day_1)
      (not (current_day day_1))
      (current_day day_2)
    )
  )

  (:action fly_split_to_milan_day_1_day_2
    :parameters ()
    :precondition (and
      (current_day day_1)
      (next_day day_1 day_2)
      (at split day_1)
      (direct split milan)
      (not (processed day_1))
      (not (start_unset))
    )
    :effect (and
      (at milan day_2)
      (need_milan_day_2)
      (processed day_1)
      (not (current_day day_1))
      (current_day day_2)
    )
  )

  (:action stay_reykjavik_day_2_day_3
    :parameters ()
    :precondition (and
      (current_day day_2)
      (next_day day_2 day_3)
      (at reykjavik day_2)
      (not (processed day_2))
      (not (start_unset))
    )
    :effect (and
      (at reykjavik day_3)
      (need_reykjavik_day_3)
      (processed day_2)
      (not (current_day day_2))
      (current_day day_3)
    )
  )

  (:action stay_milan_day_2_day_3
    :parameters ()
    :precondition (and
      (current_day day_2)
      (next_day day_2 day_3)
      (at milan day_2)
      (not (processed day_2))
      (not (start_unset))
    )
    :effect (and
      (at milan day_3)
      (need_milan_day_3)
      (processed day_2)
      (not (current_day day_2))
      (current_day day_3)
    )
  )

  (:action stay_split_day_2_day_3
    :parameters ()
    :precondition (and
      (current_day day_2)
      (next_day day_2 day_3)
      (at split day_2)
      (not (processed day_2))
      (not (start_unset))
    )
    :effect (and
      (at split day_3)
      (need_split_day_3)
      (met_split_window)
      (processed day_2)
      (not (current_day day_2))
      (current_day day_3)
    )
  )

  (:action fly_reykjavik_to_milan_day_2_day_3
    :parameters ()
    :precondition (and
      (current_day day_2)
      (next_day day_2 day_3)
      (at reykjavik day_2)
      (direct reykjavik milan)
      (not (processed day_2))
      (not (start_unset))
    )
    :effect (and
      (at milan day_3)
      (need_milan_day_3)
      (processed day_2)
      (not (current_day day_2))
      (current_day day_3)
    )
  )

  (:action fly_milan_to_reykjavik_day_2_day_3
    :parameters ()
    :precondition (and
      (current_day day_2)
      (next_day day_2 day_3)
      (at milan day_2)
      (direct milan reykjavik)
      (not (processed day_2))
      (not (start_unset))
    )
    :effect (and
      (at reykjavik day_3)
      (need_reykjavik_day_3)
      (processed day_2)
      (not (current_day day_2))
      (current_day day_3)
    )
  )

  (:action fly_milan_to_split_day_2_day_3
    :parameters ()
    :precondition (and
      (current_day day_2)
      (next_day day_2 day_3)
      (at milan day_2)
      (direct milan split)
      (not (processed day_2))
      (not (start_unset))
    )
    :effect (and
      (at split day_3)
      (need_split_day_3)
      (met_split_window)
      (processed day_2)
      (not (current_day day_2))
      (current_day day_3)
    )
  )

  (:action fly_split_to_milan_day_2_day_3
    :parameters ()
    :precondition (and
      (current_day day_2)
      (next_day day_2 day_3)
      (at split day_2)
      (direct split milan)
      (not (processed day_2))
      (not (start_unset))
    )
    :effect (and
      (at milan day_3)
      (need_milan_day_3)
      (processed day_2)
      (not (current_day day_2))
      (current_day day_3)
    )
  )

  (:action stay_reykjavik_day_3_day_4
    :parameters ()
    :precondition (and
      (current_day day_3)
      (next_day day_3 day_4)
      (at reykjavik day_3)
      (not (processed day_3))
      (not (start_unset))
    )
    :effect (and
      (at reykjavik day_4)
      (need_reykjavik_day_4)
      (processed day_3)
      (not (current_day day_3))
      (current_day day_4)
    )
  )

  (:action stay_milan_day_3_day_4
    :parameters ()
    :precondition (and
      (current_day day_3)
      (next_day day_3 day_4)
      (at milan day_3)
      (not (processed day_3))
      (not (start_unset))
    )
    :effect (and
      (at milan day_4)
      (need_milan_day_4)
      (processed day_3)
      (not (current_day day_3))
      (current_day day_4)
    )
  )

  (:action stay_split_day_3_day_4
    :parameters ()
    :precondition (and
      (current_day day_3)
      (next_day day_3 day_4)
      (at split day_3)
      (not (processed day_3))
      (not (start_unset))
    )
    :effect (and
      (at split day_4)
      (processed day_3)
      (not (current_day day_3))
      (current_day day_4)
    )
  )

  (:action fly_reykjavik_to_milan_day_3_day_4
    :parameters ()
    :precondition (and
      (current_day day_3)
      (next_day day_3 day_4)
      (at reykjavik day_3)
      (direct reykjavik milan)
      (not (processed day_3))
      (not (start_unset))
    )
    :effect (and
      (at milan day_4)
      (need_milan_day_4)
      (processed day_3)
      (not (current_day day_3))
      (current_day day_4)
    )
  )

  (:action fly_milan_to_reykjavik_day_3_day_4
    :parameters ()
    :precondition (and
      (current_day day_3)
      (next_day day_3 day_4)
      (at milan day_3)
      (direct milan reykjavik)
      (not (processed day_3))
      (not (start_unset))
    )
    :effect (and
      (at reykjavik day_4)
      (need_reykjavik_day_4)
      (processed day_3)
      (not (current_day day_3))
      (current_day day_4)
    )
  )

  (:action fly_milan_to_split_day_3_day_4
    :parameters ()
    :precondition (and
      (current_day day_3)
      (next_day day_3 day_4)
      (at milan day_3)
      (direct milan split)
      (not (processed day_3))
      (not (start_unset))
    )
    :effect (and
      (at split day_4)
      (processed day_3)
      (not (current_day day_3))
      (current_day day_4)
    )
  )

  (:action fly_split_to_milan_day_3_day_4
    :parameters ()
    :precondition (and
      (current_day day_3)
      (next_day day_3 day_4)
      (at split day_3)
      (direct split milan)
      (not (processed day_3))
      (not (start_unset))
    )
    :effect (and
      (at milan day_4)
      (need_milan_day_4)
      (processed day_3)
      (not (current_day day_3))
      (current_day day_4)
    )
  )

  (:action stay_reykjavik_day_4_day_5
    :parameters ()
    :precondition (and
      (current_day day_4)
      (next_day day_4 day_5)
      (at reykjavik day_4)
      (not (processed day_4))
      (not (start_unset))
    )
    :effect (and
      (at reykjavik day_5)
      (need_reykjavik_day_5)
      (processed day_4)
      (not (current_day day_4))
      (current_day day_5)
    )
  )

  (:action stay_milan_day_4_day_5
    :parameters ()
    :precondition (and
      (current_day day_4)
      (next_day day_4 day_5)
      (at milan day_4)
      (not (processed day_4))
      (not (start_unset))
    )
    :effect (and
      (at milan day_5)
      (need_milan_day_5)
      (processed day_4)
      (not (current_day day_4))
      (current_day day_5)
    )
  )

  (:action stay_split_day_4_day_5
    :parameters ()
    :precondition (and
      (current_day day_4)
      (next_day day_4 day_5)
      (at split day_4)
      (not (processed day_4))
      (not (start_unset))
    )
    :effect (and
      (at split day_5)
      (processed day_4)
      (not (current_day day_4))
      (current_day day_5)
    )
  )

  (:action fly_reykjavik_to_milan_day_4_day_5
    :parameters ()
    :precondition (and
      (current_day day_4)
      (next_day day_4 day_5)
      (at reykjavik day_4)
      (direct reykjavik milan)
      (not (processed day_4))
      (not (start_unset))
    )
    :effect (and
      (at milan day_5)
      (need_milan_day_5)
      (processed day_4)
      (not (current_day day_4))
      (current_day day_5)
    )
  )

  (:action fly_milan_to_reykjavik_day_4_day_5
    :parameters ()
    :precondition (and
      (current_day day_4)
      (next_day day_4 day_5)
      (at milan day_4)
      (direct milan reykjavik)
      (not (processed day_4))
      (not (start_unset))
    )
    :effect (and
      (at reykjavik day_5)
      (need_reykjavik_day_5)
      (processed day_4)
      (not (current_day day_4))
      (current_day day_5)
    )
  )

  (:action fly_milan_to_split_day_4_day_5
    :parameters ()
    :precondition (and
      (current_day day_4)
      (next_day day_4 day_5)
      (at milan day_4)
      (direct milan split)
      (not (processed day_4))
      (not (start_unset))
    )
    :effect (and
      (at split day_5)
      (processed day_4)
      (not (current_day day_4))
      (current_day day_5)
    )
  )

  (:action fly_split_to_milan_day_4_day_5
    :parameters ()
    :precondition (and
      (current_day day_4)
      (next_day day_4 day_5)
      (at split day_4)
      (direct split milan)
      (not (processed day_4))
      (not (start_unset))
    )
    :effect (and
      (at milan day_5)
      (need_milan_day_5)
      (processed day_4)
      (not (current_day day_4))
      (current_day day_5)
    )
  )

  (:action stay_reykjavik_day_5_day_6
    :parameters ()
    :precondition (and
      (current_day day_5)
      (next_day day_5 day_6)
      (at reykjavik day_5)
      (not (processed day_5))
      (not (start_unset))
    )
    :effect (and
      (at reykjavik day_6)
      (processed day_5)
      (not (current_day day_5))
      (current_day day_6)
    )
  )

  (:action stay_milan_day_5_day_6
    :parameters ()
    :precondition (and
      (current_day day_5)
      (next_day day_5 day_6)
      (at milan day_5)
      (not (processed day_5))
      (not (start_unset))
    )
    :effect (and
      (at milan day_6)
      (need_milan_day_6)
      (processed day_5)
      (not (current_day day_5))
      (current_day day_6)
    )
  )

  (:action stay_split_day_5_day_6
    :parameters ()
    :precondition (and
      (current_day day_5)
      (next_day day_5 day_6)
      (at split day_5)
      (not (processed day_5))
      (not (start_unset))
    )
    :effect (and
      (at split day_6)
      (processed day_5)
      (not (current_day day_5))
      (current_day day_6)
    )
  )

  (:action fly_reykjavik_to_milan_day_5_day_6
    :parameters ()
    :precondition (and
      (current_day day_5)
      (next_day day_5 day_6)
      (at reykjavik day_5)
      (direct reykjavik milan)
      (not (processed day_5))
      (not (start_unset))
    )
    :effect (and
      (at milan day_6)
      (need_milan_day_6)
      (processed day_5)
      (not (current_day day_5))
      (current_day day_6)
    )
  )

  (:action fly_milan_to_reykjavik_day_5_day_6
    :parameters ()
    :precondition (and
      (current_day day_5)
      (next_day day_5 day_6)
      (at milan day_5)
      (direct milan reykjavik)
      (not (processed day_5))
      (not (start_unset))
    )
    :effect (and
      (at reykjavik day_6)
      (processed day_5)
      (not (current_day day_5))
      (current_day day_6)
    )
  )

  (:action fly_milan_to_split_day_5_day_6
    :parameters ()
    :precondition (and
      (current_day day_5)
      (next_day day_5 day_6)
      (at milan day_5)
      (direct milan split)
      (not (processed day_5))
      (not (start_unset))
    )
    :effect (and
      (at split day_6)
      (processed day_5)
      (not (current_day day_5))
      (current_day day_6)
    )
  )

  (:action fly_split_to_milan_day_5_day_6
    :parameters ()
    :precondition (and
      (current_day day_5)
      (next_day day_5 day_6)
      (at split day_5)
      (direct split milan)
      (not (processed day_5))
      (not (start_unset))
    )
    :effect (and
      (at milan day_6)
      (need_milan_day_6)
      (processed day_5)
      (not (current_day day_5))
      (current_day day_6)
    )
  )

  (:action stay_reykjavik_day_6_day_7
    :parameters ()
    :precondition (and
      (current_day day_6)
      (next_day day_6 day_7)
      (at reykjavik day_6)
      (not (processed day_6))
      (not (start_unset))
    )
    :effect (and
      (at reykjavik day_7)
      (processed day_6)
      (not (current_day day_6))
      (current_day day_7)
    )
  )

  (:action stay_milan_day_6_day_7
    :parameters ()
    :precondition (and
      (current_day day_6)
      (next_day day_6 day_7)
      (at milan day_6)
      (not (processed day_6))
      (not (start_unset))
    )
    :effect (and
      (at milan day_7)
      (need_milan_day_7)
      (processed day_6)
      (not (current_day day_6))
      (current_day day_7)
    )
  )

  (:action stay_split_day_6_day_7
    :parameters ()
    :precondition (and
      (current_day day_6)
      (next_day day_6 day_7)
      (at split day_6)
      (not (processed day_6))
      (not (start_unset))
    )
    :effect (and
      (at split day_7)
      (processed day_6)
      (not (current_day day_6))
      (current_day day_7)
    )
  )

  (:action fly_reykjavik_to_milan_day_6_day_7
    :parameters ()
    :precondition (and
      (current_day day_6)
      (next_day day_6 day_7)
      (at reykjavik day_6)
      (direct reykjavik milan)
      (not (processed day_6))
      (not (start_unset))
    )
    :effect (and
      (at milan day_7)
      (need_milan_day_7)
      (processed day_6)
      (not (current_day day_6))
      (current_day day_7)
    )
  )

  (:action fly_milan_to_reykjavik_day_6_day_7
    :parameters ()
    :precondition (and
      (current_day day_6)
      (next_day day_6 day_7)
      (at milan day_6)
      (direct milan reykjavik)
      (not (processed day_6))
      (not (start_unset))
    )
    :effect (and
      (at reykjavik day_7)
      (processed day_6)
      (not (current_day day_6))
      (current_day day_7)
    )
  )

  (:action fly_milan_to_split_day_6_day_7
    :parameters ()
    :precondition (and
      (current_day day_6)
      (next_day day_6 day_7)
      (at milan day_6)
      (direct milan split)
      (not (processed day_6))
      (not (start_unset))
    )
    :effect (and
      (at split day_7)
      (processed day_6)
      (not (current_day day_6))
      (current_day day_7)
    )
  )

  (:action fly_split_to_milan_day_6_day_7
    :parameters ()
    :precondition (and
      (current_day day_6)
      (next_day day_6 day_7)
      (at split day_6)
      (direct split milan)
      (not (processed day_6))
      (not (start_unset))
    )
    :effect (and
      (at milan day_7)
      (need_milan_day_7)
      (processed day_6)
      (not (current_day day_6))
      (current_day day_7)
    )
  )

  (:action stay_reykjavik_day_7_day_8
    :parameters ()
    :precondition (and
      (current_day day_7)
      (next_day day_7 day_8)
      (at reykjavik day_7)
      (not (processed day_7))
      (not (start_unset))
    )
    :effect (and
      (at reykjavik day_8)
      (processed day_7)
      (not (current_day day_7))
      (current_day day_8)
    )
  )

  (:action stay_milan_day_7_day_8
    :parameters ()
    :precondition (and
      (current_day day_7)
      (next_day day_7 day_8)
      (at milan day_7)
      (not (processed day_7))
      (not (start_unset))
    )
    :effect (and
      (at milan day_8)
      (processed day_7)
      (not (current_day day_7))
      (current_day day_8)
    )
  )

  (:action stay_split_day_7_day_8
    :parameters ()
    :precondition (and
      (current_day day_7)
      (next_day day_7 day_8)
      (at split day_7)
      (not (processed day_7))
      (not (start_unset))
    )
    :effect (and
      (at split day_8)
      (processed day_7)
      (not (current_day day_7))
      (current_day day_8)
    )
  )

  (:action fly_reykjavik_to_milan_day_7_day_8
    :parameters ()
    :precondition (and
      (current_day day_7)
      (next_day day_7 day_8)
      (at reykjavik day_7)
      (direct reykjavik milan)
      (not (processed day_7))
      (not (start_unset))
    )
    :effect (and
      (at milan day_8)
      (processed day_7)
      (not (current_day day_7))
      (current_day day_8)
    )
  )

  (:action fly_milan_to_reykjavik_day_7_day_8
    :parameters ()
    :precondition (and
      (current_day day_7)
      (next_day day_7 day_8)
      (at milan day_7)
      (direct milan reykjavik)
      (not (processed day_7))
      (not (start_unset))
    )
    :effect (and
      (at reykjavik day_8)
      (processed day_7)
      (not (current_day day_7))
      (current_day day_8)
    )
  )

  (:action fly_milan_to_split_day_7_day_8
    :parameters ()
    :precondition (and
      (current_day day_7)
      (next_day day_7 day_8)
      (at milan day_7)
      (direct milan split)
      (not (processed day_7))
      (not (start_unset))
    )
    :effect (and
      (at split day_8)
      (processed day_7)
      (not (current_day day_7))
      (current_day day_8)
    )
  )

  (:action fly_split_to_milan_day_7_day_8
    :parameters ()
    :precondition (and
      (current_day day_7)
      (next_day day_7 day_8)
      (at split day_7)
      (direct split milan)
      (not (processed day_7))
      (not (start_unset))
    )
    :effect (and
      (at milan day_8)
      (processed day_7)
      (not (current_day day_7))
      (current_day day_8)
    )
  )

  (:action stay_reykjavik_day_8_day_9
    :parameters ()
    :precondition (and
      (current_day day_8)
      (next_day day_8 day_9)
      (at reykjavik day_8)
      (not (processed day_8))
      (not (start_unset))
    )
    :effect (and
      (at reykjavik day_9)
      (processed day_8)
      (not (current_day day_8))
      (current_day day_9)
    )
  )

  (:action stay_milan_day_8_day_9
    :parameters ()
    :precondition (and
      (current_day day_8)
      (next_day day_8 day_9)
      (at milan day_8)
      (not (processed day_8))
      (not (start_unset))
    )
    :effect (and
      (at milan day_9)
      (processed day_8)
      (not (current_day day_8))
      (current_day day_9)
    )
  )

  (:action stay_split_day_8_day_9
    :parameters ()
    :precondition (and
      (current_day day_8)
      (next_day day_8 day_9)
      (at split day_8)
      (not (processed day_8))
      (not (start_unset))
    )
    :effect (and
      (at split day_9)
      (processed day_8)
      (not (current_day day_8))
      (current_day day_9)
    )
  )

  (:action fly_reykjavik_to_milan_day_8_day_9
    :parameters ()
    :precondition (and
      (current_day day_8)
      (next_day day_8 day_9)
      (at reykjavik day_8)
      (direct reykjavik milan)
      (not (processed day_8))
      (not (start_unset))
    )
    :effect (and
      (at milan day_9)
      (processed day_8)
      (not (current_day day_8))
      (current_day day_9)
    )
  )

  (:action fly_milan_to_reykjavik_day_8_day_9
    :parameters ()
    :precondition (and
      (current_day day_8)
      (next_day day_8 day_9)
      (at milan day_8)
      (direct milan reykjavik)
      (not (processed day_8))
      (not (start_unset))
    )
    :effect (and
      (at reykjavik day_9)
      (processed day_8)
      (not (current_day day_8))
      (current_day day_9)
    )
  )

  (:action fly_milan_to_split_day_8_day_9
    :parameters ()
    :precondition (and
      (current_day day_8)
      (next_day day_8 day_9)
      (at milan day_8)
      (direct milan split)
      (not (processed day_8))
      (not (start_unset))
    )
    :effect (and
      (at split day_9)
      (processed day_8)
      (not (current_day day_8))
      (current_day day_9)
    )
  )

  (:action fly_split_to_milan_day_8_day_9
    :parameters ()
    :precondition (and
      (current_day day_8)
      (next_day day_8 day_9)
      (at split day_8)
      (direct split milan)
      (not (processed day_8))
      (not (start_unset))
    )
    :effect (and
      (at milan day_9)
      (processed day_8)
      (not (current_day day_8))
      (current_day day_9)
    )
  )

  (:action stay_reykjavik_day_9_day_10
    :parameters ()
    :precondition (and
      (current_day day_9)
      (next_day day_9 day_10)
      (at reykjavik day_9)
      (not (processed day_9))
      (not (start_unset))
    )
    :effect (and
      (at reykjavik day_10)
      (processed day_9)
      (not (current_day day_9))
      (current_day day_10)
    )
  )

  (:action stay_milan_day_9_day_10
    :parameters ()
    :precondition (and
      (current_day day_9)
      (next_day day_9 day_10)
      (at milan day_9)
      (not (processed day_9))
      (not (start_unset))
    )
    :effect (and
      (at milan day_10)
      (processed day_9)
      (not (current_day day_9))
      (current_day day_10)
    )
  )

  (:action stay_split_day_9_day_10
    :parameters ()
    :precondition (and
      (current_day day_9)
      (next_day day_9 day_10)
      (at split day_9)
      (not (processed day_9))
      (not (start_unset))
    )
    :effect (and
      (at split day_10)
      (processed day_9)
      (not (current_day day_9))
      (current_day day_10)
    )
  )

  (:action fly_reykjavik_to_milan_day_9_day_10
    :parameters ()
    :precondition (and
      (current_day day_9)
      (next_day day_9 day_10)
      (at reykjavik day_9)
      (direct reykjavik milan)
      (not (processed day_9))
      (not (start_unset))
    )
    :effect (and
      (at milan day_10)
      (processed day_9)
      (not (current_day day_9))
      (current_day day_10)
    )
  )

  (:action fly_milan_to_reykjavik_day_9_day_10
    :parameters ()
    :precondition (and
      (current_day day_9)
      (next_day day_9 day_10)
      (at milan day_9)
      (direct milan reykjavik)
      (not (processed day_9))
      (not (start_unset))
    )
    :effect (and
      (at reykjavik day_10)
      (processed day_9)
      (not (current_day day_9))
      (current_day day_10)
    )
  )

  (:action fly_milan_to_split_day_9_day_10
    :parameters ()
    :precondition (and
      (current_day day_9)
      (next_day day_9 day_10)
      (at milan day_9)
      (direct milan split)
      (not (processed day_9))
      (not (start_unset))
    )
    :effect (and
      (at split day_10)
      (processed day_9)
      (not (current_day day_9))
      (current_day day_10)
    )
  )

  (:action fly_split_to_milan_day_9_day_10
    :parameters ()
    :precondition (and
      (current_day day_9)
      (next_day day_9 day_10)
      (at split day_9)
      (direct split milan)
      (not (processed day_9))
      (not (start_unset))
    )
    :effect (and
      (at milan day_10)
      (processed day_9)
      (not (current_day day_9))
      (current_day day_10)
    )
  )

  (:action stay_reykjavik_day_10_day_11
    :parameters ()
    :precondition (and
      (current_day day_10)
      (next_day day_10 day_11)
      (at reykjavik day_10)
      (not (processed day_10))
      (not (start_unset))
    )
    :effect (and
      (at reykjavik day_11)
      (processed day_10)
      (not (current_day day_10))
      (current_day day_11)
    )
  )

  (:action stay_milan_day_10_day_11
    :parameters ()
    :precondition (and
      (current_day day_10)
      (next_day day_10 day_11)
      (at milan day_10)
      (not (processed day_10))
      (not (start_unset))
    )
    :effect (and
      (at milan day_11)
      (processed day_10)
      (not (current_day day_10))
      (current_day day_11)
    )
  )

  (:action stay_split_day_10_day_11
    :parameters ()
    :precondition (and
      (current_day day_10)
      (next_day day_10 day_11)
      (at split day_10)
      (not (processed day_10))
      (not (start_unset))
    )
    :effect (and
      (at split day_11)
      (processed day_10)
      (not (current_day day_10))
      (current_day day_11)
    )
  )

  (:action fly_reykjavik_to_milan_day_10_day_11
    :parameters ()
    :precondition (and
      (current_day day_10)
      (next_day day_10 day_11)
      (at reykjavik day_10)
      (direct reykjavik milan)
      (not (processed day_10))
      (not (start_unset))
    )
    :effect (and
      (at milan day_11)
      (processed day_10)
      (not (current_day day_10))
      (current_day day_11)
    )
  )

  (:action fly_milan_to_reykjavik_day_10_day_11
    :parameters ()
    :precondition (and
      (current_day day_10)
      (next_day day_10 day_11)
      (at milan day_10)
      (direct milan reykjavik)
      (not (processed day_10))
      (not (start_unset))
    )
    :effect (and
      (at reykjavik day_11)
      (processed day_10)
      (not (current_day day_10))
      (current_day day_11)
    )
  )

  (:action fly_milan_to_split_day_10_day_11
    :parameters ()
    :precondition (and
      (current_day day_10)
      (next_day day_10 day_11)
      (at milan day_10)
      (direct milan split)
      (not (processed day_10))
      (not (start_unset))
    )
    :effect (and
      (at split day_11)
      (processed day_10)
      (not (current_day day_10))
      (current_day day_11)
    )
  )

  (:action fly_split_to_milan_day_10_day_11
    :parameters ()
    :precondition (and
      (current_day day_10)
      (next_day day_10 day_11)
      (at split day_10)
      (direct split milan)
      (not (processed day_10))
      (not (start_unset))
    )
    :effect (and
      (at milan day_11)
      (processed day_10)
      (not (current_day day_10))
      (current_day day_11)
    )
  )

  (:action stay_reykjavik_day_11_day_12
    :parameters ()
    :precondition (and
      (current_day day_11)
      (next_day day_11 day_12)
      (at reykjavik day_11)
      (not (processed day_11))
      (not (start_unset))
    )
    :effect (and
      (at reykjavik day_12)
      (processed day_11)
      (not (current_day day_11))
      (current_day day_12)
    )
  )

  (:action stay_milan_day_11_day_12
    :parameters ()
    :precondition (and
      (current_day day_11)
      (next_day day_11 day_12)
      (at milan day_11)
      (not (processed day_11))
      (not (start_unset))
    )
    :effect (and
      (at milan day_12)
      (processed day_11)
      (not (current_day day_11))
      (current_day day_12)
    )
  )

  (:action stay_split_day_11_day_12
    :parameters ()
    :precondition (and
      (current_day day_11)
      (next_day day_11 day_12)
      (at split day_11)
      (not (processed day_11))
      (not (start_unset))
    )
    :effect (and
      (at split day_12)
      (processed day_11)
      (not (current_day day_11))
      (current_day day_12)
    )
  )

  (:action fly_reykjavik_to_milan_day_11_day_12
    :parameters ()
    :precondition (and
      (current_day day_11)
      (next_day day_11 day_12)
      (at reykjavik day_11)
      (direct reykjavik milan)
      (not (processed day_11))
      (not (start_unset))
    )
    :effect (and
      (at milan day_12)
      (processed day_11)
      (not (current_day day_11))
      (current_day day_12)
    )
  )

  (:action fly_milan_to_reykjavik_day_11_day_12
    :parameters ()
    :precondition (and
      (current_day day_11)
      (next_day day_11 day_12)
      (at milan day_11)
      (direct milan reykjavik)
      (not (processed day_11))
      (not (start_unset))
    )
    :effect (and
      (at reykjavik day_12)
      (processed day_11)
      (not (current_day day_11))
      (current_day day_12)
    )
  )

  (:action fly_milan_to_split_day_11_day_12
    :parameters ()
    :precondition (and
      (current_day day_11)
      (next_day day_11 day_12)
      (at milan day_11)
      (direct milan split)
      (not (processed day_11))
      (not (start_unset))
    )
    :effect (and
      (at split day_12)
      (processed day_11)
      (not (current_day day_11))
      (current_day day_12)
    )
  )

  (:action fly_split_to_milan_day_11_day_12
    :parameters ()
    :precondition (and
      (current_day day_11)
      (next_day day_11 day_12)
      (at split day_11)
      (direct split milan)
      (not (processed day_11))
      (not (start_unset))
    )
    :effect (and
      (at milan day_12)
      (processed day_11)
      (not (current_day day_11))
      (current_day day_12)
    )
  )

  (:action stay_reykjavik_day_12_day_13
    :parameters ()
    :precondition (and
      (current_day day_12)
      (next_day day_12 day_13)
      (at reykjavik day_12)
      (not (processed day_12))
      (not (start_unset))
    )
    :effect (and
      (at reykjavik day_13)
      (processed day_12)
      (not (current_day day_12))
      (current_day day_13)
    )
  )

  (:action stay_milan_day_12_day_13
    :parameters ()
    :precondition (and
      (current_day day_12)
      (next_day day_12 day_13)
      (at milan day_12)
      (not (processed day_12))
      (not (start_unset))
    )
    :effect (and
      (at milan day_13)
      (processed day_12)
      (not (current_day day_12))
      (current_day day_13)
    )
  )

  (:action stay_split_day_12_day_13
    :parameters ()
    :precondition (and
      (current_day day_12)
      (next_day day_12 day_13)
      (at split day_12)
      (not (processed day_12))
      (not (start_unset))
    )
    :effect (and
      (at split day_13)
      (processed day_12)
      (not (current_day day_12))
      (current_day day_13)
    )
  )

  (:action fly_reykjavik_to_milan_day_12_day_13
    :parameters ()
    :precondition (and
      (current_day day_12)
      (next_day day_12 day_13)
      (at reykjavik day_12)
      (direct reykjavik milan)
      (not (processed day_12))
      (not (start_unset))
    )
    :effect (and
      (at milan day_13)
      (processed day_12)
      (not (current_day day_12))
      (current_day day_13)
    )
  )

  (:action fly_milan_to_reykjavik_day_12_day_13
    :parameters ()
    :precondition (and
      (current_day day_12)
      (next_day day_12 day_13)
      (at milan day_12)
      (direct milan reykjavik)
      (not (processed day_12))
      (not (start_unset))
    )
    :effect (and
      (at reykjavik day_13)
      (processed day_12)
      (not (current_day day_12))
      (current_day day_13)
    )
  )

  (:action fly_milan_to_split_day_12_day_13
    :parameters ()
    :precondition (and
      (current_day day_12)
      (next_day day_12 day_13)
      (at milan day_12)
      (direct milan split)
      (not (processed day_12))
      (not (start_unset))
    )
    :effect (and
      (at split day_13)
      (processed day_12)
      (not (current_day day_12))
      (current_day day_13)
    )
  )

  (:action fly_split_to_milan_day_12_day_13
    :parameters ()
    :precondition (and
      (current_day day_12)
      (next_day day_12 day_13)
      (at split day_12)
      (direct split milan)
      (not (processed day_12))
      (not (start_unset))
    )
    :effect (and
      (at milan day_13)
      (processed day_12)
      (not (current_day day_12))
      (current_day day_13)
    )
  )

  (:action finish_trip
    :parameters ()
    :precondition (and
      (current_day day_13)
      (not (start_unset))
    )
    :effect (and
      (trip_complete)
      (not (current_day day_13))
    )
  )
)