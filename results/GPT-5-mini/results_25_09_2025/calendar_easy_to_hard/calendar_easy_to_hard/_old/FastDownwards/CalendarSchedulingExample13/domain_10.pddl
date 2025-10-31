(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions :equality)
  (:types person slot)
  (:predicates
    (free ?p - person ?s - slot)
    (meeting-scheduled)
    (scheduled-slot ?s - slot)
    (meeting-with ?p - person)
  )
  (:action schedule-meeting
    :parameters (?s - slot ?p1 - person ?p2 - person ?p3 - person ?p4 - person)
    :precondition (and
      (not (meeting-scheduled))
      (free ?p1 ?s) (free ?p2 ?s) (free ?p3 ?s) (free ?p4 ?s)
    )
    :effect (and
      (meeting-scheduled)
      (scheduled-slot ?s)
      (meeting-with ?p1) (meeting-with ?p2) (meeting-with ?p3) (meeting-with ?p4)
      (not (free ?p1 ?s)) (not (free ?p2 ?s)) (not (free ?p3 ?s)) (not (free ?p4 ?s))
    )
  )
)