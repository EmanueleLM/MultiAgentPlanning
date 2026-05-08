(define (problem european_trip_11_days_instance_problem)
  (:domain european_trip_11_days_instance)

  (:objects
    paris nice mykonos - city

    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 - day

    c0 c1 c2 c3 c4 c5 - count
  )

  (:init
    (direct paris nice)
    (direct nice paris)
    (direct nice mykonos)
    (direct mykonos nice)

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

    (count_succ c0 c1)
    (count_succ c1 c2)
    (count_succ c2 c3)
    (count_succ c3 c4)
    (count_succ c4 c5)

    (current_day day_1)

    (paris_count c0)
    (nice_count c0)
    (mykonos_count c0)
  )

  (:goal
    (and
      (planning_done)
      (assigned day_1)
      (assigned day_2)
      (assigned day_3)
      (assigned day_4)
      (assigned day_5)
      (assigned day_6)
      (assigned day_7)
      (assigned day_8)
      (assigned day_9)
      (assigned day_10)
      (assigned day_11)
      (met_in_paris_window)
      (paris_count c4)
      (mykonos_count c4)
      (nice_count c5)
    )
  )
)