(define (problem integrated_trip_problem)
  (:domain integrated_travel)

  (:objects
    berlin porto krakow - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 - day
    b0 b1 b2 b3 b4 b5 b6 - bcount
    p0 p1 p2 - pcount
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

    (direct berlin porto)
    (direct porto berlin)
    (direct krakow berlin)
    (direct berlin krakow)

    (is-berlin berlin)
    (is-porto porto)
    (is-krakow krakow)

    (at krakow day1)
    (visited krakow)

    (bnext b0 b1) (bnext b1 b2) (bnext b2 b3) (bnext b3 b4) (bnext b4 b5) (bnext b5 b6)
    (pnext p0 p1) (pnext p1 p2)

    (berlin_count b0)
    (porto_count p0)

    (wedding_day day10)

    (= (total-cost) 0)
  )

  (:goal (and
    (berlin_count b6)
    (porto_count p2)
    (attended-wedding)
    (at porto day10)
    (visited berlin)
    (visited porto)
    (visited krakow)
  ))

  (:metric minimize (total-cost))
)