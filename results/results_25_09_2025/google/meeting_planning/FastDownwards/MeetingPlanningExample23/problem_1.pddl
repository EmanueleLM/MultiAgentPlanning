(define (problem meet-john-problem)
  (:domain meeting-schedule)
  (:objects
    traveler john - agent
    Bayview RussianHill - location
  )
  (:init
    (at traveler Bayview)
    (at john RussianHill)
    (available john)
  )
  (:goal (met))
)