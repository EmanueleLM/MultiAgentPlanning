(define (problem trip8days-prob)
  (:domain trip8days)
  (:objects
    berlin munich dubrovnik - city
    day1 day2 day3 day4 day5 day6 day7 day8 - day
  )
  (:init
    ; Start in Berlin on day1
    (at berlin)
    (cur day1)

    ; Sequential 8-day timeline
    (next day1 day2)
    (next day2 day3)
    (next day3 day4)
    (next day4 day5)
    (next day5 day6)
    (next day6 day7)
    (next day7 day8)

    ; Direct-flight graph (only allowed routes)
    (edge berlin munich)
    (edge munich berlin)
    (edge munich dubrovnik)
    (edge dubrovnik munich)

    ; Identify Berlin and required conference days
    (is-berlin berlin)
    (required-berlin-day day1)
    (required-berlin-day day4)

    ; Final day marker
    (final-day day8)
  )
  (:goal (and
    (finished)
    (attended day1)
    (attended day4)
  ))
)