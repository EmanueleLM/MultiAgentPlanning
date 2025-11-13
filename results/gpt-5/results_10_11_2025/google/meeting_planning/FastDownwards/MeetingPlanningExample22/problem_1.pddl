(define (problem meetingplanningexample22-problem)
  (:domain meetingplanningexample22)

  (:init
    (at presidio)
    (= (time) 540)
    (= (total-cost) 0)
  )

  (:goal
    (and
      (met_andrew)
    )
  )

  (:metric minimize (total-cost))
)