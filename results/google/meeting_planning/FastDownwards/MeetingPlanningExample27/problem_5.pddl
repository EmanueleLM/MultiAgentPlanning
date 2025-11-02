(define (problem meetingplanningexample27-strips-problem)
  (:domain meetingplanningexample27-strips)
  (:init
    (at marina_district)
    (idle)
    (= (current-time) 540)
    (= (total-cost) 0)
  )
  (:goal (and
    (met-margaret)
  ))
  (:metric minimize (total-cost))
)