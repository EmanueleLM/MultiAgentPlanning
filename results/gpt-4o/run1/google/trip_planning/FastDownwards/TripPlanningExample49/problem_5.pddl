(define (problem european_trip_problem)
  (:domain european_trip)
  (:objects
    reykjavik milan split - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8
    day_9 day_10 day_11 day_12 day_13 - day
  )

  (:init
    (at milan day_1)
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
  )

  (:goal 
    (and
      (at reykjavik day_5)
      (at split day_1)  ;; must be in Split between days 1 and 3
      (at split day_3)
      (at milan day_13)
    )
  )
)