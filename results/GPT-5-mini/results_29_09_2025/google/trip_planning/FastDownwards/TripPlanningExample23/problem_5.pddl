(define (problem trip-problem)
  (:domain trip-domain)
  (:objects
    day1 day2 day3 day4 day5 day6 day7 day8 - day
    london bucharest riga - city
  )

  (:init
    (next day1 day2)
    (next day2 day3)
    (next day3 day4)
    (next day4 day5)
    (next day5 day6)
    (next day6 day7)
    (next day7 day8)

    (direct london bucharest)
    (direct bucharest london)
    (direct bucharest riga)
    (direct riga bucharest)

    (allowed-workshop-day day5)
    (allowed-workshop-day day6)
    (allowed-workshop-day day7)
    (allowed-workshop-day day8)

    (at day1 london)
  )

  (:goal (and
    (at day1 london)
    (at day2 london)
    (at day3 bucharest)
    (at day4 bucharest)
    (at day5 riga)
    (at day6 riga)
    (at day7 riga)
    (at day8 riga)
    (attended-workshop)
  ))
)