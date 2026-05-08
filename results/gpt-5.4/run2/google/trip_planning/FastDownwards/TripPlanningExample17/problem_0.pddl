(define (problem european_trip_11_days_instance_problem)
  (:domain european_trip_11_days_instance)

  (:objects
    copenhagen vienna lyon - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 - day
  )

  (:init
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

    (direct copenhagen vienna)
    (direct vienna copenhagen)
    (direct vienna lyon)
    (direct lyon vienna)

    (cursor day_1)

    (unassigned day_1)
    (unassigned day_2)
    (unassigned day_3)
    (unassigned day_4)
    (unassigned day_5)
    (unassigned day_6)
    (unassigned day_7)
    (unassigned day_8)
    (unassigned day_9)
    (unassigned day_10)
    (unassigned day_11)

    (cp_count_0)
    (vi_count_0)
    (ly_count_0)
  )

  (:goal
    (and
      (at day_1 copenhagen)
      (at day_5 copenhagen)

      (cp_count_5)
      (vi_count_4)
      (ly_count_4)

      (not (unassigned day_1))
      (not (unassigned day_2))
      (not (unassigned day_3))
      (not (unassigned day_4))
      (not (unassigned day_5))
      (not (unassigned day_6))
      (not (unassigned day_7))
      (not (unassigned day_8))
      (not (unassigned day_9))
      (not (unassigned day_10))
      (not (unassigned day_11))
    )
  )
)