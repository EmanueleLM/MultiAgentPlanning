(define (problem european_trip_15_days_instance_problem)
  (:domain european_trip_15_days_instance)

  (:objects
    vienna vilnius valencia - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 day_12 day_13 day_14 day_15 - day
  )

  (:init
    (start day_1)

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
    (next day_13 day_14)
    (next day_14 day_15)

    (direct vienna valencia)
    (direct valencia vienna)
    (direct vilnius vienna)
    (direct vienna vilnius)

    (conference day_9 valencia)
    (conference day_15 valencia)
  )

  (:goal
    (and
      (used day_1)
      (used day_2)
      (used day_3)
      (used day_4)
      (used day_5)
      (used day_6)
      (used day_7)
      (used day_8)
      (used day_9)
      (used day_10)
      (used day_11)
      (used day_12)
      (used day_13)
      (used day_14)
      (used day_15)

      (at vienna day_1)
      (at vienna day_2)
      (at vienna day_3)
      (at vienna day_4)
      (at vienna day_5)

      (at vilnius day_6)
      (at vilnius day_7)
      (at vilnius day_8)
      (at vilnius day_9)
      (at vilnius day_10)

      (at valencia day_9)
      (at valencia day_10)
      (at valencia day_11)
      (at valencia day_12)
      (at valencia day_13)
      (at valencia day_14)
      (at valencia day_15)
    )
  )
)