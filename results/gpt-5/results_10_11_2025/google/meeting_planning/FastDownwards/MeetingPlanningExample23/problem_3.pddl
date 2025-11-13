(define (problem meetingplanningexample23-problem)
  (:domain meetingplanningexample23-numeric)
  (:objects
    bayview russian_hill - location
    john - person
  )
  (:init
    (at bayview)
    (known-location bayview)
    (known-location russian_hill)
    (= (current_time) 540)
    (= (travel-time bayview russian_hill) 23)
    (= (travel-time russian_hill bayview) 23)
    (= (john-window-start) 1050)
    (= (john-window-end) 1260)
    (= (meet-min-john) 75)
  )
  (:goal (and
    (met-john)
  ))
  (:metric minimize (current_time))
)