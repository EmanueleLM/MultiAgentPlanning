(define (problem travel-problem)
  (:domain travel-domain)

  (:objects
    traveler - agent
    berlin porto krakow - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 - day
  )

  (:init
    (succ day1 day2) (succ day2 day3) (succ day3 day4) (succ day4 day5)
    (succ day5 day6) (succ day6 day7) (succ day7 day8) (succ day8 day9)
    (succ day9 day10) (succ day10 day11)

    (direct berlin porto) (direct porto berlin)
    (direct krakow berlin) (direct berlin krakow)

    (at traveler berlin day1)
  )

  (:goal
    (and
      (at traveler berlin day1)
      (at traveler berlin day2)
      (at traveler berlin day3)
      (at traveler berlin day4)
      (at traveler berlin day5)
      (at traveler berlin day6)

      (at traveler porto day10)
      (at traveler porto day11)

      (at traveler krakow day7)
      (at traveler krakow day8)
      (at traveler krakow day9)
      (at traveler krakow day10)
      (at traveler krakow day11)
    )
  )
)