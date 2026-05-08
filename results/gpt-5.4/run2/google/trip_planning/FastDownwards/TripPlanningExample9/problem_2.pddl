(define (problem european_trip_10_days_instance_problem)
  (:domain european_trip_10_days_instance)

  (:objects
    frankfurt bucharest stuttgart - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 - day
    zero one two three four five six - count
  )

  (:init
    (direct_flight bucharest frankfurt)
    (direct_flight frankfurt bucharest)
    (direct_flight frankfurt stuttgart)
    (direct_flight stuttgart frankfurt)

    (next_day day_1 day_2)
    (next_day day_2 day_3)
    (next_day day_3 day_4)
    (next_day day_4 day_5)
    (next_day day_5 day_6)
    (next_day day_6 day_7)
    (next_day day_7 day_8)
    (next_day day_8 day_9)
    (next_day day_9 day_10)

    (next_count zero one)
    (next_count one two)
    (next_count two three)
    (next_count three four)
    (next_count four five)
    (next_count five six)

    (workshop_day day_5)
    (workshop_day day_6)
    (workshop_day day_7)
    (workshop_day day_8)
    (workshop_day day_9)
    (workshop_day day_10)

    (current_day day_1)

    (count_for frankfurt zero)
    (count_for bucharest zero)
    (count_for stuttgart zero)
  )

  (:goal
    (and
      (count_for frankfurt three)
      (count_for bucharest three)
      (count_for stuttgart six)
      (workshop_satisfied)
      (assigned day_10 stuttgart)
    )
  )
)