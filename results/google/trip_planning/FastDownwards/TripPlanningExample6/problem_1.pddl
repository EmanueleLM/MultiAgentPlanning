(define (problem trip-8days)
  (:domain multiagent-travel)
  (:objects
    traveler manager - agent
    dubrovnik berlin munich - city
    day1 day2 day3 day4 day5 day6 day7 day8 - day
  )

  (:init
    (is-traveler traveler)
    (is-manager manager)
    (at traveler berlin day1)

    (next day1 day2)
    (next day2 day3)
    (next day3 day4)
    (next day4 day5)
    (next day5 day6)
    (next day6 day7)
    (next day7 day8)

    (direct munich dubrovnik)
    (direct dubrovnik munich)
    (direct berlin munich)
    (direct munich berlin)

    (conference berlin day1)
    (conference berlin day4)
  )

  (:goal (and
    (attended berlin day1)
    (attended berlin day4)

    (at traveler berlin day1)
    (at traveler berlin day2)

    (at traveler munich day3)
    (at traveler berlin day4)
    (at traveler munich day5)
    (at traveler munich day6)

    (at traveler dubrovnik day7)
    (at traveler dubrovnik day8)
  ))
)