(define (problem itinerary-16days-dubrovnik)
  (:domain travel_orchestration)

  (:objects
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 day15 day16 - day

    oslo porto dubrovnik - city

    traveler1 - agent
  )

  (:init
    ;; day membership
    (day day1) (day day2) (day day3) (day day4) (day day5) (day day6)
    (day day7) (day day8) (day day9) (day day10) (day day11) (day day12)
    (day day13) (day day14) (day day15) (day day16)

    ;; successor (explicit contiguity)
    (next day1 day2)
    (next day2 day3)
    (next day3 day4)
    (next day4 day5)
    (next day5 day6)
    (next day6 day7)
    (next day7 day8)
    (next day8 day9)
    (next day9 day10)
    (next day10 day11)
    (next day11 day12)
    (next day12 day13)
    (next day13 day14)
    (next day14 day15)
    (next day15 day16)

    ;; cities
    (city oslo) (city porto) (city dubrovnik)

    ;; direct flight connectivity (both directions where available)
    (direct oslo dubrovnik)
    (direct dubrovnik oslo)
    (direct porto oslo)
    (direct oslo porto)

    ;; initial location: traveler on day1 (chosen to ground the temporal progression)
    (at traveler1 oslo day1)
  )

  ;; GOAL:
  ;; - Enforce requested stays as explicit day-by-day presence requirements.
  ;;   NOTE: The requested stays are Oslo:6 days, Porto:7 days, Dubrovnik:5 days,
  ;;   while the trip length is 16 days (6+7+5 = 18 > 16). This makes the instance
  ;;   impossible. We nevertheless encode the requested stay requirements explicitly,
  ;;   and also enforce conference attendance in Dubrovnik on day12 and day16.
  (:goal (and
    ;; Oslo: require presence on 6 distinct days (days 1..6)
    (at traveler1 oslo day1)
    (at traveler1 oslo day2)
    (at traveler1 oslo day3)
    (at traveler1 oslo day4)
    (at traveler1 oslo day5)
    (at traveler1 oslo day6)

    ;; Porto: require presence on 7 distinct days (days 7..13)
    (at traveler1 porto day7)
    (at traveler1 porto day8)
    (at traveler1 porto day9)
    (at traveler1 porto day10)
    (at traveler1 porto day11)
    (at traveler1 porto day12)
    (at traveler1 porto day13)

    ;; Dubrovnik: require presence on 5 distinct days including conference days 12 and 16
    (at traveler1 dubrovnik day12)
    (at traveler1 dubrovnik day13)
    (at traveler1 dubrovnik day14)
    (at traveler1 dubrovnik day15)
    (at traveler1 dubrovnik day16)
  ))
)