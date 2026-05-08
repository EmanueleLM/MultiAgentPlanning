(define (problem tripplanningexample16_problem)
  (:domain tripplanningexample16)

  (:objects
    prague vienna porto - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 - day
  )

  (:init
    (direct vienna porto)
    (direct porto vienna)
    (direct prague vienna)
    (direct vienna prague)

    (next day1 day2)
    (next day2 day3)
    (next day3 day4)
    (next day4 day5)
    (next day5 day6)
    (next day6 day7)
    (next day7 day8)
    (next day8 day9)

    (workshop_day day1)
    (workshop_day day2)
    (workshop_day day3)

    (current_day day1)
    (at prague)
    (in_city_on prague day1)
  )

  (:goal
    (and
      (workshop_attended)
      (in_city_on prague day1)
      (in_city_on prague day2)
      (in_city_on prague day3)
      (in_city_on vienna day4)
      (in_city_on vienna day5)
      (in_city_on vienna day6)
      (in_city_on porto day5)
      (in_city_on porto day6)
      (in_city_on porto day7)
      (in_city_on porto day8)
      (in_city_on porto day9)
    )
  )
)