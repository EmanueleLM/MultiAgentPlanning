(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant timeslot)
  (:predicates
    (avail ?p - participant ?s - timeslot)
    (confirmed ?p - participant ?s - timeslot)
    (meeting-scheduled)
  )

  (:action confirm
    :parameters (?p - participant ?s - timeslot)
    :precondition (and (avail ?p ?s) (not (confirmed ?p ?s)))
    :effect (and (confirmed ?p ?s))
  )

  (:action schedule-meeting
    :parameters (?s - timeslot ?p1 - participant ?p2 - participant ?p3 - participant ?p4 - participant ?p5 - participant ?p6 - participant ?p7 - participant)
    :precondition (and
      (confirmed ?p1 ?s)
      (confirmed ?p2 ?s)
      (confirmed ?p3 ?s)
      (confirmed ?p4 ?s)
      (confirmed ?p5 ?s)
      (confirmed ?p6 ?s)
      (confirmed ?p7 ?s)
      (not (meeting-scheduled))
    )
    :effect (and (meeting-scheduled))
  )
)