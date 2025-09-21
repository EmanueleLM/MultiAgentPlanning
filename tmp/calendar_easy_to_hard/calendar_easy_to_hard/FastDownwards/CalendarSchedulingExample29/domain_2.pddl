(define (domain meeting-scheduling-combined)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant slot)

  (:predicates
    (next ?s1 - slot ?s2 - slot)
    (slot-next ?s1 - slot ?s2 - slot)
    (free ?p - participant ?s - slot)
    (available ?p - participant ?s - slot)
    (busy ?p - participant ?s - slot)
    (scheduled)
    (meeting-scheduled)
    (meeting-start ?s - slot)
    (meeting-at ?s - slot)
  )

  (:action schedule_agent1
    :parameters (?s ?s2 - slot ?m ?d ?sh - participant)
    :precondition (and
      (next ?s ?s2)
      (free ?m ?s) (free ?m ?s2)
      (free ?d ?s) (free ?d ?s2)
      (free ?sh ?s) (free ?sh ?s2)
    )
    :effect (and
      (scheduled)
      (meeting-start ?s)
    )
  )

  (:action schedule_agent2
    :parameters (?s ?s2 - slot ?p1 ?p2 ?p3 - participant)
    :precondition (and
      (slot-next ?s ?s2)
      (available ?p1 ?s) (available ?p1 ?s2)
      (available ?p2 ?s) (available ?p2 ?s2)
      (available ?p3 ?s) (available ?p3 ?s2)
    )
    :effect (and
      (meeting-scheduled)
      (meeting-at ?s)
      (not (available ?p1 ?s)) (not (available ?p1 ?s2))
      (not (available ?p2 ?s)) (not (available ?p2 ?s2))
      (not (available ?p3 ?s)) (not (available ?p3 ?s2))
    )
  )

  (:action schedule_agent3
    :parameters (?s ?s2 - slot ?m ?d ?sh - participant)
    :precondition (and
      (next ?s ?s2)
      (not (busy ?m ?s)) (not (busy ?m ?s2))
      (not (busy ?d ?s)) (not (busy ?d ?s2))
      (not (busy ?sh ?s)) (not (busy ?sh ?s2))
      (not (meeting-scheduled))
    )
    :effect (and
      (meeting-scheduled)
      (meeting-at ?s)
    )
  )
)