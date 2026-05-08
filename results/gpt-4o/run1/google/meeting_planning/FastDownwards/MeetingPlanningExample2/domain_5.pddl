(define (domain sf_visit)
  (:requirements :strips :typing)
  
  (:types
    person location time)
  
  (:predicates
    (at ?p - person ?l - location)
    (visited ?l - location)
    (can_meet ?p1 - person ?p2 - person)
    (meeting_scheduled ?p1 - person ?p2 - person)
    (time_stage ?t - time)
    (next_time ?t1 - time ?t2 - time))
  
  (:action travel
    :parameters (?from - location ?to - location ?current_time - time ?next_time - time)
    :precondition (and (at you ?from)
                       (next_time ?current_time ?next_time))
    :effect (and (not (at you ?from))
                 (at you ?to)
                 (time_stage ?next_time)))
  
  (:action schedule_meeting_with_jessica
    :parameters (?start_time - time ?next_time - time ?end_time - time)
    :precondition (and (at you sunset_district)
                       (can_meet you jessica)
                       (next_time ?start_time ?next_time)
                       (time_stage ?end_time))
    :effect (and (meeting_scheduled you jessica)))
)