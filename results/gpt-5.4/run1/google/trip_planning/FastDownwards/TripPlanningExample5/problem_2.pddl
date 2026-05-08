(define (problem trip_planning_example5_instance)
  (:domain trip_planning_example5)

  (:objects
    oslo porto dubrovnik - city
    day1 day2 day3 day4 day5 day6 day7 day8
    day9 day10 day11 day12 day13 day14 day15 day16 - day
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
    (next day10 day11)
    (next day11 day12)
    (next day12 day13)
    (next day13 day14)
    (next day14 day15)
    (next day15 day16)

    (direct_flight oslo dubrovnik)
    (direct_flight dubrovnik oslo)
    (direct_flight porto oslo)
    (direct_flight oslo porto)
  )

  (:goal
    (and
      (current day16)

      (visited day1 porto)
      (visited day2 porto)
      (visited day3 porto)
      (visited day4 porto)
      (visited day5 porto)
      (visited day6 porto)
      (visited day7 porto)

      (visited day8 oslo)
      (visited day9 oslo)
      (visited day10 oslo)
      (visited day11 oslo)
      (visited day13 oslo)
      (visited day14 oslo)

      (visited day12 dubrovnik)
      (visited day15 dubrovnik)
      (visited day16 dubrovnik)
    )
  )
)