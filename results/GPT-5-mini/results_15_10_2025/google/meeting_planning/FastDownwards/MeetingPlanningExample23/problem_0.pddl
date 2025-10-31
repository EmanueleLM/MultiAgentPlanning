(define (problem meet-john-problem)
  (:domain bayview-scheduling)
  (:objects
    visitor john - person
    Bayview RussianHill - location
  )

  (:init
    ;; Visitor arrives and starts the day in Bayview at 09:00 (time origin = 09:00).
    (at visitor Bayview)
    ;; John is located at Russian Hill (he does not travel in this model).
    (at john RussianHill)

    ;; numeric initializations
    (= (meet-count) 0)

    ;; John's availability as timed initial literals (times in minutes since 09:00).
    ;; John available from 17:30 (09:00 + 8.5h = 510 minutes) until 21:00 (09:00 + 12h = 720 minutes).
    (at 510 (john-available))
    (at 720 (not (john-available)))
  )

  ;; Hard requirement: ensure the visit includes meeting John (which must be >=75 minutes and within availability).
  (:goal (and
    (met-john)
  ))

  ;; Optimization: maximize the number of meetings (primary objective).
  ;; Fast Downward supports numeric metrics; we maximize meet-count.
  (:metric maximize (meet-count))
)