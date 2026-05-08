(define (problem trip_planning_example46_problem)
  (:domain trip_planning_example46)

  (:objects
    seville manchester stockholm - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 - day
  )

  (:init
    (direct manchester seville)
    (direct seville manchester)
    (direct stockholm manchester)
    (direct manchester stockholm)

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

    (at stockholm day_1)
  )

  (:goal
    (and
      (at stockholm day_1)
      (at stockholm day_3)

      (at stockholm day_2)
      (at manchester day_4)
      (at manchester day_5)
      (at manchester day_6)
      (at manchester day_7)
      (at seville day_8)
      (at seville day_9)
      (at seville day_10)
      (at seville day_11)
    )
  )
)