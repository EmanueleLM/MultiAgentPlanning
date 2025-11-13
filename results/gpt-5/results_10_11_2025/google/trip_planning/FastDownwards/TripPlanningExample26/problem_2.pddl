(define (problem TripPlanningExample26-problem)
  (:domain trip-planning-example26)

  (:objects
    porto berlin reykjavik - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 - day
    b1 b2 b3 - block
  )

  (:init
    (next-day d1 d2)
    (next-day d2 d3)
    (next-day d3 d4)
    (next-day d4 d5)
    (next-day d5 d6)
    (next-day d6 d7)
    (next-day d7 d8)
    (next-day d8 d9)
    (next-day d9 d10)
    (next-day d10 d11)
    (next-day d11 d12)
    (next-day d12 d13)
    (next-day d13 d14)
    (next-day d14 d15)
    (next-day d15 d16)

    (belongs-to-block d1 b1)
    (belongs-to-block d2 b1)
    (belongs-to-block d3 b1)
    (belongs-to-block d4 b1)
    (belongs-to-block d5 b1)

    (belongs-to-block d6 b2)
    (belongs-to-block d7 b2)
    (belongs-to-block d8 b2)
    (belongs-to-block d9 b2)
    (belongs-to-block d10 b2)
    (belongs-to-block d11 b2)

    (belongs-to-block d12 b3)
    (belongs-to-block d13 b3)
    (belongs-to-block d14 b3)
    (belongs-to-block d15 b3)
    (belongs-to-block d16 b3)

    (block-next b1 b2)
    (block-next b2 b3)

    (block-city b1 porto)
    (block-city b2 berlin)
    (block-city b3 reykjavik)

    (direct-flight porto berlin)
    (direct-flight berlin porto)
    (direct-flight berlin reykjavik)
    (direct-flight reykjavik berlin)

    (current-day d1)
  )

  (:goal (and
    (current-day d16)

    (assigned d1)
    (assigned d2)
    (assigned d3)
    (assigned d4)
    (assigned d5)
    (assigned d6)
    (assigned d7)
    (assigned d8)
    (assigned d9)
    (assigned d10)
    (assigned d11)
    (assigned d12)
    (assigned d13)
    (assigned d14)
    (assigned d15)
    (assigned d16)

    (city-on-day porto d1)
    (city-on-day porto d2)
    (city-on-day porto d3)
    (city-on-day porto d4)
    (city-on-day porto d5)

    (city-on-day berlin d6)
    (city-on-day berlin d7)
    (city-on-day berlin d8)
    (city-on-day berlin d9)
    (city-on-day berlin d10)
    (city-on-day berlin d11)

    (city-on-day reykjavik d12)
    (city-on-day reykjavik d13)
    (city-on-day reykjavik d14)
    (city-on-day reykjavik d15)
    (city-on-day reykjavik d16)
  ))
)