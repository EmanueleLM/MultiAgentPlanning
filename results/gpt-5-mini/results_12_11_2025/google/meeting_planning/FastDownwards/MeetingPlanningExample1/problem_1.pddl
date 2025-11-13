(define (problem meet-betty-0900-constraint)
  (:domain richmond-financial-scheduling)

  ;; Initial state: at Richmond at 09:00 (540), no meeting minutes yet.
  (:init
    (at-richmond)
    (= (time) 540)
    (= (met-betty) 0)
  )

  ;; Goal: accumulate at least 60 meeting minutes with Betty and finish no later than 21:45 (1305).
  (:goal (and
           (>= (met-betty) 60)
           (<= (time) 1305)
         )
  )

  ;; Objective: maximize meeting minutes with Betty.
  (:metric maximize (met-betty))
)