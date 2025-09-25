(define (problem meet-john-problem)
  (:domain meeting-schedule)
  (:objects
    traveler john - agent
    Bayview RussianHill - location
  )
  (:init
    (at traveler Bayview)
    (at 510 (at john RussianHill))
    (at 720 (not (at john RussianHill)))
  )
  (:goal (met))
)