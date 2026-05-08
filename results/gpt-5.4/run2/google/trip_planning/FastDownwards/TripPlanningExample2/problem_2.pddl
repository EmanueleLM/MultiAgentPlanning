(define (problem european_trip_11_days_instance_problem)
  (:domain european_trip_11_days_instance)

  (:objects
    reykjavik vienna venice - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 - day
  )

  (:init
    (at reykjavik)
    (current_day day_1)

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

    (last_day day_11)

    (direct_flight reykjavik vienna)
    (direct_flight vienna reykjavik)
    (direct_flight vienna venice)
    (direct_flight venice vienna)

    (wedding_window day_8)
    (wedding_window day_9)
    (wedding_window day_10)
    (wedding_window day_11)
  )

  (:goal
    (and
      (wedding_attended)

      (visit_day reykjavik day_1)
      (visit_day reykjavik day_2)

      (visit_day vienna day_3)
      (visit_day vienna day_4)
      (visit_day vienna day_5)
      (visit_day vienna day_6)
      (visit_day vienna day_7)
      (visit_day vienna day_8)
      (visit_day vienna day_9)

      (visit_day venice day_8)
      (visit_day venice day_9)
      (visit_day venice day_10)
      (visit_day venice day_11)
    )
  )
)