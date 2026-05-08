(define (problem itinerary-6days)
  (:domain travel-multi-agent)
  (:objects
    traveler - person
    berlin warsaw bucharest - city
    day1 day2 day3 day4 day5 day6 - day
  )

  (:init
    (next day1 day2)
    (next day2 day3)
    (next day3 day4)
    (next day4 day5)
    (next day5 day6)

    (at traveler berlin day1)

    (direct berlin warsaw)
    (direct warsaw bucharest)
  )

  (:goal
    (and
      (at traveler berlin day1)
      (at traveler berlin day2)
      (at traveler warsaw day3)
      (at traveler warsaw day4)
      (at traveler bucharest day5)
      (at traveler bucharest day6)
    )
  )
)