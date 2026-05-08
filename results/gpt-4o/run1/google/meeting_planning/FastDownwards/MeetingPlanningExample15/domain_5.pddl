(define (domain meeting_friends_sf)
  (:requirements :strips :typing :negative-preconditions)

  (:types 
    location
    person
    time_point)
  
  (:predicates
    (at_location ?person - person ?location - location)
    (available ?person - person ?location - location ?time - time_point)
    (meeting_set ?person - person)
    (can_travel ?from - location ?to - location ?departure - time_point ?arrival - time_point)
    (at_time ?time - time_point)
    (before ?t1 - time_point ?t2 - time_point))

  (:action travel
    :parameters (?from - location ?to - location ?departure - time_point ?arrival - time_point)
    :precondition (and
                    (at_location you ?from)
                    (at_time ?departure)
                    (can_travel ?from ?to ?departure ?arrival))
    :effect (and
              (not (at_location you ?from))
              (at_location you ?to)
              (not (at_time ?departure))
              (at_time ?arrival)))

  (:action meet_john
    :parameters (?start - time_point ?end - time_point)
    :precondition (and
                    (at_location you golden_gate_park)
                    (available john golden_gate_park ?start)
                    (available john golden_gate_park ?end)
                    (at_time ?start)
                    (before ?start ?end))
    :effect (meeting_set john))
)