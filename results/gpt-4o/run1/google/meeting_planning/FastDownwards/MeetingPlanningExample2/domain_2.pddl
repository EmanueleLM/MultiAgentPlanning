(define (domain sf_visit)
  (:requirements :strips :typing :negative-preconditions)
  (:types person location time)
  (:predicates
    (at ?p - person ?l - location)
    (before ?t1 - time ?t2 - time)
    (can_meet ?p1 - person ?p2 - person ?t - time)
    (meeting_scheduled ?p1 - person ?p2 - person))

  (:action travel
    :parameters (?from - location ?to - location)
    :precondition (and (at you ?from))
    :effect (and (not (at you ?from)) (at you ?to)))

  (:action schedule_meeting_jessica
    :parameters (?start - time ?end - time)
    :precondition (and (at you sunset_district)
                       (before time_315pm ?start)
                       (before ?end time_815pm)
                       (before ?start ?end)
                       (can_meet you jessica ?start)
                       (can_meet you jessica ?end))
    :effect (meeting_scheduled you jessica))
)