(define (problem traveler-itinerary-6days)
  (:domain travel-multiagent)

  (:objects
    traveler - agent

    berlin warsaw bucharest - city

    day1 day2 day3 day4 day5 day6 - day
  )

  (:init
    (at traveler berlin day1)

    (next day1 day2)
    (next day2 day3)
    (next day3 day4)
    (next day4 day5)
    (next day5 day6)

    (leg berlin warsaw)
    (leg warsaw berlin)
    (leg warsaw bucharest)
    (leg bucharest warsaw)
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