(define (domain meeting-scheduling)
  (:requirements :strips :typing)
  (:types participant slot)
  (:predicates
    (available ?p - participant ?s - slot)
    (meeting-scheduled ?s - slot)
  )
  (:action schedule-meeting
    :parameters (?s - slot ?p1 - participant ?p2 - participant ?p3 - participant ?p4 - participant)
    :precondition (and
      (available ?p1 ?s)
      (available ?p2 ?s)
      (available ?p3 ?s)
      (available ?p4 ?s)
    )
    :effect (meeting-scheduled ?s)
  )
)