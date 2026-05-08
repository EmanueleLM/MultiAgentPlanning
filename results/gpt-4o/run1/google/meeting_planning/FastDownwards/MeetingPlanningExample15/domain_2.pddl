(define (domain meeting_friends_sf)
  (:requirements :strips :typing :negative-preconditions)
  
  (:types
    location
    person
    time_point)
  
  (:predicates
    (at ?person - person ?location - location ?time_point - time_point)
    (friend_available ?person - person ?location - location ?time_point - time_point)
    (can_travel ?from - location ?to - location ?start_time - time_point ?end_time - time_point)
    (meeting_scheduled ?person - person)
    (meeting_window_exists ?start_time - time_point ?end_time - time_point))

  (:action travel
    :parameters (?from - location ?to - location ?start_time - time_point ?end_time - time_point)
    :precondition (and
                    (at you ?from ?start_time)
                    (can_travel ?from ?to ?start_time ?end_time))
    :effect (and
              (not (at you ?from ?start_time))
              (at you ?to ?end_time)))

  (:action schedule_meeting
    :parameters (?start_time - time_point ?end_time - time_point)
    :precondition (and
                    (at you golden_gate_park ?start_time)
                    (friend_available john golden_gate_park ?start_time)
                    (meeting_window_exists ?start_time ?end_time))
    :effect (meeting_scheduled john))
)