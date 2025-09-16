(define (domain meeting-scheduler)
  (:requirements :strips :typing :equality)
  (:types
    location
    person
    time
  )
  (:predicates
    (at-location ?person - person ?loc - location)
    (meeting-scheduled)
    (time-is ?t - time)
    (can-meet-at ?t - time)
  )
  (:action travel-to-north-beach
    :parameters (?person - person ?time1 - time ?time2 - time)
    :precondition (and 
      (at-location ?person richmond-district)
      (time-is ?time1)
      (can-meet-at ?time2)
    )
    :effect (and
      (at-location ?person north-beach)
      (not (at-location ?person richmond-district))
      (not (time-is ?time1))
      (time-is ?time2)
    )
  )
  (:action meet-john
    :parameters (?person - person ?time - time)
    :precondition (and
      (at-location ?person north-beach)
      (can-meet-at ?time)
    )
    :effect (and
      (meeting-scheduled)
    )
  )
)