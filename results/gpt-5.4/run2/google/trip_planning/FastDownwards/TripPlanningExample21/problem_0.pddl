(define (problem european_trip_10_days_instance_start_underspecified_compiled_unspecified)
  (:domain european_trip_10_days_instance)

  (:objects
    mykonos vienna venice - city

    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 - day

    venice_0 venice_1 venice_2 venice_3 venice_4 venice_5 venice_6
    mykonos_0 mykonos_1 mykonos_2
    vienna_0 vienna_1 vienna_2 vienna_3 vienna_4 - count
  )

  (:init
    (current_day day_1)

    (direct mykonos vienna)
    (direct vienna mykonos)
    (direct vienna venice)
    (direct venice vienna)

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

    (workshop_day day_5)
    (workshop_day day_6)
    (workshop_day day_7)
    (workshop_day day_8)
    (workshop_day day_9)
    (workshop_day day_10)

    (nonworkshop_day day_1)
    (nonworkshop_day day_2)
    (nonworkshop_day day_3)
    (nonworkshop_day day_4)

    (spent_venice venice_0)
    (next_venice_count venice_0 venice_1)
    (next_venice_count venice_1 venice_2)
    (next_venice_count venice_2 venice_3)
    (next_venice_count venice_3 venice_4)
    (next_venice_count venice_4 venice_5)
    (next_venice_count venice_5 venice_6)

    (spent_mykonos mykonos_0)
    (next_mykonos_count mykonos_0 mykonos_1)
    (next_mykonos_count mykonos_1 mykonos_2)

    (spent_vienna vienna_0)
    (next_vienna_count vienna_0 vienna_1)
    (next_vienna_count vienna_1 vienna_2)
    (next_vienna_count vienna_2 vienna_3)
    (next_vienna_count vienna_3 vienna_4)
  )

  (:goal
    (and
      (current_day day_11)
      (spent_venice venice_6)
      (spent_mykonos mykonos_2)
      (spent_vienna vienna_4)
      (workshop_attended)
    )
  )
)