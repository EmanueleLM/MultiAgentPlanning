(define (problem integrated-trip-problem)
  (:domain integrated-trip)
  (:objects
    berlin warsaw - city
    day1 day2 day3 day4 - day
  )
  (:init
    (direct berlin warsaw)
    (direct warsaw berlin)
    (direct warsaw bucharest)
    (direct bucharest warsaw)
    (next day1 day2)
    (next day2 day3)
    (next day3 day4)
    (next day4 day5)
    (next day5 day6)
    (at berlin day1)
  )
  (:goal (and
    (at berlin day1)
    (at berlin day2)
    (at warsaw day3)
    (at warsaw day4)
    (at bucharest day5)
    (at bucharest day6)
    (met-friend)
  ))
)