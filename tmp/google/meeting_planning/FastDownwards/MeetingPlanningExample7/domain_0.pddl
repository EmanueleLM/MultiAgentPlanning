```lisp
(define (domain meeting-scheduler)
  (:requirements :strips :durative-actions :typing)
  
  (:types
    location
    person
  )
  
  (:predicates
    (at-location ?person - person ?loc - location)
    (meeting-scheduled)
    (can-meet ?time - number)
  )
  
  (:functions
    (current-time)
  )
  
  ;; Agent 1: Myself
  (:durative-action travel-to-north-beach
    :parameters ()
    :duration (= ?duration (travel-time-richmond->north))
    :condition (at start (at-location myself Richmond))
    :effect (and
      (at end (at-location myself NorthBeach))
      (at end (not (at-location myself Richmond)))
      (increase (current-time) (travel-time-richmond->north))
    )
  )
  
  ;; Agent 2: Meeting John
  (:durative-action meet-john
    :parameters ()
    :duration (= ?duration 75)
    :condition (and
      (at start (at-location myself NorthBeach))
      (can-meet (current-time))
    )
    :effect (and
      (at end (meeting-scheduled))
      (increase (current-time) 75)
    )
  )
  
  ;; Travel time function
  (:functions
    (travel-time-richmond->north)
    (travel-time-north->richmond)
  )
)
```