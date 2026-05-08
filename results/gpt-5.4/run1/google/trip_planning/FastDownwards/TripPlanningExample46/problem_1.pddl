(define (problem european_trip_11_days_instance_problem)
  (:domain european_trip_11_days_instance)

  (:objects
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

    (direct manchester seville)
    (direct seville manchester)
    (direct stockholm manchester)
    (direct manchester stockholm)

    (at_day day_1 stockholm)

    (day_open day_2)
    (day_open day_3)
    (day_open day_4)
    (day_open day_5)
    (day_open day_6)
    (day_open day_7)
    (day_open day_8)
    (day_open day_9)
    (day_open day_10)
    (day_open day_11)

    (sev_count_0)
    (man_count_0)
    (sto_count_1)
  )

  (:goal
    (and
      (at_day day_3 stockholm)

      (sev_count_5)
      (man_count_5)
      (sto_count_3)

      (not (day_open day_2))
      (not (day_open day_3))
      (not (day_open day_4))
      (not (day_open day_5))
      (not (day_open day_6))
      (not (day_open day_7))
      (not (day_open day_8))
      (not (day_open day_9))
      (not (day_open day_10))
      (not (day_open day_11))

      (advanced_from day_1)
      (advanced_from day_2)
      (advanced_from day_3)
      (advanced_from day_4)
      (advanced_from day_5)
      (advanced_from day_6)
      (advanced_from day_7)
      (advanced_from day_8)
      (advanced_from day_9)
      (advanced_from day_10)
    )
  )
)