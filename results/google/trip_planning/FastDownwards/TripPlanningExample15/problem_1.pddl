(define (problem trip-plan-berlin-krakow-porto-11)
  (:domain trip-11days-direct)
  (:objects
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 - day
    berlin porto krakow - city
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

    (free day1)
    (free day2)
    (free day3)
    (free day4)
    (free day5)
    (free day6)
    (free day7)
    (free day8)
    (free day9)
    (free day10)
    (free day11)

    (first day1)
    (start)

    (direct berlin porto)
    (direct porto berlin)
    (direct berlin krakow)
    (direct krakow berlin)

    ; Allowed city per day (encodes the chosen best-effort itinerary while enforcing hard constraints)
    (allowed day1 krakow)
    (allowed day2 krakow)
    (allowed day3 krakow)
    (allowed day4 krakow)

    (allowed day5 berlin)
    (allowed day6 berlin)
    (allowed day7 berlin)
    (allowed day8 berlin)
    (allowed day9 berlin)

    (allowed day10 porto)
    (allowed day11 porto)
  )
  (:goal (and
    (current day11)
    (at day10 porto)
    (at day11 porto)
  ))
)