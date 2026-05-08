(define (problem trip_planning_example11_instance)
  (:domain trip_planning_example11)

  (:objects
    vienna vilnius valencia - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 day_12 day_13 day_14 day_15 day_16 - day
  )

  (:init
    (at vienna)
    (visited vienna)
    (current_day day_1)

    (direct vienna valencia)
    (direct valencia vienna)
    (direct vienna vilnius)
    (direct vilnius vienna)

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

    (assigned day_1 vienna)
    (assigned day_2 vienna)
    (assigned day_3 vienna)
    (assigned day_4 vienna)
    (assigned day_5 vienna)

    (assigned day_6 vilnius)
    (assigned day_7 vilnius)
    (assigned day_8 vilnius)
    (assigned day_9 valencia)
    (assigned day_10 vilnius)

    (assigned day_11 valencia)
    (assigned day_12 valencia)
    (assigned day_13 valencia)
    (assigned day_14 valencia)
    (assigned day_15 valencia)

    (conference_day day_9)
    (conference_day day_15)
  )

  (:goal
    (and
      (current_day day_16)
      (at valencia)
      (visited vienna)
      (visited vilnius)
      (visited valencia)
    )
  )
)