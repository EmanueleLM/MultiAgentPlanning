(define (problem itinerary-problem)
  (:domain travel-itinerary)

  (:objects
    traveler1 - traveler
    London Bucharest Reykjavik - location
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 - day
  )

  (:init
    (at traveler1 London day1)
    (next-day day1 day2)
    (next-day day2 day3)
    (next-day day3 day4)
    (next-day day4 day5)
    (next-day day5 day6)
    (next-day day6 day7)
    (next-day day7 day8)
    (next-day day8 day9)
    (next-day day9 day10)
    (next-day day10 day11)
    (next-day day11 day12)
    (next-day day12 day13)
    (next-day day13 day14)
  )

  (:goal
    (and
      (visited London)
      (visited Bucharest)
      (visited Reykjavik)
      (met-friend traveler1 day10)
    )
  )
)