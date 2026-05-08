(define (problem trip_planning_example44_problem)
  (:domain trip_planning_example44)

  (:objects
    rome lyon zurich - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9
    day_10 day_11 day_12 day_13 day_14 day_15 day_16 day_17 - day
  )

  (:init
    (at zurich)
    (current_day day_1)
    (visited zurich day_1)

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
    (next day_16 day_17)

    (direct rome lyon)
    (direct lyon rome)
    (direct zurich rome)
    (direct rome zurich)

    (wedding_window day_1)
    (wedding_window day_2)
    (wedding_window day_3)
    (wedding_window day_4)
    (wedding_window day_5)
    (wedding_window day_6)
    (wedding_window day_7)
  )

  (:goal
    (and
      (visited zurich day_1)
      (visited zurich day_2)
      (visited zurich day_3)
      (visited zurich day_4)
      (visited zurich day_5)
      (visited zurich day_6)
      (visited zurich day_7)

      (visited rome day_8)
      (visited rome day_9)
      (visited rome day_10)
      (visited rome day_11)
      (visited rome day_12)
      (visited rome day_13)

      (visited lyon day_14)
      (visited lyon day_15)
      (visited lyon day_16)
      (visited lyon day_17)

      (wedding_attended)
      (current_day day_17)
    )
  )
)