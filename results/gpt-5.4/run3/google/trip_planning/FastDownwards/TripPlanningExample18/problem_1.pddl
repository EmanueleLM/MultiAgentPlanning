(define (problem trip_planning_example18_problem)
  (:domain trip_planning_example18)

  (:objects
    amsterdam vilnius bucharest - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 - day
  )

  (:init
    (direct amsterdam bucharest)
    (direct bucharest amsterdam)
    (direct vilnius amsterdam)
    (direct amsterdam vilnius)

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

    (current_day day_1)
  )

  (:goal
    (and
      (visited amsterdam day_1)
      (visited amsterdam day_2)
      (visited amsterdam day_3)
      (visited amsterdam day_4)
      (visited amsterdam day_5)

      (visited vilnius day_10)
      (visited vilnius day_11)

      (visited bucharest day_6)
      (visited bucharest day_7)
      (visited bucharest day_8)
      (visited bucharest day_9)
      (visited bucharest day_10)
      (visited bucharest day_11)

      (friends_met)
      (current_day day_11)
    )
  )
)