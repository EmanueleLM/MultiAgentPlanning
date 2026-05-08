(define (domain san_francisco_trip)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    location
    person
    time
  )
  (:predicates
    (at ?person - person ?location - location ?time - time)
    (can_travel ?from - location ?to - location ?departure_time - time ?arrival_time - time)
    (meeting ?person - person ?location - location ?start_time - time)
    (finished_meeting ?person - person ?location - location ?end_time - time)
    (met_minimum_duration ?person - person ?location - location)
  )
  (:action travel
    :parameters (?from - location ?to - location ?start_time - time ?arrive_time - time)
    :precondition (can_travel ?from ?to ?start_time ?arrive_time)
    :effect (and
      (at you ?to ?arrive_time)
      (not (at you ?from ?start_time))
    )
  )
  (:action start_meeting
    :parameters (?person - person ?location - location ?start_time - time)
    :precondition (and
      (at you ?location ?start_time)
      (at ?person ?location ?start_time)
    )
    :effect (meeting ?person ?location ?start_time)
  )
  (:action end_meeting
    :parameters (?person - person ?location - location ?end_time - time)
    :precondition (and
      (meeting ?person ?location ?end_time)
      (at ?person ?location ?end_time)
    )
    :effect (and
      (finished_meeting ?person ?location ?end_time)
      (met_minimum_duration ?person ?location)
      (not (meeting ?person ?location ?end_time))
    )
  )
)