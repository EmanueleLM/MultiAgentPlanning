(define (problem european_trip_12day_instance_problem)
  (:domain european_trip_12day_instance)

  (:objects
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 - day
  )

  (:init
    (at porto)
    (today d1)

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

    (direct porto barcelona)
    (direct barcelona porto)
    (direct barcelona florence)
    (direct florence barcelona)

    (porto_visit_day d1)
    (porto_visit_day d2)
    (porto_visit_day d3)
  )

  (:goal
    (and
      (today d13)
      (visited_relatives)
      (in_city_on porto d1)
      (in_city_on porto d2)
      (in_city_on porto d3)
      (in_city_on barcelona d4)
      (in_city_on barcelona d5)
      (in_city_on barcelona d6)
      (in_city_on barcelona d7)
      (in_city_on barcelona d8)
      (in_city_on barcelona d9)
      (in_city_on barcelona d10)
      (in_city_on florence d11)
      (in_city_on florence d12)
      (in_city_on florence d13)
    )
  )
)