(define (problem trip_planning_example5_instance)
  (:domain trip_planning_example5)

  (:objects
    oslo porto dubrovnik - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8
    day_9 day_10 day_11 day_12 day_13 day_14 day_15 day_16 - day
  )

  (:init
    (current day_1)

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

    (direct_flight oslo dubrovnik)
    (direct_flight dubrovnik oslo)
    (direct_flight porto oslo)
    (direct_flight oslo porto)
  )

  (:goal
    (and
      (current day_16)

      (visited day_1 porto)
      (visited day_2 porto)
      (visited day_3 porto)
      (visited day_4 porto)
      (visited day_5 porto)
      (visited day_6 porto)
      (visited day_7 porto)

      (visited day_8 oslo)
      (visited day_9 oslo)
      (visited day_10 oslo)
      (visited day_11 oslo)
      (visited day_13 oslo)
      (visited day_14 oslo)

      (visited day_12 dubrovnik)
      (visited day_15 dubrovnik)
      (visited day_16 dubrovnik)
    )
  )
)