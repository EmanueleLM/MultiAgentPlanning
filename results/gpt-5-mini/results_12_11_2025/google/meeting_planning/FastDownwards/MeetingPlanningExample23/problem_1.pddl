(define (problem meet-john-problem)
  (:domain meet-john-domain)
  (:objects
    bayview russian_hill - location
    john - person
    you - agent
  )
  (:init
    ;; Starting location and known locations
    (at bayview)
    (known-location bayview)
    (known-location russian_hill)
    ;; John's meeting location
    (john-location russian_hill)

    ;; Numeric fluents (minutes since midnight)
    (= (current_time) 540)            ;; 09:00 -> 9*60 = 540
    (= (travel-time bayview russian_hill) 23)
    (= (travel-time russian_hill bayview) 23)
    (= (john-window-start) 1050)     ;; 17:30 -> 17*60 + 30 = 1050
    (= (john-window-end) 1260)       ;; 21:00 -> 21*60 = 1260
    (= (meet-min-john) 75)
  )
  (:goal (and
    (met-john)
  ))
  (:metric minimize (current_time))
)