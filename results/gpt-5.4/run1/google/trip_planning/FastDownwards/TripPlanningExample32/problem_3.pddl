(define (problem european_trip_10_days_instance_problem)
  (:domain european_trip_10_days_instance)

  (:objects
    reykjavik riga paris - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 - day
  )

  (:init
    (current day1)

    (next day1 day2)
    (next day2 day3)
    (next day3 day4)
    (next day4 day5)
    (next day5 day6)
    (next day6 day7)
    (next day7 day8)
    (next day8 day9)
    (next day9 day10)

    (direct paris reykjavik)
    (direct reykjavik paris)
    (direct riga paris)
    (direct paris riga)

    (required_city day6 reykjavik)
    (required_city day7 reykjavik)
    (required_city day8 reykjavik)
    (required_city day9 reykjavik)
    (required_city day10 reykjavik)

    (located_on reykjavik day1)
    (located_on reykjavik day2)
    (located_on reykjavik day3)
    (located_on reykjavik day4)
    (located_on reykjavik day5)

    (located_on riga day1)
    (located_on riga day2)
    (located_on riga day3)

    (located_on paris day1)
    (located_on paris day2)
    (located_on paris day3)
    (located_on paris day4)
  )

  (:goal
    (and
      (current day10)
      (at reykjavik)
      (located_on reykjavik day6)
      (located_on reykjavik day7)
      (located_on reykjavik day8)
      (located_on reykjavik day9)
      (located_on reykjavik day10)
    )
  )
)