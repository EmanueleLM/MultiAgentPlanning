(define (problem meeting-planning-example16-prob)
  (:domain meeting-planning-example16)

  (:init
    (at me chinatown)
    (= (clock) 0)
    (= (meeting-minutes) 0)
  )

  (:goal
    (and
      (met-ronald)
      (>= (meeting-minutes) 105)
    )
  )

  ; Primary objective: maximize time meeting Ronald.
  ; Secondary tie-breaker: minimize final clock value.
  (:metric maximize (- (* 1000000 (meeting-minutes)) (clock)))
)