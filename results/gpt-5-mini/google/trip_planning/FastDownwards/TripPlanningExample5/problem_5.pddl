(define (problem trip_itinerary_16)
  (:domain trip_planning)

  (:objects
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 day15 day16 - day
    oslo porto dubrovnik - city
    traveler1 - agent
  )

  (:init
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

    (direct oslo dubrovnik)
    (direct dubrovnik oslo)
    (direct porto oslo)
    (direct oslo porto)

    (at traveler1 oslo day1)

    (day_free day2) (day_free day3) (day_free day4) (day_free day5) (day_free day6)
    (day_free day7) (day_free day8) (day_free day9) (day_free day10) (day_free day11)
    (day_free day12) (day_free day13) (day_free day14) (day_free day15) (day_free day16)
  )

  (:goal (and
    ;; Oslo presence for six days (days 1..6)
    (at traveler1 oslo day1)
    (at traveler1 oslo day2)
    (at traveler1 oslo day3)
    (at traveler1 oslo day4)
    (at traveler1 oslo day5)
    (at traveler1 oslo day6)

    ;; Porto presence for seven days (days 7..13)
    (at traveler1 porto day7)
    (at traveler1 porto day8)
    (at traveler1 porto day9)
    (at traveler1 porto day10)
    (at traveler1 porto day11)
    (at traveler1 porto day12)
    (at traveler1 porto day13)

    ;; Dubrovnik presence for five days (days 12..16), including conferences on days 12 and 16
    (at traveler1 dubrovnik day12)
    (at traveler1 dubrovnik day13)
    (at traveler1 dubrovnik day14)
    (at traveler1 dubrovnik day15)
    (at traveler1 dubrovnik day16)
  ))
)