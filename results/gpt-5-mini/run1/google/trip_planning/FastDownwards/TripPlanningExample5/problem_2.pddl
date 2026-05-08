(define (problem itinerary-16days-dubrovnik)
  (:domain travel_orchestration)

  (:objects
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 day15 day16 - day

    oslo porto dubrovnik - city

    traveler1 - agent
  )

  (:init
    ;; temporal successor chain
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

    ;; direct flight connectivity (both directions where given)
    (direct oslo dubrovnik)
    (direct dubrovnik oslo)
    (direct porto oslo)
    (direct oslo porto)

    ;; initial grounding: traveler location on day1
    (at traveler1 oslo day1)

    ;; day assignment tokens: day1 already assigned (by initial at), other days start free
    (day_free day2) (day_free day3) (day_free day4) (day_free day5) (day_free day6)
    (day_free day7) (day_free day8) (day_free day9) (day_free day10) (day_free day11)
    (day_free day12) (day_free day13) (day_free day14) (day_free day15) (day_free day16)
  )

  ;; GOAL:
  ;; Encode the human's hard constraints exactly:
  ;; - requested stays per city (Oslo 6 days, Porto 7 days, Dubrovnik 5 days)
  ;; - required conference presence in Dubrovnik on days 12 and 16
  ;; Note: these constraints together are inconsistent for a 16-day trip
  ;; (6 + 7 + 5 = 18 > 16). We preserve them as explicit hard goals per instruction.
  (:goal (and
    ;; Oslo required presence on six days (specified as days 1..6)
    (at traveler1 oslo day1)
    (at traveler1 oslo day2)
    (at traveler1 oslo day3)
    (at traveler1 oslo day4)
    (at traveler1 oslo day5)
    (at traveler1 oslo day6)

    ;; Porto required presence on seven days (specified as days 7..13)
    (at traveler1 porto day7)
    (at traveler1 porto day8)
    (at traveler1 porto day9)
    (at traveler1 porto day10)
    (at traveler1 porto day11)
    (at traveler1 porto day12)
    (at traveler1 porto day13)

    ;; Dubrovnik required presence on five days, including conferences on day12 and day16
    (at traveler1 dubrovnik day12)
    (at traveler1 dubrovnik day13)
    (at traveler1 dubrovnik day14)
    (at traveler1 dubrovnik day15)
    (at traveler1 dubrovnik day16)
  ))
)