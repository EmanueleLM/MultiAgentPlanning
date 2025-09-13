(define (domain CalendarScheduling)
  (:requirements :strips :typing :multi-agent)
  (:types person time)
  (:predicates
    (available ?p - person ?t - time)
    (meeting_scheduled ?p - person))
  (:action set_meeting
    :parameters (?p1 ?p2 ?p3 - person ?t - time)
    :precondition (and
      (available ?p1 ?t)
      (available ?p2 ?t)
      (available ?p3 ?t))
    :effect (and
      (meeting_scheduled ?p1)
      (meeting_scheduled ?p2)
      (meeting_scheduled ?p3))))