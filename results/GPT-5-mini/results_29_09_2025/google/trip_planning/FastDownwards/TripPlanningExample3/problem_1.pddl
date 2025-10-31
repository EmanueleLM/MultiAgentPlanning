(define (problem itinerary-prob)
  (:domain itinerary)
  (:objects
    traveler - agent
    berlin warsaw bucharest - city
    day1 day2 day3 day4 day5 day6 - day
  )
  (:init
    (next day1 day2)
    (next day2 day3)
    (next day3 day4)
    (next day4 day5)
    (next day5 day6)
    (direct berlin warsaw)
    (direct warsaw bucharest)
    (at traveler berlin day1)
    (allowed_meeting day5)
    (allowed_meeting day6)
    (meeting_city bucharest)
  )
  (:goal
    (and
      (at traveler berlin day1)
      (at traveler berlin day2)
      (at traveler warsaw day3)
      (at traveler warsaw day4)
      (at traveler bucharest day5)
      (at traveler bucharest day6)
      (met day5)
    )
  )
)