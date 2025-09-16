(define (domain meeting-scheduler)
  (:requirements :strips :typing :equality)
  (:types
    location
    person
  )
  (:predicates
    (at-location ?person - person ?loc - location)
    (meeting-scheduled)
    (time-is ?time)
    (can-meet-at ?time)
  )
  (:action travel-to-north-beach
    :parameters (?person - person ?time1 ?time2)
    :precondition (and 
      (at-location ?person Richmond)
      (time-is ?time1)
      (can-meet-at ?time2)
    )
    :effect (and
      (at-location ?person NorthBeach)
      (not (at-location ?person Richmond))
      (not (time-is ?time1))
      (time-is ?time2)
    )
  )
  (:action meet-john
    :parameters (?person - person ?time)
    :precondition (and
      (at-location ?person NorthBeach)
      (can-meet-at ?time)
    )
    :effect (and
      (meeting-scheduled)
    )
  )
)