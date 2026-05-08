(define (problem trip_planning_example9_problem)
  (:domain trip_planning_example9)

  (:objects
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 - day
    c0 c1 c2 c3 c4 c5 c6 - count
  )

  (:init
    (at frankfurt)

    (current_day day_1)
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

    (direct bucharest frankfurt)
    (direct frankfurt bucharest)
    (direct frankfurt stuttgart)
    (direct stuttgart frankfurt)

    (next_count c0 c1)
    (next_count c1 c2)
    (next_count c2 c3)
    (next_count c3 c4)
    (next_count c4 c5)
    (next_count c5 c6)

    (count_frankfurt c0)
    (count_bucharest c0)
    (count_stuttgart c0)

    (workshop_day day_5)
    (workshop_day day_6)
    (workshop_day day_7)
    (workshop_day day_8)
    (workshop_day day_9)
    (workshop_day day_10)
  )

  (:goal
    (and
      (current_day day_11)
      (count_frankfurt c3)
      (count_bucharest c3)
      (count_stuttgart c4)
      (workshop_attended)
    )
  )
)