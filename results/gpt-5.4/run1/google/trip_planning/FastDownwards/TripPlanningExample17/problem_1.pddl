(define (problem trip_planning_example17_problem)
  (:domain trip_planning_example17)

  (:objects
    copenhagen vienna lyon - city

    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 - day

    n0 n1 n2 n3 n4 n5 n6 n7 n8 n9 n10 n11 - count
  )

  (:init
    (direct_flight copenhagen vienna)
    (direct_flight vienna copenhagen)
    (direct_flight vienna lyon)
    (direct_flight lyon vienna)

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

    (required_in day_1 copenhagen)
    (required_in day_5 copenhagen)

    (count_value n0)
    (count_next n0 n1)
    (count_next n1 n2)
    (count_next n2 n3)
    (count_next n3 n4)
    (count_next n4 n5)
    (count_next n5 n6)
    (count_next n6 n7)
    (count_next n7 n8)
    (count_next n8 n9)
    (count_next n9 n10)
    (count_next n10 n11)
  )

  (:goal
    (and
      (current_day day_11)
      (occupied day_1 copenhagen)
      (occupied day_5 copenhagen)

      (occupied day_1 copenhagen)
      (occupied day_2 copenhagen)
      (occupied day_3 copenhagen)
      (occupied day_4 vienna)
      (occupied day_5 copenhagen)
      (occupied day_6 vienna)
      (occupied day_7 vienna)
      (occupied day_8 vienna)
      (occupied day_9 lyon)
      (occupied day_10 lyon)
      (occupied day_11 lyon)

      (count_value n11)
    )
  )
)