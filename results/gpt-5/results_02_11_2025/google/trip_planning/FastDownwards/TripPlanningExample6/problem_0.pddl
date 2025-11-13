(define (problem trip8days-prob)
  (:domain trip8days)
  (:objects
    berlin munich dubrovnik - city
    day1 day2 day3 day4 day5 day6 day7 day8 - day
  )
  (:init
    (at berlin)
    (cur day1)

    (next day1 day2)
    (next day2 day3)
    (next day3 day4)
    (next day4 day5)
    (next day5 day6)
    (next day6 day7)
    (next day7 day8)

    (edge berlin munich)
    (edge munich berlin)
    (edge munich dubrovnik)
    (edge dubrovnik munich)

    (is-berlin berlin)

    (required-berlin-day day1)
    (required-berlin-day day4)

    (final-day day8)
  )
  (:goal (and
    (finished)
    (attended day1)
    (attended day4)

    (visited berlin day1)
    (visited berlin day2)
    (visited berlin day3)
    (visited berlin day4)
    (visited munich day5)
    (visited dubrovnik day6)
    (visited dubrovnik day7)
    (visited dubrovnik day8)
  ))
)