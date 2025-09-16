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
    (john-at-location ?loc - location)
  )
  (:action travel-to-north-beach
    :parameters (?person - person ?time1 - time ?time2 - time)
    :precondition (and 
      (at-location ?person Richmond-District)
      (time-is ?time1)
      (can-meet-at ?time2)
    )
    :effect (and
      (at-location ?person North-Beach)
      (not (at-location ?person Richmond-District))
      (not (time-is ?time1))
      (time-is ?time2)
    )
  )
  (:action john-travel-to-north-beach
    :parameters (?time - time)
    :precondition (and
      (john-at-location North-Beach)
      (can-meet-at ?time)
    )
    :effect (and)
  )
  (:action meet-john
    :parameters (?person - person ?time - time)
    :precondition (and
      (at-location ?person North-Beach)
      (john-at-location North-Beach)
      (can-meet-at ?time)
    )
    :effect (and
      (meeting-scheduled)
    )
  )
)