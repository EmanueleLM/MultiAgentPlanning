(define (problem meet-andrew-problem)
  (:domain meet-andrew)

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