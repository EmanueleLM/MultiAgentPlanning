(define (domain san_francisco_trip)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    location
    person
    time_point
  )
  (:predicates
    (at ?person - person ?location - location ?time - time_point)
    (can_travel ?from - location ?to - location ?departure_time - time_point ?arrival_time - time_point)
    (meeting_in_progress ?person - person ?location - location)
    (met_minimum_duration ?person - person)
  )
  (:action travel
    :parameters (?from - location ?to - location ?start_time - time_point ?arrive_time - time_point)
    :precondition (and
      (at you ?from ?start_time)
      (can_travel ?from ?to ?start_time ?arrive_time)
    )
    :effect (and
      (at you ?to ?arrive_time)
      (not (at you ?from ?start_time))
    )
  )
  (:action start_meeting
    :parameters (?person - person ?location - location ?start_time - time_point)
    :precondition (and
      (at you ?location ?start_time)
      (at ?person ?location ?start_time)
      (not (meeting_in_progress ?person ?location))
    )
    :effect (meeting_in_progress ?person ?location)
  )
  (:action maintain_meeting_duration
    :parameters (?person - person ?location - location ?start_time - time_point ?end_time - time_point)
    :precondition (and
      (meeting_in_progress ?person ?location)
      (at ?person ?location ?end_time)
      (can_travel ?location ?location ?start_time ?end_time)
    )
    :effect (met_minimum_duration ?person)
  )
  (:action end_meeting
    :parameters (?person - person ?location - location ?end_time - time_point)
    :precondition (and
      (meeting_in_progress ?person ?location)
      (at ?person ?location ?end_time)
    )
    :effect (and
      (not (meeting_in_progress ?person ?location))
    )
  )
)