(define (problem trip-8days)
  (:domain multiagent-travel)
  (:objects
    traveler - agent
    dubrovnik berlin munich - city
    day1 day2 day3 day4 day5 day6 day7 day8 - day
  )

  (:init
    (is-traveler traveler)
    (at traveler berlin day1)
    (occupied day1)

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

    (occupied day1)
    (occupied day2)
    (occupied day3)
    (occupied day4)
    (occupied day5)
    (occupied day6)
    (occupied day7)
    (occupied day8)
  ))
)