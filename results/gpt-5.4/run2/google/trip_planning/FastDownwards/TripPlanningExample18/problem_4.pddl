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

    (friends_window d6)
    (friends_window d7)
    (friends_window d8)
    (friends_window d9)
    (friends_window d10)
    (friends_window d11)

    (current_day d1)
  )

  (:goal
    (and
      (current_day d11)
      (met_friends)
      (visited d1 vilnius)
      (visited d2 vilnius)
      (visited d3 amsterdam)
      (visited d4 amsterdam)
      (visited d5 amsterdam)
      (visited d6 amsterdam)
      (visited d7 amsterdam)
      (visited d8 bucharest)
      (visited d9 bucharest)
      (visited d10 bucharest)
      (visited d11 bucharest)
    )
  )
)