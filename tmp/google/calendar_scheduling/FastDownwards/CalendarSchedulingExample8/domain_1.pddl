(define (domain integrated-scheduling)
  (:requirements :typing :strips :negative-preconditions :equality)
  (:types person slot meeting)
  (:predicates
    (is-slot ?s - slot)
    (is-meeting ?m - meeting)
    (meeting-participant ?m - meeting ?p - person)
    (available ?p - person ?s - slot)
    (free ?p - person ?s - slot)
    (busy ?p - person ?s - slot)
    (slot-free ?s - slot)
    (meeting_scheduled ?s - slot)
    (proposed ?s - slot)
    (proposal-made)
    (confirmation-requested ?p - person ?s - slot)
    (confirmed ?p - person ?s - slot)
  )

  (:action schedule-by-agent1
    :parameters (?m - meeting ?s - slot ?p1 - person ?p2 - person ?p3 - person)
    :precondition (and
      (is-meeting ?m)
      (is-slot ?s)
      (meeting-participant ?m ?p1) (meeting-participant ?m ?p2) (meeting-participant ?m ?p3)
      (not (= ?p1 ?p2)) (not (= ?p1 ?p3)) (not (= ?p2 ?p3))
      (available ?p1 ?s) (available ?p2 ?s) (available ?p3 ?s)
      (not (busy ?p1 ?s)) (not (busy ?p2 ?s)) (not (busy ?p3 ?s))
      (slot-free ?s)
    )
    :effect (and
      (meeting_scheduled ?s)
      (not (slot-free ?s))
    )
  )

  (:action schedule-by-agent2
    :parameters (?s - slot)
    :precondition (and
      (is-slot ?s)
      (free adam ?s)
      (free jerry ?s)
      (free matthew ?s)
      (not (busy adam ?s)) (not (busy jerry ?s)) (not (busy matthew ?s))
      (slot-free ?s)
    )
    :effect (and
      (meeting_scheduled ?s)
      (not (free adam ?s))
      (not (free jerry ?s))
      (not (free matthew ?s))
      (not (slot-free ?s))
    )
  )

  (:action propose-by-agent3
    :parameters (?s - slot)
    :precondition (and
      (is-slot ?s)
      (free matthew ?s)
      (slot-free ?s)
    )
    :effect (and
      (proposed ?s)
      (proposal-made)
      (confirmation-requested adam ?s)
      (confirmation-requested jerry ?s)
    )
  )

  (:action confirm-by-agent3
    :parameters (?p - person ?s - slot ?m - meeting)
    :precondition (and
      (meeting-participant ?m ?p)
      (proposed ?s)
      (confirmation-requested ?p ?s)
      (available ?p ?s)
      (not (busy ?p ?s))
    )
    :effect (confirmed ?p ?s)
  )

  (:action finalize-by-agent3
    :parameters (?s - slot ?m - meeting)
    :precondition (and
      (proposed ?s)
      (meeting-participant ?m adam) (meeting-participant ?m jerry) (meeting-participant ?m matthew)
      (confirmed adam ?s) (confirmed jerry ?s) (confirmed matthew ?s)
      (slot-free ?s)
    )
    :effect (and
      (meeting_scheduled ?s)
      (not (slot-free ?s))
    )
  )
)