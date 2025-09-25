(define (problem meet-ronald-problem-classical)
  (:domain visitor-ronald-meet-classical)
  (:objects
    visitor ronald - agent
    Chinatown RussianHill - location
    t0 t7 t375 t382 t480 t487 - time
  )
  (:init
    (at visitor Chinatown)
    (current-time t0)
    (ronald-present t375)
    (ronald-present t382)
    (ronald-present t480)
    (ronald-present t487)
    (= (total-cost) 0)
  )
  (:goal (met-ronald))
  (:metric minimize (total-cost))
)