(define (problem meetingplanningexample27-problem)
  (:domain meetingplanningexample27)
  (:objects
    marina_district pacific_heights - location
  )
  (:init
    (at marina_district)
    (= (current-time) 540)
    (= (total-cost) 0)
  )
  (:goal (and
    (met-margaret)
  ))
  (:metric minimize (total-cost))
)