(define (problem trip-8days)
  (:domain travel-domain)
  (:objects
    traveler - agent
    berlin munich dubrovnik - city
    day0 day1 day2 day3 day4 day5 day6 day7 day8 - day
  )
  (:init
    (at traveler munich day0)
    (flight munich berlin)
    (flight berlin munich)
    (flight munich dubrovnik)
    (flight dubrovnik munich)
    (next day0 day1)
    (next day1 day2)
    (next day2 day3)
    (next day3 day4)
    (next day4 day5)
    (next day5 day6)
    (next day6 day7)
    (next day7 day8)
  )
  (:goal (and
    (at traveler berlin day1)
    (at traveler berlin day4)
    (at traveler munich day2)
    (at traveler munich day3)
    (at traveler munich day5)
    (at traveler dubrovnik day6)
    (at traveler dubrovnik day7)
    (at traveler dubrovnik day8)
  ))
)