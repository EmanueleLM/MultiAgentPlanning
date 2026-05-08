(define (problem trip_planning_example18_problem)
  (:domain trip_planning_example18)

  (:objects
    amsterdam vilnius bucharest - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 - day
  )

  (:init
    (direct amsterdam bucharest)
    (direct bucharest amsterdam)
    (direct vilnius amsterdam)
    (direct amsterdam vilnius)

    (next d1 d2)
    (next d2 d3)
    (next d3 d4)
    (next d4 d5)
    (next d5 d6)
    (next d6 d7)
    (next d7 d8)
    (next d8 d9)
    (next d9 d10)
    (next d10 d11)

    (current_day d1)
  )

  (:goal
    (and
      (in_city_on vilnius d1)
      (in_city_on vilnius d2)

      (in_city_on amsterdam d3)
      (in_city_on amsterdam d4)
      (in_city_on amsterdam d5)
      (in_city_on amsterdam d6)
      (in_city_on amsterdam d7)

      (in_city_on bucharest d6)
      (in_city_on bucharest d7)
      (in_city_on bucharest d8)
      (in_city_on bucharest d9)
      (in_city_on bucharest d10)
      (in_city_on bucharest d11)

      (friends_met)
      (current_day d11)
    )
  )
)