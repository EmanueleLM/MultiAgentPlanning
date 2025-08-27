(define (problem travel-plan)
  (:domain traveler)

  (:objects
    cityA cityB cityC - city
    hotel1A hotel2A hotel1B hotel1C - hotel
    traveler - person
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 - day
  )

  (:init
    (at traveler cityA)
    (connected cityA cityB)
    (connected cityB cityC)
    (connected cityC cityA)

    (day day1)
    (next-day day1 day2)
    (next-day day2 day3)
    (next-day day3 day4)
    (next-day day4 day5)
    (next-day day5 day6)
    (next-day day6 day7)
    (next-day day7 day8)
    (next-day day8 day9)
    (next-day day9 day10)
    (next-day day10 day11)
    (next-day day11 day12)
    (next-day day12 day13)
    (next-day day13 day14)

    (flight-available cityA cityB day1)
    (flight-available cityB cityC day5)
    (flight-available cityC cityA day10)

    (hotel-available hotel1A cityA day1)
    (hotel-available hotel2A cityA day2)
    (hotel-available hotel1B cityB day4)
    (hotel-available hotel1C cityC day6)

    (can-stay hotel1A day1 day3 traveler)
    (can-stay hotel2A day2 day3 traveler)
    (can-stay hotel1B day4 day6 traveler)
    (can-stay hotel1C day6 day10 traveler)
  )

  (:goal
    (and
      (at traveler cityA)
      (day day14)
    )
  )
)