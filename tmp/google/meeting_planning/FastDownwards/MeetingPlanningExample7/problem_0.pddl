```lisp
(define (problem meet-john-problem)
  (:domain meeting-scheduler)
  
  (:objects
    Richmond - location
    NorthBeach - location
    myself john - person
  )
  
  (:init
    (= (current-time) 540) ; 09:00 AM
    (at-location myself Richmond)
    (= (travel-time-richmond->north) 17)
    (= (travel-time-north->richmond) 18)
    ;; John's availability from 03:15 PM (915 minutes) to 05:15 PM (1035 minutes)
    (can-meet 915)
    (can-meet 930)
    (can-meet 945)
    (can-meet 960)
    (can-meet 975)
    (can-meet 990)
    (can-meet 1005)
    (can-meet 1020)
    (can-meet 1035)
  )
  
  (:goal
    (meeting-scheduled)
  )
)
```