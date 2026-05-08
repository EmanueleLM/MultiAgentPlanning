(define (problem tripplanningexample28_problem)
  (:domain tripplanningexample28)

  (:objects
    venice florence zurich - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 day_12 day_13 - day
  )

  (:init
    (direct_flight venice zurich)
    (direct_flight zurich venice)
    (direct_flight zurich florence)

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

    (current_day day_1)
    (at venice)

    (total_day day_13)

    (need_visit venice day_1)
    (need_visit venice day_2)
    (need_visit venice day_3)
    (need_visit venice day_4)
    (need_visit venice day_5)
    (need_visit venice day_6)

    (need_visit zurich day_6)
    (need_visit zurich day_7)

    (need_visit florence day_7)
    (need_visit florence day_8)
    (need_visit florence day_9)
    (need_visit florence day_10)
    (need_visit florence day_11)
    (need_visit florence day_12)
  )

  (:goal
    (trip_complete))
)