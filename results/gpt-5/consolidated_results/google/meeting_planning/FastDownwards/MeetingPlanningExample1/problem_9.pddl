(define (problem sf_meet_betty_numeric_p)
  (:domain sf_meet_betty_numeric)
  (:init
    (at-richmond)
    (= (time) 540)
    (= (met-betty) 0)
  )
  (:goal (and
    (>= (met-betty) 60)
    (<= (time) 1305)
  ))
  (:metric maximize (met-betty))
)