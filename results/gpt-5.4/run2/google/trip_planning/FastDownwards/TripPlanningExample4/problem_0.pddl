(define (problem european_trip_12_days_instance_problem)
  (:domain european_trip_12_days_instance)

  (:objects
    seville munich tallinn - city

    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 day_12 - day

    c0 c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 c11 c12 - count
  )

  (:init
    (direct seville munich)
    (direct munich seville)
    (direct munich tallinn)
    (direct tallinn munich)

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
    (last_day day_12)

    (next_count c0 c1)
    (next_count c1 c2)
    (next_count c2 c3)
    (next_count c3 c4)
    (next_count c4 c5)
    (next_count c5 c6)
    (next_count c6 c7)
    (next_count c7 c8)
    (next_count c8 c9)
    (next_count c9 c10)
    (next_count c10 c11)
    (next_count c11 c12)

    (current_day day_1)

    (at seville)

    (count_city seville c0)
    (count_city munich c0)
    (count_city tallinn c0)
  )

  (:goal
    (and
      (finished)

      (occupied day_1 seville)
      (occupied day_2 seville)
      (occupied day_3 seville)
      (occupied day_4 seville)
      (occupied day_5 seville)
      (occupied day_6 seville)
      (occupied day_7 seville)

      (occupied day_8 munich)
      (occupied day_9 munich)
      (occupied day_10 munich)
      (occupied day_11 munich)
      (occupied day_12 munich)

      (occupied day_11 tallinn)
      (occupied day_12 tallinn)

      (met_friend_window)

      (count_city seville c7)
      (count_city munich c5)
      (count_city tallinn c2)
    )
  )
)