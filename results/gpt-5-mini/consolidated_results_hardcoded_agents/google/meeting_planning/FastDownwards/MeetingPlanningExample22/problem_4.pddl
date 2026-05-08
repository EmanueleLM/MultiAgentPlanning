(define (problem meet-andrew-problem)
  (:domain meet-andrew)

  (:objects
    presidio union_square - location
  )

  (:init
    ;; start at Presidio at 09:00 (540 minutes from midnight)
    (at presidio)
    (= (time) 540)
    (= (total-cost) 0)
  )

  (:goal (met-andrew))

  ;; prefer solutions that minimize waiting/travel time (total-cost)
  (:metric minimize (total-cost))
)