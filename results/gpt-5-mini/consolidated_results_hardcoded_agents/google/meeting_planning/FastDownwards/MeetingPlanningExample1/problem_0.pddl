(define (problem meet-betty-0900-constraint)
  (:domain richmond-financial-scheduling)

  ;; No typed objects required for this problem (locations encoded as predicates).
  (:objects)

  ;; Initial state:
  ;; - start at Richmond District at 09:00 -> time = 540
  ;; - no meeting minutes accrued yet
  (:init
    (at-richmond)
    (= (time) 540)
    (= (met-betty) 0)
  )

  ;; Goal: obtain at least 60 meeting minutes with Betty, and finish no later than 1305.
  ;; This is a hard constraint: plans that exceed time 1305 will not satisfy the goal.
  (:goal (and
           (>= (met-betty) 60)
           (<= (time) 1305)
         )
  )

  ;; Optimize: maximize total meeting minutes with Betty.
  (:metric maximize (met-betty))
)