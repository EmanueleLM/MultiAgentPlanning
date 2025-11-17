(define (problem meet-andrew-problem)
  (:domain meet-andrew)

  (:objects
    presidio union_square - location
  )

  (:init
    ; initial location and time: arrive at Presidio at 09:00 (540 minutes)
    (at presidio)
    (= (time) 540)
    (= (total-cost) 0)
    ; met-andrew is initially false (absent)
  )

  ; Goal: conduct a contiguous meeting of at least 105 minutes with Andrew
  (:goal (and
           (met-andrew)
         ))

  ; Minimize total explicit waiting and travel (total-cost); meeting itself adds zero cost
  (:metric minimize (total-cost))
)