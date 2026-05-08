(define (problem trip_planning_example15_instance)
  (:domain trip_planning_example15)

  (:objects
    berlin porto krakow - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 - day
  )

  (:init
    (current_day d1)

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

    (direct berlin porto)
    (direct porto berlin)
    (direct krakow berlin)
    (direct berlin krakow)
  )

  (:goal
    (and
      (current_day d11)

      (visited_on berlin d1)
      (visited_on berlin d2)
      (visited_on berlin d3)
      (visited_on berlin d4)
      (visited_on berlin d5)
      (visited_on berlin d6)

      (visited_on krakow d7)
      (visited_on krakow d8)
      (visited_on krakow d9)

      (visited_on porto d10)
      (visited_on porto d11)
    )
  )
)