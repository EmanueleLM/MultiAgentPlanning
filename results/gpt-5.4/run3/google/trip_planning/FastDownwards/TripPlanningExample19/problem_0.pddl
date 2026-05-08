(define (problem trip_europe_9_days_instance_problem)
  (:domain trip_europe_9_days_instance)

  (:objects
    brussels valencia nice - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 - day
    b0 b1 b2 - count2
    v0 v1 v2 v3 - count3
    n0 n1 n2 n3 n4 n5 n6 - count6
  )

  (:init
    (direct brussels valencia)
    (direct valencia brussels)
    (direct brussels nice)
    (direct nice brussels)

    (next day_1 day_2)
    (next day_2 day_3)
    (next day_3 day_4)
    (next day_4 day_5)
    (next day_5 day_6)
    (next day_6 day_7)
    (next day_7 day_8)
    (next day_8 day_9)

    (current_day day_1)
    (count_brussels b0)
    (count_valencia v0)
    (count_nice n0)
  )

  (:goal
    (and
      (assigned day_1)
      (assigned day_2)
      (assigned day_3)
      (assigned day_4)
      (assigned day_5)
      (assigned day_6)
      (assigned day_7)
      (assigned day_8)
      (assigned day_9)
      (current_day day_9)
      (count_brussels b2)
      (count_valencia v3)
      (count_nice n6)
      (friends_met)
    )
  )
)