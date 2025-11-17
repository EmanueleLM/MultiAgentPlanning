(define (problem meetingplanningexample18-prob)
  (:domain meetingplanningexample18)
  (:objects
    marina richmond - location
  )
  (:init
    (at marina)
    (= (clock) 540)          ; 09:00
    (= (total-cost) 0)
  )
  (:goal
    (and
      (met-betty)
      (<= (clock) 1350)      ; planning horizon end 22:30
    )
  )
  (:metric minimize (total-cost))
)