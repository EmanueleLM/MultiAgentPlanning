(define (problem itinerary-11days)
  (:domain itinerary)

  (:objects
    berlin frankfurt bucharest - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 - day
  )

  (:init
    (next day1 day2) (next day2 day3) (next day3 day4) (next day4 day5)
    (next day5 day6) (next day6 day7) (next day7 day8) (next day8 day9)
    (next day9 day10) (next day10 day11)

    (connected berlin frankfurt)
    (connected frankfurt berlin)
    (connected frankfurt bucharest)
    (connected bucharest frankfurt)

    (at berlin day1)
    (occupied day1)
  )

  (:goal
    (and
      (at berlin day1) (at berlin day2) (at berlin day3) (at berlin day4) (at berlin day5)
      (at frankfurt day6) (at frankfurt day7) (at frankfurt day8) (at frankfurt day9)
      (at bucharest day10) (at bucharest day11)
    )
  )
)