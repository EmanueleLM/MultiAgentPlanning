(define (problem travel-itinerary-10days)
  (:domain travel-multiagent)

  (:objects
    dubrovnik frankfurt krakow - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 - day
  )

  (:init
    ;; Direct flight connectivity (only these direct legs exist)
    (flightexists dubrovnik frankfurt)
    (flightexists frankfurt dubrovnik)
    (flightexists frankfurt krakow)
    (flightexists krakow frankfurt)

    ;; Day adjacency
    (next day1 day2)
    (next day2 day3)
    (next day3 day4)
    (next day4 day5)
    (next day5 day6)
    (next day6 day7)
    (next day7 day8)
    (next day8 day9)
    (next day9 day10)

    ;; Initial location: start in Dubrovnik on day1 (chosen to satisfy 7-day Dubrovnik stay earliest)
    (at dubrovnik day1)

    ;; Days available (day1 already occupied above; reserve days 2..10 as free to be assigned by actions)
    (free day2)
    (free day3)
    (free day4)
    (free day5)
    (free day6)
    (free day7)
    (free day8)
    (free day9)
    (free day10)
  )

  ;; Goals: enforce the chosen itinerary and the wedding constraint (presence in Krakow for day9 and day10)
  (:goal
    (and
      ;; Dubrovnik days 1..7
      (at dubrovnik day1)
      (at dubrovnik day2)
      (at dubrovnik day3)
      (at dubrovnik day4)
      (at dubrovnik day5)
      (at dubrovnik day6)
      (at dubrovnik day7)

      ;; Frankfurt day 8
      (at frankfurt day8)

      ;; Krakow days 9..10 (wedding window covered)
      (at krakow day9)
      (at krakow day10)
    )
  )
)