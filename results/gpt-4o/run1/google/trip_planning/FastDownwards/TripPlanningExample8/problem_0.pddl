(define (problem european_trip_problem)
  (:domain european_trip)
  (:objects
    krakow athens zurich - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7
    day_8 day_9 day_10 day_11 day_12 day_13
    day_14 day_15 day_16 - day
  )

  (:init
    (at krakow day_1)

    (next day_1 day_2) (next day_2 day_3) (next day_3 day_4)
    (next day_4 day_5) (next day_5 day_6) (next day_6 day_7)
    (next day_7 day_8) (next day_8 day_9) (next day_9 day_10)
    (next day_10 day_11) (next day_11 day_12) (next day_12 day_13)
    (next day_13 day_14) (next day_14 day_15) (next day_15 day_16)

    (direct_flight zurich krakow)
    (direct_flight athens zurich)
  )

  (:goal (and
    (at krakow day_6)
    (at athens day_13)
    (at zurich day_16)
    (visited_athens_between_1_and_7)
  ))
)