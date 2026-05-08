(define (problem trip_planning_example12_problem)
  (:domain trip_planning_example12)

  (:objects
    amsterdam valencia - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 - day
  )

  (:init
    (at valencia)
    (current_day d1)

    (next_day d1 d2)
    (next_day d2 d3)
    (next_day d3 d4)
    (next_day d4 d5)
    (next_day d5 d6)
    (next_day d6 d7)
    (next_day d7 d8)
    (next_day d8 d9)
    (next_day d9 d10)
    (next_day d10 d11)
    (next_day d11 d12)
    (next_day d12 d13)
    (next_day d13 d14)
    (next_day d14 d15)
    (next_day d15 d16)

    (meeting_window_day d9)
    (meeting_window_day d10)
    (meeting_window_day d11)
    (meeting_window_day d12)
    (meeting_window_day d13)
    (meeting_window_day d14)
    (meeting_window_day d15)

    (direct_flight amsterdam tallinn)
    (direct_flight tallinn amsterdam)
    (direct_flight valencia amsterdam)
    (direct_flight amsterdam valencia)
  )

  (:goal
    (and
      (current_day d16)
      (friend_met)

      (visited_on valencia d1)
      (visited_on valencia d2)
      (visited_on valencia d3)
      (visited_on valencia d4)
      (visited_on valencia d5)

      (visited_on amsterdam d6)
      (visited_on amsterdam d7)
      (visited_on amsterdam d8)
      (visited_on amsterdam d9)
      (visited_on amsterdam d10)

      (visited_on tallinn d11)
      (visited_on tallinn d12)
      (visited_on tallinn d13)
      (visited_on tallinn d14)
      (visited_on tallinn d15)
    )
  )
)