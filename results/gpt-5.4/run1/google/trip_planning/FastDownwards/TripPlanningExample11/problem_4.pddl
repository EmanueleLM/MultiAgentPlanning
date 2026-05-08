(define (problem trip_planning_example11_instance)
  (:domain trip_planning_example11)

  (:objects
    vienna vilnius valencia - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 day_12 day_13 day_14 day_15 day_16 - day
  )

  (:init
    (at vienna)
    (visited vienna)
    (today day_1)

    (direct vienna valencia)
    (direct valencia vienna)
    (direct vienna vilnius)
    (direct vilnius vienna)

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
    (next day_15 day_16)

    (stay_day day_1 vienna)
    (stay_day day_2 vienna)
    (stay_day day_3 vienna)
    (stay_day day_4 vienna)
    (stay_day day_5 vienna)

    (stay_day day_6 vilnius)
    (stay_day day_7 vilnius)
    (stay_day day_8 vilnius)
    (stay_day day_9 vilnius)
    (stay_day day_10 vilnius)

    (stay_day day_11 valencia)
    (stay_day day_12 valencia)
    (stay_day day_13 valencia)
    (stay_day day_14 valencia)
    (stay_day day_15 valencia)

    (conference_day day_9)
    (conference_day day_15)
  )

  (:goal
    (and
      (today day_16)
      (at valencia)
      (visited vienna)
      (visited vilnius)
      (visited valencia)
    )
  )
)