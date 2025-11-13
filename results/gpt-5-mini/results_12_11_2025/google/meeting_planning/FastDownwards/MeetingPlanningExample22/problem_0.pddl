(define (problem meet-andrew-problem)
  (:domain meet-andrew)

  (:objects
    presidio union_square - location
  )

  (:init
    ; initial location and time as audited: arrive at Presidio at 09:00 (540 minutes)
    (at presidio)
    (= (time) 540)
    (= (total-cost) 0)
    ; Andrew availability is enforced by action preconditions (explicit numeric bounds in meet action)
    ; met-andrew is initially false (absence in init)
  )

  ; Goal: guarantee a single contiguous meeting of at least 105 minutes with Andrew
  (:goal (and
           (met-andrew)
         ))

  ; Minimize total explicit waiting and travel (total-cost); meeting itself has zero added cost
  (:metric minimize (total-cost))
)