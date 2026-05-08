(define (problem trip_planning_example8_problem)
  (:domain trip_planning_example8)

  (:objects
    athens zurich krakow - city

    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8
    day_9 day_10 day_11 day_12 day_13 day_14 day_15 day_16 day_17 - day

    c1 c2 c3 c4 c5 c6 c7 done - stay_count
  )

  (:init
    (current_day day_1)
    (at athens)

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
    (next_day day_13 day_14)
    (next_day day_14 day_15)
    (next_day day_15 day_16)
    (next_day day_16 day_17)

    (direct athens zurich)
    (direct zurich athens)
    (direct zurich krakow)
    (direct krakow zurich)

    (athens_allowed_day day_1)
    (athens_allowed_day day_2)
    (athens_allowed_day day_3)
    (athens_allowed_day day_4)
    (athens_allowed_day day_5)
    (athens_allowed_day day_6)
    (athens_allowed_day day_7)

    (stay_succ c7 c6)
    (stay_succ c6 c5)
    (stay_succ c5 c4)
    (stay_succ c4 c3)
    (stay_succ c3 c2)
    (stay_succ c2 c1)
    (stay_succ c1 done)

    (athens_remaining c7)
    (zurich_remaining c5)
    (krakow_remaining c6)
  )

  (:goal
    (and
      (current_day day_17)
      (athens_remaining done)
      (zurich_remaining done)
      (krakow_remaining done))
  )
)