(define (problem trip_planning_example_29_problem)
  (:domain trip_planning_example_29)
  (:objects
    krakow dubrovnik frankfurt - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 - day
    n0 n1 n2 n3 n4 n5 n6 n7 n8 n9 n10 - count
  )
  (:init
    (next_day d1 d2)
    (next_day d2 d3)
    (next_day d3 d4)
    (next_day d4 d5)
    (next_day d5 d6)
    (next_day d6 d7)
    (next_day d7 d8)
    (next_day d8 d9)
    (next_day d9 d10)

    (next_count n0 n1)
    (next_count n1 n2)
    (next_count n2 n3)
    (next_count n3 n4)
    (next_count n4 n5)
    (next_count n5 n6)
    (next_count n6 n7)
    (next_count n7 n8)
    (next_count n8 n9)
    (next_count n9 n10)

    (flight_route frankfurt krakow)
    (flight_route krakow frankfurt)
    (flight_route dubrovnik frankfurt)
    (flight_route frankfurt dubrovnik)

    (city_count krakow n0)
    (city_count dubrovnik n0)
    (city_count frankfurt n0)

    (is_day1 d1)
    (is_count0 n0)
  )
  (:goal
    (and
      (city_count krakow n2)
      (city_count dubrovnik n7)
      (city_count frankfurt n3)
      (visited_at krakow d9)
      (visited_at krakow d10)
      (current_day d10)
    )
  )
)