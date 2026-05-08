(define (problem meet-john-problem)
  (:domain meet-john-domain)
  (:objects
    bayview russian_hill - location
  )
  (:init
    ;; start location and numeric fluents (compact representation)
    (at bayview)
    (= (current_time) 540)            ; 09:00 in minutes
    (= (travel-time bayview russian_hill) 23)
    (= (travel-time russian_hill bayview) 23)
    (= (john-window-start) 1050)     ; 17:30
    (= (john-window-end) 1260)       ; 21:00
    (= (meet-min-john) 75)
  )
  (:goal (met-john))
  (:metric minimize (current_time))
)