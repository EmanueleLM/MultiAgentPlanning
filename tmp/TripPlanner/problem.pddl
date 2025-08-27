(define (problem travel-planning)
  (:domain travel)
  (:objects
    new_york los_angeles chicago miami - location
    1 2 3 4 5 6 7 8 9 10 11 12 13 14 - number
  )

  (:init
    (at new_york)
    (at-day 1)

    (has-flight new_york los_angeles)
    (has-flight los_angeles chicago)
    (has-flight chicago miami)
    (has-flight miami new_york)
  )

  (:goal
    (and 
      (at new_york) ; Return to New York
      (visited los_angeles)
      (visited chicago)
      (visited miami)
    )
  )
)