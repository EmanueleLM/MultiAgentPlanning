(define (problem integrated-trip-problem)
  (:domain integrated_trip)

  (:objects
    vienna vilnius valencia - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 day15 day16 - day
  )

  (:init
    (current-day day1)
    (at vienna)

    (direct vienna valencia)
    (direct valencia vienna)
    (direct vienna vilnius)
    (direct vilnius vienna)

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

    (= (days-left) 15)
    (= (stay-vienna) 5)
    (= (stay-vilnius) 5)
    (= (stay-valencia) 7)
  )

  (:goal
    (and
      (= (days-left) 0)
      (= (stay-vienna) 0)
      (= (stay-vilnius) 0)
      (= (stay-valencia) 0)
      (attended9)
      (attended15)
      (current-day day16)
    )
  )
)