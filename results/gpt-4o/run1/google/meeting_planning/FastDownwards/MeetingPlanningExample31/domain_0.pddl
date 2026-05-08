(define (domain san_francisco_trip)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    location
    person
    time
  )
  (:predicates
    (at ?p - person ?l - location)
    (visited ?p - person)
    (can_travel ?from - location ?to - location)
    (time ?t - time)
    (at_location ?l - location)
    (before ?t1 - time ?t2 - time)
  )
  
  (:action travel
    :parameters (?from - location ?to - location ?departure_time - time ?arrival_time - time)
    :precondition (and 
      (can_travel ?from ?to) 
      (at_location ?from) 
      (time ?departure_time) 
      (before ?departure_time ?arrival_time)
    )
    :effect (and
      (at_location ?to)
      (not (at_location ?from))
      (not (time ?departure_time))
      (time ?arrival_time)
    )
  )
  
  (:action meet
    :parameters (?p - person ?l - location ?meeting_time - time ?end_time - time)
    :precondition (and
      (at ?p ?l)
      (at_location ?l)
      (time ?meeting_time)
      (before ?meeting_time ?end_time)
    )
    :effect (visited ?p)
  )
)