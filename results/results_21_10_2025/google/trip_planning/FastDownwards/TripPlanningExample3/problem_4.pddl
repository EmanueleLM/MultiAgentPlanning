(define (problem trip-6days-example3)
  (:domain trip-planning-example3)
  (:objects
    berlin warsaw bucharest - city
    day1 day2 day3 day4 day5 day6 - day
  )

  (:init
    (prev day1 day2)
    (prev day2 day3)
    (prev day3 day4)
    (prev day4 day5)
    (prev day5 day6)

    (start_day day1)

    (connected berlin warsaw)
    (connected warsaw berlin)
    (connected warsaw bucharest)
    (connected bucharest warsaw)
  )

  (:goal
    (and
      (day_assigned day1)
      (day_assigned day2)
      (day_assigned day3)
      (day_assigned day4)
      (day_assigned day5)
      (day_assigned day6)

      (visited berlin)
      (visited warsaw)
      (visited bucharest)

      (located bucharest day5)
      (located bucharest day6)

      (meeting bucharest day6)
    )
  )
)