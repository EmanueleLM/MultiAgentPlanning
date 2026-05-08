(define (problem trip_planning_example19_problem)
  (:domain trip_planning_example19)

  (:objects
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 - day
  )

  (:init
    (flight brussels valencia)
    (flight valencia brussels)
    (flight brussels nice)
    (flight nice brussels)

    (next day_1 day_2)
    (next day_2 day_3)
    (next day_3 day_4)
    (next day_4 day_5)
    (next day_5 day_6)
    (next day_6 day_7)
    (next day_7 day_8)
    (next day_8 day_9)

    (today day_1)

    (brussels_count_0)
    (valencia_count_0)
    (nice_count_0)
  )

  (:goal
    (and
      (today day_9)
      (visited brussels)
      (visited valencia)
      (visited nice)
      (brussels_count_2)
      (valencia_count_3)
      (nice_count_6)
      (friends_met)
    )
  )
)