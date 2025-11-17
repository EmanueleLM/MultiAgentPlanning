(define (problem audited-itinerary-problem)
  (:domain audited-itinerary)

  (:objects
    porto berlin reykjavik - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 - day
  )

  (:init
    ; Successor relation over the 16 discrete days
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
    (next d11 d12)
    (next d12 d13)
    (next d13 d14)
    (next d14 d15)
    (next d15 d16)

    ; Direct flights available only between successive cities in the approved sequence
    (direct-flight porto berlin)
    (direct-flight berlin reykjavik)

    ; Start at day 1
    (current d1)
  )

  (:goal (and
    ; Ordered progression must end at day 16
    (current d16)

    ; Exact audited itinerary (one city per day, exact day counts)
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

    ; Reykjavik meeting window must be fully covered [12–16]
    (city-on-day reykjavik d12)
    (city-on-day reykjavik d13)
    (city-on-day reykjavik d14)
    (city-on-day reykjavik d15)
    (city-on-day reykjavik d16)
  ))
)