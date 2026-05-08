(define (problem tripplanningexample28_problem)
  (:domain tripplanningexample28)

  (:objects
    venice florence zurich - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 day_12 day_13 - day
  )

  (:init
    (at venice)
    (current day_1)

    (direct_flight venice zurich)
    (direct_flight zurich venice)
    (direct_flight zurich florence)

    (next day_1 day_2)
    (next day_2 day_3)
    (next day_3 day_4)
    (next day_4 day_5)
    (next day_5 day_6)
    (next day_6 day_7)
    (next day_7 day_8)
    (next day_8 day_9)
    (next day_9 day_10)
    (next day_10 day_11)
    (next day_11 day_12)
    (next day_12 day_13)
  )

  (:goal
    (and
      (current day_13)

      (visited venice day_1)
      (visited venice day_2)
      (visited venice day_3)
      (visited venice day_4)
      (visited venice day_5)
      (visited venice day_6)

      (visited zurich day_7)
      (visited zurich day_8)

      (visited florence day_9)
      (visited florence day_10)
      (visited florence day_11)
      (visited florence day_12)
    )
  )
)