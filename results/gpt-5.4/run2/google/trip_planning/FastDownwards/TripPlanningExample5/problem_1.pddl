(define (problem trip_planning_example5_instance)
  (:domain trip_planning_example5)

  (:objects
    oslo porto dubrovnik - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8
    day_9 day_10 day_11 day_12 day_13 day_14 day_15 day_16 - day
  )

  (:init
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

    (direct oslo dubrovnik)
    (direct dubrovnik oslo)
    (direct porto oslo)
    (direct oslo porto)

    (at oslo day_1)
    (at oslo day_2)
    (at oslo day_3)
    (at oslo day_4)
    (at oslo day_5)
    (at oslo day_6)

    (at porto day_7)
    (at porto day_8)
    (at porto day_9)
    (at porto day_10)
    (at porto day_11)
    (at porto day_12)
    (at porto day_13)

    (at dubrovnik day_12)
    (at dubrovnik day_13)
    (at dubrovnik day_14)
    (at dubrovnik day_15)
    (at dubrovnik day_16)
  )

  (:goal
    (and
      (finished)
    )
  )
)