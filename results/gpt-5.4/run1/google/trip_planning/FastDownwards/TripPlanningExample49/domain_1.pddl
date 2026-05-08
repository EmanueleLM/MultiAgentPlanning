(define (domain european_trip_13_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city day
  )

  (:predicates
    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (at ?c - city)
    (direct_flight ?from - city ?to - city)
    (counted ?c - city ?d - day)
    (counted_used ?c - city ?d - day)
    (split_window_hit)
    (r_slot_1_filled)
    (r_slot_2_filled)
    (r_slot_3_filled)
    (r_slot_4_filled)
    (r_slot_5_filled)
    (m_slot_1_filled)
    (m_slot_2_filled)
    (m_slot_3_filled)
    (m_slot_4_filled)
    (m_slot_5_filled)
    (m_slot_6_filled)
    (m_slot_7_filled)
    (s_slot_1_filled)
    (s_slot_2_filled)
    (s_slot_3_filled)
  )

  (:action stay_reykjavik
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at reykjavik)
      (not (counted reykjavik ?d_next))
      (not (counted milan ?d_next))
      (not (counted split ?d_next))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (counted reykjavik ?d_next)
    )
  )

  (:action stay_milan
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at milan)
      (not (counted reykjavik ?d_next))
      (not (counted milan ?d_next))
      (not (counted split ?d_next))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (counted milan ?d_next)
    )
  )

  (:action stay_split
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at split)
      (not (counted reykjavik ?d_next))
      (not (counted milan ?d_next))
      (not (counted split ?d_next))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (counted split ?d_next)
    )
  )

  (:action fly_reykjavik_to_milan
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at reykjavik)
      (direct_flight reykjavik milan)
      (not (counted reykjavik ?d_next))
      (not (counted milan ?d_next))
      (not (counted split ?d_next))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at reykjavik))
      (at milan)
      (counted milan ?d_next)
    )
  )

  (:action fly_milan_to_reykjavik
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at milan)
      (direct_flight milan reykjavik)
      (not (counted reykjavik ?d_next))
      (not (counted milan ?d_next))
      (not (counted split ?d_next))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at milan))
      (at reykjavik)
      (counted reykjavik ?d_next)
    )
  )

  (:action fly_milan_to_split
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at milan)
      (direct_flight milan split)
      (not (counted reykjavik ?d_next))
      (not (counted milan ?d_next))
      (not (counted split ?d_next))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at milan))
      (at split)
      (counted split ?d_next)
    )
  )

  (:action fly_split_to_milan
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at split)
      (direct_flight split milan)
      (not (counted reykjavik ?d_next))
      (not (counted milan ?d_next))
      (not (counted split ?d_next))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at split))
      (at milan)
      (counted milan ?d_next)
    )
  )

  (:action assign_r_slot_1
    :parameters (?d - day)
    :precondition (and
      (counted reykjavik ?d)
      (not (counted_used reykjavik ?d))
      (not (r_slot_1_filled))
    )
    :effect (and
      (r_slot_1_filled)
      (counted_used reykjavik ?d)
    )
  )

  (:action assign_r_slot_2
    :parameters (?d - day)
    :precondition (and
      (counted reykjavik ?d)
      (not (counted_used reykjavik ?d))
      (r_slot_1_filled)
      (not (r_slot_2_filled))
    )
    :effect (and
      (r_slot_2_filled)
      (counted_used reykjavik ?d)
    )
  )

  (:action assign_r_slot_3
    :parameters (?d - day)
    :precondition (and
      (counted reykjavik ?d)
      (not (counted_used reykjavik ?d))
      (r_slot_2_filled)
      (not (r_slot_3_filled))
    )
    :effect (and
      (r_slot_3_filled)
      (counted_used reykjavik ?d)
    )
  )

  (:action assign_r_slot_4
    :parameters (?d - day)
    :precondition (and
      (counted reykjavik ?d)
      (not (counted_used reykjavik ?d))
      (r_slot_3_filled)
      (not (r_slot_4_filled))
    )
    :effect (and
      (r_slot_4_filled)
      (counted_used reykjavik ?d)
    )
  )

  (:action assign_r_slot_5
    :parameters (?d - day)
    :precondition (and
      (counted reykjavik ?d)
      (not (counted_used reykjavik ?d))
      (r_slot_4_filled)
      (not (r_slot_5_filled))
    )
    :effect (and
      (r_slot_5_filled)
      (counted_used reykjavik ?d)
    )
  )

  (:action assign_m_slot_1
    :parameters (?d - day)
    :precondition (and
      (counted milan ?d)
      (not (counted_used milan ?d))
      (not (m_slot_1_filled))
    )
    :effect (and
      (m_slot_1_filled)
      (counted_used milan ?d)
    )
  )

  (:action assign_m_slot_2
    :parameters (?d - day)
    :precondition (and
      (counted milan ?d)
      (not (counted_used milan ?d))
      (m_slot_1_filled)
      (not (m_slot_2_filled))
    )
    :effect (and
      (m_slot_2_filled)
      (counted_used milan ?d)
    )
  )

  (:action assign_m_slot_3
    :parameters (?d - day)
    :precondition (and
      (counted milan ?d)
      (not (counted_used milan ?d))
      (m_slot_2_filled)
      (not (m_slot_3_filled))
    )
    :effect (and
      (m_slot_3_filled)
      (counted_used milan ?d)
    )
  )

  (:action assign_m_slot_4
    :parameters (?d - day)
    :precondition (and
      (counted milan ?d)
      (not (counted_used milan ?d))
      (m_slot_3_filled)
      (not (m_slot_4_filled))
    )
    :effect (and
      (m_slot_4_filled)
      (counted_used milan ?d)
    )
  )

  (:action assign_m_slot_5
    :parameters (?d - day)
    :precondition (and
      (counted milan ?d)
      (not (counted_used milan ?d))
      (m_slot_4_filled)
      (not (m_slot_5_filled))
    )
    :effect (and
      (m_slot_5_filled)
      (counted_used milan ?d)
    )
  )

  (:action assign_m_slot_6
    :parameters (?d - day)
    :precondition (and
      (counted milan ?d)
      (not (counted_used milan ?d))
      (m_slot_5_filled)
      (not (m_slot_6_filled))
    )
    :effect (and
      (m_slot_6_filled)
      (counted_used milan ?d)
    )
  )

  (:action assign_m_slot_7
    :parameters (?d - day)
    :precondition (and
      (counted milan ?d)
      (not (counted_used milan ?d))
      (m_slot_6_filled)
      (not (m_slot_7_filled))
    )
    :effect (and
      (m_slot_7_filled)
      (counted_used milan ?d)
    )
  )

  (:action assign_s_slot_1
    :parameters (?d - day)
    :precondition (and
      (counted split ?d)
      (not (counted_used split ?d))
      (not (s_slot_1_filled))
    )
    :effect (and
      (s_slot_1_filled)
      (counted_used split ?d)
    )
  )

  (:action assign_s_slot_2
    :parameters (?d - day)
    :precondition (and
      (counted split ?d)
      (not (counted_used split ?d))
      (s_slot_1_filled)
      (not (s_slot_2_filled))
    )
    :effect (and
      (s_slot_2_filled)
      (counted_used split ?d)
    )
  )

  (:action assign_s_slot_3
    :parameters (?d - day)
    :precondition (and
      (counted split ?d)
      (not (counted_used split ?d))
      (s_slot_2_filled)
      (not (s_slot_3_filled))
    )
    :effect (and
      (s_slot_3_filled)
      (counted_used split ?d)
    )
  )

  (:action mark_split_window_day_1
    :parameters ()
    :precondition (and
      (counted split day_1)
      (not (split_window_hit))
    )
    :effect (and
      (split_window_hit)
    )
  )

  (:action mark_split_window_day_2
    :parameters ()
    :precondition (and
      (counted split day_2)
      (not (split_window_hit))
    )
    :effect (and
      (split_window_hit)
    )
  )

  (:action mark_split_window_day_3
    :parameters ()
    :precondition (and
      (counted split day_3)
      (not (split_window_hit))
    )
    :effect (and
      (split_window_hit)
    )
  )
)