(define (domain calendar_scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types person timeslot)
  (:constants
    jacob gabriel matthew - person
  )
  (:predicates
    (busy ?p - person ?s - timeslot)
    (next ?s1 ?s2 - timeslot)
    (meeting_scheduled)
  )
  (:action schedule_1h_meeting
    :parameters (?s1 ?s2 - timeslot)
    :precondition (and
      (next ?s1 ?s2)
      (not (busy jacob ?s1))
      (not (busy jacob ?s2))
      (not (busy gabriel ?s1))
      (not (busy gabriel ?s2))
      (not (busy matthew ?s1))
      (not (busy matthew ?s2))
    )
    :effect (meeting_scheduled)
  )
)