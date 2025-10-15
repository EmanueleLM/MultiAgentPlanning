(define (problem trip-problem)
  (:domain trip-domain)

  (:objects
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 - day
    Porto Barcelona Florence - city
  )

  (:init
    (next day1 day2) (next day2 day3) (next day3 day4) (next day4 day5)
    (next day5 day6) (next day6 day7) (next day7 day8) (next day8 day9)
    (next day9 day10) (next day10 day11) (next day11 day12)

    (flight Porto Barcelona)
    (flight Barcelona Porto)
    (flight Barcelona Florence)
    (flight Florence Barcelona)

    (at day1 Porto)
  )

  (:goal
    (and
      (at day1 Porto)
      (at day2 Porto)
      (at day3 Porto)

      (at day4 Barcelona)
      (at day5 Barcelona)
      (at day6 Barcelona)
      (at day7 Barcelona)
      (at day8 Barcelona)
      (at day9 Barcelona)
      (at day10 Barcelona)

      (at day11 Florence)
      (at day12 Florence)

      (at day4 Florence)
      (at day5 Florence)
    )
  )
)