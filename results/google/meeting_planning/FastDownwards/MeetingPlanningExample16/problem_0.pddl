(define (problem meet-ronald-prob)
  (:domain meet-ronald-time)

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

  ; Primary: maximize time with Ronald; Secondary: prefer smaller clock if tied
  (:metric maximize (- (* 1000000 (meeting-minutes)) (clock)))
)