(define (problem trip_planning_example35_problem)
  (:domain trip_planning_example35)

  (:objects
    bucharest zurich dubrovnik - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 - day
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

    (flight bucharest zurich)
    (flight zurich bucharest)
    (flight zurich dubrovnik)
    (flight dubrovnik zurich)

    (not (at bucharest))
    (not (at zurich))
    (not (at dubrovnik))
  )

  (:goal
    (and
      (current day_10)

      (visited bucharest day_1)
      (visited bucharest day_2)
      (visited bucharest day_3)

      (visited zurich day_2)
      (visited zurich day_3)

      (visited dubrovnik day_4)
      (visited dubrovnik day_5)
      (visited dubrovnik day_6)
      (visited dubrovnik day_7)
      (visited dubrovnik day_8)
      (visited dubrovnik day_9)
      (visited dubrovnik day_10)
    )
  )
)