(define (problem trip-krakow-athens-zurich)
  (:domain trip-multiagent)
  (:objects
    krakow athens zurich - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 day15 day16 - day
  )
  (:init
    (unassigned day1) (unassigned day2) (unassigned day3) (unassigned day4)
    (unassigned day5) (unassigned day6) (unassigned day7) (unassigned day8)
    (unassigned day9) (unassigned day10) (unassigned day11) (unassigned day12)
    (unassigned day13) (unassigned day14) (unassigned day15) (unassigned day16)

    (allowed-krakow day1) (allowed-krakow day2) (allowed-krakow day3)
    (allowed-krakow day4) (allowed-krakow day5) (allowed-krakow day6)

    (allowed-athens day6) (allowed-athens day7) (allowed-athens day8)
    (allowed-athens day9) (allowed-athens day10) (allowed-athens day11) (allowed-athens day12)

    (allowed-zurich day12) (allowed-zurich day13) (allowed-zurich day14)
    (allowed-zurich day15) (allowed-zurich day16)

    (allowed-relatives day1) (allowed-relatives day2) (allowed-relatives day3)
    (allowed-relatives day4) (allowed-relatives day5) (allowed-relatives day6) (allowed-relatives day7)

    (direct-flight zurich krakow)
    (direct-flight krakow zurich)
    (direct-flight athens zurich)
    (direct-flight zurich athens)
  )
  (:goal
    (and
      (in-krakow day1) (in-krakow day2) (in-krakow day3)
      (in-krakow day4) (in-krakow day5) (in-krakow day6)

      (in-athens day6) (in-athens day7) (in-athens day8)
      (in-athens day9) (in-athens day10) (in-athens day11) (in-athens day12)

      (in-zurich day12) (in-zurich day13) (in-zurich day14)
      (in-zurich day15) (in-zurich day16)

      (visited-relatives day6)
    )
  )
)