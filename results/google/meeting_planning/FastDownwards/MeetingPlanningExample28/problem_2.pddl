(define (problem meeting-planning-example28-problem)
  (:domain meeting-planning-example28)
  (:objects
    Union_Square Chinatown - location
  )
  (:init
    (at Union_Square)
    (edge Union_Square Chinatown)
    (edge Chinatown Union_Square)
    (joshua-loc Chinatown)
    (= (travel-time Union_Square Chinatown) 7)
    (= (travel-time Chinatown Union_Square) 7)
    (= (current-time) 540)
    (= (total-cost) 0)
  )
  (:goal
    (and
      (met-joshua)
    )
  )
  (:metric minimize (total-cost))
)