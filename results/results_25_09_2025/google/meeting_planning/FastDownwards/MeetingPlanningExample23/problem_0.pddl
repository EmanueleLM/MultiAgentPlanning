(define (problem meet-john-problem)
  (:domain meeting-schedule)
  (:objects
    traveler john - agent
    Bayview RussianHill - location
  )
  (:init
    ; initial locations
    (at traveler Bayview)
    (at john RussianHill)          ; John's known presence at RussianHill during his window
    ; initial clock time: traveler arrives at Bayview at 09:00 (540 minutes)
    (= (time) 540)
  )
  ; minimize the final time to reflect the traveler's objective (finish meeting as early as possible)
  (:metric minimize (time))
  (:goal (met))
)