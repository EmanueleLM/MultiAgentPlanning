(define (problem itinerary-problem)
  (:domain itinerary-domain)

  (:objects
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 - day
    florence amsterdam riga - city
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
    (next day11 day12)
    (next day12 day13)
    (direct florence amsterdam)
    (direct amsterdam riga)
  )

  (:goal
    (and
      (in-day day1 florence)
      (in-day day2 florence)
      (in-day day3 florence)
      (in-day day4 florence)
      (in-day day5 amsterdam)
      (in-day day6 amsterdam)
      (in-day day7 amsterdam)
      (in-day day8 amsterdam)
      (in-day day9 amsterdam)
      (in-day day10 amsterdam)
      (in-day day11 riga)
      (in-day day12 riga)
      (in-day day13 riga)
      (workshop-held)
    )
  )
)