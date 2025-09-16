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
    (travel-time-richmond->north)
    (travel-time-north->richmond)
  )
  (:durative-action travel-to-north-beach
    :parameters (?person - person)
    :duration (= ?duration (travel-time-richmond->north))
    :condition (at start (at-location ?person Richmond))
    :effect (and
      (at end (at-location ?person NorthBeach))
      (at end (not (at-location ?person Richmond)))
      (increase (current-time) (travel-time-richmond->north))
    )
  )
  (:durative-action meet-john
    :parameters (?person - person)
    :duration (= ?duration 75)
    :condition (and
      (at start (at-location ?person NorthBeach))
      (can-meet (current-time))
    )
    :effect (and
      (at end (meeting-scheduled))
      (increase (current-time) 75)
    )
  )
)