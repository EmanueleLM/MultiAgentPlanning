(define (problem european_trip_13_days_instance_problem)
  (:domain european_trip_13_days_instance)

  (:objects
    reykjavik milan split - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 day_12 day_13 - day
  )

  (:init
    (current_day day_1)
    (at milan)

    (next_day day_1 day_2)
    (next_day day_2 day_3)
    (next_day day_3 day_4)
    (next_day day_4 day_5)
    (next_day day_5 day_6)
    (next_day day_6 day_7)
    (next_day day_7 day_8)
    (next_day day_8 day_9)
    (next_day day_9 day_10)
    (next_day day_10 day_11)
    (next_day day_11 day_12)
    (next_day day_12 day_13)

    (direct_flight milan reykjavik)
    (direct_flight reykjavik milan)
    (direct_flight milan split)
    (direct_flight split milan)

    (counted milan day_1)
  )

  (:goal
    (and
      (current_day day_13)
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
      (split_window_hit)
    )
  )
)