(define (problem integrated_trip_problem)
  (:domain integrated_travel)

  (:objects
    berlin porto krakow - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 - day
    b0 b1 b2 b3 b4 b5 b6 - bcount
    p0 p1 p2 - pcount
  )

  (:init
    ;; Day successor chain
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

    ;; Direct flights (symmetric where available)
    (direct berlin porto)
    (direct porto berlin)
    (direct krakow berlin)
    (direct berlin krakow)

    ;; City markers
    (is-berlin berlin)
    (is-porto porto)
    (is-krakow krakow)

    ;; Start location and visited marker
    (at krakow day1)
    (visited krakow)

    ;; Counter successor chains
    (bnext b0 b1) (bnext b1 b2) (bnext b2 b3) (bnext b3 b4) (bnext b4 b5) (bnext b5 b6)
    (pnext p0 p1) (pnext p1 p2)

    ;; Initial counter values
    (berlin_count b0)
    (porto_count p0)

    ;; Numeric cost initialization
    (= (total-cost) 0)
  )

  (:goal (and
    ;; bounded counters reaching required levels
    (berlin_count b6)
    (porto_count p2)
    ;; wedding attended and presence on wedding day
    (attended-wedding)
    (at porto day10)
    ;; visit all cities
    (visited berlin)
    (visited porto)
    (visited krakow)
  ))

  (:metric minimize (total-cost))
)